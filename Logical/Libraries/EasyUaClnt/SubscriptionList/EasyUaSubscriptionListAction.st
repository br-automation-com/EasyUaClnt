// CHECK INPUT PARAMETERS
// The parameters are checked, not to return an error but to put default values in the case the
// input was left empty.
ACTION EasyUaSubscriptionList_CheckParameters:
	// If the pSessionConnectInfo is left empty then Anonymous login is used by default
	IF ADR(pSessionConnectInfo) = 0 THEN
		Internal.UA_Connect_0.SessionConnectInfo.SecurityMsgMode := UASMM_None;
		Internal.UA_Connect_0.SessionConnectInfo.SecurityPolicy := UASP_None;
		Internal.UA_Connect_0.SessionConnectInfo.TransportProfile := UATP_UATcp;
		Internal.UA_Connect_0.SessionConnectInfo.UserIdentityToken.UserIdentityTokenType := UAUITT_Anonymous;
		Internal.UA_Connect_0.SessionConnectInfo.SessionTimeout := T#1m;			
		Internal.UA_Connect_0.SessionConnectInfo.MonitorConnection := T#10s;
	ELSE
		Internal.UA_Connect_0.SessionConnectInfo := pSessionConnectInfo;
	END_IF;
	
	// Assign inputs to the corresponding internal FUBs
	// Only 1 NamespaceUri is allowed
	Internal.UA_Connect_0.ServerEndpointUrl := ServerEndpointUrl;
	Internal.UA_NamespaceGetIndexList_0.NamespaceUris[0] := NamespaceUri;
	Internal.UA_NamespaceGetIndexList_0.NamespaceUrisCount := 1;
	Internal.UA_NodeGetHandleList_0.NodeIDs := NodeIDs;
	IF Priority = 0 THEN
		Internal.UA_SubscriptionCreate_0.Priority := 10;
	ELSE
		Internal.UA_SubscriptionCreate_0.Priority := Priority;
	END_IF;
	Internal.UA_MonitoredItemAddList_0.SyncMode := UAMS_FwSync;
	IF ADR(pNodeAddInfos) = 0 THEN
		FOR Internal.Idx := 0 TO MAX_INDEX_MONITORLIST DO
			Internal.UA_MonitoredItemAddList_0.NodeAddInfos[Internal.Idx].AttributeID := UAAI_Value;
			Internal.UA_MonitoredItemAddList_0.NodeAddInfos[Internal.Idx].IndexRangeCount := 0;	
		END_FOR;
	ELSE
		Internal.UA_MonitoredItemAddList_0.NodeAddInfos := pNodeAddInfos;
	END_IF;
	IF ADR(pMonitoringSettings) = 0 THEN
		FOR Internal.Idx := 0 TO MAX_INDEX_MONITORLIST DO
			Internal.MonitoringParameter[Internal.Idx].SamplingInterval := T#10ms;
		END_FOR;
	ELSE
		Internal.MonitoringParameter := pMonitoringSettings;
	END_IF;
	
	// Initialize internal variables for program flow
	IF PublishingInterval = 0 THEN
		Internal.PublishingInterval := T#10ms;
	ELSE
		Internal.PublishingInterval := PublishingInterval;
	END_IF;
	Internal.SubscriptionListActive := FALSE;
	Internal.NodeIDCount := NodeIDCount;
	Internal.ParametersValid := TRUE;	
	Internal.Executing := TRUE;
	Internal.StatusID := 0;
	brsmemset(ADR(Internal.NodeStatusIDs), 0, SIZEOF(Internal.NodeStatusIDs));
	brsmemset(ADR(Internal.MonitorStatusIDs), 0, SIZEOF(Internal.MonitorStatusIDs));
	
	// Initialize outputs
	Active := TRUE;
	Error := FALSE;
	StatusID := 0;
	brsmemset(ADR(NodeStatusIDs), 0, SIZEOF(NodeStatusIDs));
	brsmemset(ADR(MonitorStatusIDs), 0, SIZEOF(MonitorStatusIDs));
	SubscriptionListActive := FALSE;
	brsmemset(ADR(ValuesChanged), 0, SIZEOF(ValuesChanged));
	brsmemset(ADR(MinLostValueCount), 0, SIZEOF(MinLostValueCount));
END_ACTION

// CYCLIC CODE
// The main program is inside this ACTION. It connects to the server, reads the variable value, and disconnects
ACTION EasyUaSubscriptionList_CyclicCode:
	
	CASE Internal.Step OF
		0: // Connect to the OPC UA server
			Internal.UA_Connect_0(Execute := TRUE, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_Connect_0.Busy = FALSE) THEN
				IF (Internal.UA_Connect_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					Internal.ConnectionHdl := Internal.UA_Connect_0.ConnectionHdl;
					Internal.Step := 10; 
				END_IF;
				IF (Internal.UA_Connect_0.Error = TRUE) THEN
					Internal.StatusID := Internal.UA_Connect_0.ErrorID;
					Internal.ConnectionHdl := 0;
					Internal.Step := 251; 
				END_IF;
				Internal.UA_Connect_0(Execute := FALSE);
			END_IF;
		
		10: // Select method to obtain or complete the NodeID
			IF Internal.UA_NamespaceGetIndexList_0.NamespaceUris[0] <> '' THEN
				Internal.Step := 20;
			ELSE
				Internal.Step := 40;
			END_IF;
			
		20: // Get NamespaceIndex using the NamespaceUri
			Internal.UA_NamespaceGetIndexList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NamespaceGetIndexList_0.Busy = FALSE) THEN
				IF (Internal.UA_NamespaceGetIndexList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.NodeStatusIDs), 0, SIZEOF(Internal.NodeStatusIDs));
					Internal.Step := 21;
				END_IF;
				IF (Internal.UA_NamespaceGetIndexList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_NamespaceGetIndexList_0.ErrorID;
					Internal.NodeStatusIDs[0] := Internal.UA_NamespaceGetIndexList_0.ErrorIDs[0]; 
					Internal.Step := 251; 
				END_IF;
				Internal.UA_NamespaceGetIndexList_0(Execute := FALSE);
			END_IF;
		
		21: // Complete NodeIDs NamespaceIndexes using the NamespaceIndexes obtained with UA_NamespaceGetIndexList
			FOR Internal.Idx := 0 TO MAX_INDEX_NODELIST DO
				IF Internal.UA_NodeGetHandleList_0.NodeIDs[Internal.Idx].Identifier <> '' THEN
					Internal.UA_NodeGetHandleList_0.NodeIDs[Internal.Idx].NamespaceIndex := Internal.UA_NamespaceGetIndexList_0.NamespaceIndexes[0];
				ELSE
					EXIT;
				END_IF;
			END_FOR;
			Internal.Step := 40;
			
		40: // Count number of NodeIDs
			Internal.UA_NodeGetHandleList_0.NodeIDCount := 0;
			FOR Internal.Idx := 0 TO MAX_INDEX_NODELIST DO
				IF Internal.UA_NodeGetHandleList_0.NodeIDs[Internal.Idx].Identifier <> '' THEN
					Internal.UA_NodeGetHandleList_0.NodeIDCount := Internal.UA_NodeGetHandleList_0.NodeIDCount + 1;
				ELSE
					EXIT;
				END_IF;
			END_FOR;
			IF Internal.NodeIDCount <= Internal.UA_NodeGetHandleList_0.NodeIDCount THEN
				Internal.UA_NodeGetHandleList_0.NodeIDCount := Internal.NodeIDCount;
			END_IF;
			Internal.Step := 41;
		
		41: // Get NodeHdls
			Internal.UA_NodeGetHandleList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NodeGetHandleList_0.Busy = FALSE) THEN
				IF (Internal.UA_NodeGetHandleList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.NodeStatusIDs), 0, SIZEOF(Internal.NodeStatusIDs));
					Internal.UA_MonitoredItemAddList_0.NodeHdls := Internal.UA_NodeGetHandleList_0.NodeHdls;
					Internal.UA_NodeReleaseHandleList_0.NodeHdls := Internal.UA_NodeGetHandleList_0.NodeHdls;
					Internal.Step := 50; 
				END_IF;
				IF (Internal.UA_NodeGetHandleList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_NodeGetHandleList_0.ErrorID;
					Internal.NodeStatusIDs := Internal.UA_NodeGetHandleList_0.NodeErrorIDs;
					Internal.Step := 251; 
				END_IF;
				Internal.UA_NodeGetHandleList_0(Execute := FALSE);
			END_IF;
			
		50: // Count NodeHdls
			Internal.UA_MonitoredItemAddList_0.NodeHdlCount := 0;
			FOR Internal.Idx := 0 TO MAX_INDEX_NODELIST DO
				IF Internal.UA_NodeGetHandleList_0.NodeHdls[Internal.Idx] <> 0 THEN
					Internal.UA_MonitoredItemAddList_0.NodeHdlCount := Internal.UA_MonitoredItemAddList_0.NodeHdlCount + 1;
				ELSE
					EXIT;
				END_IF;
			END_FOR;
			Internal.UA_NodeReleaseHandleList_0.NodeHdlCount := Internal.UA_MonitoredItemAddList_0.NodeHdlCount;
			Internal.Step := 51;
			
		51: // Create Subscription
			Internal.UA_SubscriptionCreate_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, PublishingEnable := TRUE, Timeout := EASYUA_EXECUTE_TIMEOUT, PublishingInterval := Internal.PublishingInterval);
			IF (Internal.UA_SubscriptionCreate_0.Busy = FALSE) THEN
				IF (Internal.UA_SubscriptionCreate_0.Done = TRUE) THEN
					Internal.StatusID := 0;
					Internal.UA_MonitoredItemAddList_0.SubscriptionHdl := Internal.UA_SubscriptionCreate_0.SubscriptionHdl;
					Internal.UA_MonitoredItemRemoveList_0.SubscriptionHdl := Internal.UA_SubscriptionCreate_0.SubscriptionHdl;
					Internal.UA_SubscriptionDelete_0.SubscriptionHdl := Internal.UA_SubscriptionCreate_0.SubscriptionHdl;
					Internal.Step := 60;
				END_IF;
				IF (Internal.UA_SubscriptionCreate_0.Error = TRUE) THEN
					Internal.StatusID := Internal.UA_SubscriptionCreate_0.ErrorID;
					Internal.Step := 251;
				END_IF;
				Internal.UA_SubscriptionCreate_0(Execute := FALSE, PublishingInterval := Internal.PublishingInterval);
			END_IF;
		
		60: // Monitored add list
			Internal.UA_MonitoredItemAddList_0(Execute := TRUE, Timeout := EASYUA_EXECUTE_TIMEOUT, Variables := Variables, MonitoringParameter := Internal.MonitoringParameter,
			ValuesChanged := ValuesChanged, MinLostValueCount := MinLostValueCount);
			IF (Internal.UA_MonitoredItemAddList_0.Busy = FALSE) THEN
				IF (Internal.UA_MonitoredItemAddList_0.Done = TRUE) THEN
					Internal.StatusID := 0;
					brsmemset(ADR(Internal.MonitorStatusIDs), 0, SIZEOF(Internal.MonitorStatusIDs));
					Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdls := Internal.UA_MonitoredItemAddList_0.MonitoredItemHdls;
					Internal.Step := 61;
				END_IF;
				IF (Internal.UA_MonitoredItemAddList_0.Error = TRUE) THEN
					Internal.StatusID := Internal.UA_MonitoredItemAddList_0.ErrorID;
					Internal.MonitorStatusIDs := Internal.UA_MonitoredItemAddList_0.NodeErrorIDs;
					Internal.Step := 251;
				END_IF;
				Internal.UA_MonitoredItemAddList_0(Execute := FALSE, Variables := Variables, MonitoringParameter := Internal.MonitoringParameter,
				ValuesChanged := ValuesChanged, MinLostValueCount := MinLostValueCount); 
			END_IF;
		
		61: // Count MonitoredItemHdl
			Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdlCount := 0;
			FOR Internal.Idx := 0 TO MAX_INDEX_MONITORLIST DO
				IF Internal.UA_MonitoredItemAddList_0.MonitoredItemHdls[Internal.Idx] <> 0 THEN
	  				Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdlCount := Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdlCount + 1;
				END_IF;
			END_FOR;
			Internal.Step := 70;
		
		70: // Subscription active
			// Here only listeting to a possible disable of the FUB
			// If FUB is disabled then the disabling sequence starts
			Internal.SubscriptionListActive := TRUE;
			EasyUaSubscriptionList_SetSubscriptionListActive;
			IF Enable = FALSE THEN
				Internal.Step := 80;
			END_IF;
			
		80: // Remove monitored items
			IF Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdls[0] <> 0 THEN
				Internal.UA_MonitoredItemRemoveList_0(Execute := TRUE, Timeout := T#100ms);
				IF Internal.UA_MonitoredItemRemoveList_0.Busy = 0 THEN
					brsmemset(ADR(Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdls),0,SIZEOF(Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdls));
					Internal.Step := 81;
					Internal.SubscriptionListActive := FALSE;
					EasyUaSubscriptionList_SetSubscriptionListActive;
					Internal.UA_MonitoredItemRemoveList_0(Execute := FALSE);
				END_IF;
			ELSE
				Internal.SubscriptionListActive := FALSE;
				EasyUaSubscriptionList_SetSubscriptionListActive;
				Internal.Step := 81;
			END_IF;
			
		81: // Delete subscription
			IF Internal.UA_SubscriptionDelete_0.SubscriptionHdl <> 0 THEN
				Internal.UA_SubscriptionDelete_0(Execute := TRUE, Timeout := T#100ms);
				IF Internal.UA_SubscriptionDelete_0.Busy = 0 THEN
					Internal.UA_MonitoredItemAddList_0.SubscriptionHdl := 0;
					Internal.UA_MonitoredItemRemoveList_0.SubscriptionHdl := 0;
					Internal.UA_SubscriptionDelete_0.SubscriptionHdl := 0;
					Internal.Step := 82;
					Internal.UA_SubscriptionDelete_0(Execute := FALSE);
				END_IF;
			ELSE
				Internal.Step := 82;
			END_IF;
			
		82: // Release node handlers
			IF Internal.UA_NodeReleaseHandleList_0.NodeHdls[0] <> 0 THEN
				Internal.UA_NodeReleaseHandleList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := T#100ms);
				IF Internal.UA_NodeReleaseHandleList_0.Busy = 0 THEN
					brsmemset(ADR(Internal.UA_NodeReleaseHandleList_0.NodeHdls),0,SIZEOF(Internal.UA_NodeReleaseHandleList_0.NodeHdls));
					Internal.Step := 83;
					Internal.UA_NodeReleaseHandleList_0(Execute := FALSE);
				END_IF;
			ELSE
				Internal.Step := 83;
			END_IF;
			
		83: // Disconnect from the server
			IF Internal.ConnectionHdl <> 0 THEN
				Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := T#100ms);
				IF Internal.UA_Disconnect_0.Busy = 0 THEN
					Internal.ConnectionHdl := 0;
					Internal.Step := 84;
					Internal.UA_Disconnect_0(Execute := FALSE);
				END_IF;
			ELSE
				Internal.Step := 84;
			END_IF;
			
		84: // Stops the execution
			Internal.Executing := FALSE;
		
		251: // Remove monitored items in case of error
			Internal.UA_MonitoredItemRemoveList_0(Execute := TRUE, Timeout := T#100ms);
			IF (Internal.UA_MonitoredItemRemoveList_0.Busy = 0) THEN
				brsmemset(ADR(Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdls),0,SIZEOF(Internal.UA_MonitoredItemRemoveList_0.MonitoredItemHdls));
				Internal.SubscriptionListActive := FALSE;
				EasyUaSubscriptionList_SetSubscriptionListActive;
				Internal.Step := 252;
				Internal.UA_MonitoredItemRemoveList_0(Execute := FALSE);
			END_IF;
			
		252: // Delete subscription in case of error
			Internal.UA_SubscriptionDelete_0(Execute := TRUE, Timeout := T#100ms);
			IF (Internal.UA_SubscriptionDelete_0.Busy = 0) THEN
				Internal.UA_MonitoredItemAddList_0.SubscriptionHdl := 0;
				Internal.UA_MonitoredItemRemoveList_0.SubscriptionHdl := 0;
				Internal.UA_SubscriptionDelete_0.SubscriptionHdl := 0;
				Internal.Step := 253;
				Internal.UA_SubscriptionDelete_0(Execute := FALSE);
			END_IF;
			
		253: // Release node handlers in case of error
			Internal.UA_NodeReleaseHandleList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := T#100ms);
			IF (Internal.UA_NodeReleaseHandleList_0.Busy = 0) THEN
				brsmemset(ADR(Internal.UA_NodeReleaseHandleList_0.NodeHdls),0,SIZEOF(Internal.UA_NodeReleaseHandleList_0.NodeHdls));
				Internal.Step := 254;
				Internal.UA_NodeReleaseHandleList_0(Execute := FALSE);
			END_IF;
		
		254: // Disconnects from the server in case of error
			Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := T#100ms);
			IF (Internal.UA_Disconnect_0.Busy = 0) THEN
				Internal.ConnectionHdl := 0;
				Internal.Step := 255;
				Internal.UA_Disconnect_0(Execute := FALSE);
			END_IF;
		
		255: // Error state
			Internal.Executing := FALSE;
			EasyUaSubscriptionList_SetError;
	END_CASE;
END_ACTION

// SET SUBSCRIPTION ACTIVE
ACTION EasyUaSubscriptionList_SetSubscriptionListActive:
	SubscriptionListActive := Internal.SubscriptionListActive;
END_ACTION

// SET ERROR
ACTION EasyUaSubscriptionList_SetError:
	Error := TRUE;
	StatusID := Internal.StatusID;
	NodeStatusIDs := Internal.NodeStatusIDs;
	MonitorStatusIDs := Internal.MonitorStatusIDs;
END_ACTION
	
// RESET INTERNAL
// Reset all the internal data for further executions
ACTION EasyUaSubscriptionList_ResetInternal:
	Internal.UA_Connect_0(Execute:=FALSE);
	Internal.UA_NamespaceGetIndexList_0(Execute:=FALSE);
	Internal.UA_NodeGetHandleList_0(Execute:=FALSE);
	Internal.UA_SubscriptionCreate_0(Execute := FALSE, PublishingInterval := Internal.PublishingInterval);
	Internal.UA_MonitoredItemAddList_0(Execute := FALSE, Variables := Variables, MonitoringParameter := Internal.MonitoringParameter,
	ValuesChanged := ValuesChanged, MinLostValueCount := MinLostValueCount); 	
	Internal.UA_MonitoredItemRemoveList_0(Execute := FALSE);
	Internal.UA_SubscriptionDelete_0(Execute := FALSE);
	Internal.UA_NodeReleaseHandleList_0(Execute:=FALSE);
	Internal.UA_Disconnect_0(Execute:=FALSE);
	brsmemset(ADR(Internal), 0, SIZEOF(Internal));
END_ACTION

// RESET OUTPUTS
// Reset all the outputs for further executions
ACTION EasyUaSubscriptionList_ResetOutputs:
	Active := FALSE;
	Error := FALSE;
	StatusID := 0;
	brsmemset(ADR(NodeStatusIDs), 0, SIZEOF(NodeStatusIDs));
	brsmemset(ADR(MonitorStatusIDs), 0, SIZEOF(MonitorStatusIDs));
	SubscriptionListActive := FALSE;
	brsmemset(ADR(ValuesChanged), 0, SIZEOF(ValuesChanged));
	brsmemset(ADR(MinLostValueCount), 0, SIZEOF(MinLostValueCount));
END_ACTION