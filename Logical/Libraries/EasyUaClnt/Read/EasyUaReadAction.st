// CHECK INPUT PARAMETERS
// The parameters are checked, not to return an error but to put default values in the case the
// input was left empty.
ACTION EasyUaRead_CheckParameters:
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
	
	// If pNodeAddInfo is left empty the value us used by default
	IF ADR(pNodeAddInfo) = 0 THEN
		Internal.UA_ReadList_0.NodeAddInfo[0].AttributeID := UAAI_Value;
		Internal.UA_ReadList_0.NodeAddInfo[0].IndexRangeCount := 0;	
	ELSE
		Internal.UA_ReadList_0.NodeAddInfo[0] := pNodeAddInfo;
	END_IF;
	
	// Assign inputs to the corresponding internal FUBs
	// Only 1 NamespaceUri and 1 node allowed
	Internal.UA_Connect_0.ServerEndpointUrl := ServerEndpointUrl;
	Internal.UA_NamespaceGetIndexList_0.NamespaceUris[0] := NamespaceUri;
	Internal.UA_NamespaceGetIndexList_0.NamespaceUrisCount := 1;
	Internal.UA_NodeGetHandleList_0.NodeIDs[0] := NodeID;
	Internal.UA_NodeGetHandleList_0.NodeIDCount := 1;
	Internal.UA_ReadList_0.NodeHdlCount := 1;
	Internal.UA_NodeReleaseHandleList_0.NodeHdlCount := 1;
	
	// Initialize internal variables for program flow
	Internal.Variables[0] := Variable;
	Internal.NodeIDCount := 1;
	Internal.KeepConnection := KeepConnection;
	Internal.ParametersValid := TRUE;	
	Internal.Executing := TRUE;
	Internal.StatusID := 0;
	brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
	
	// Initialize outputs
	Done := FALSE;
	Busy := TRUE;
	Active := TRUE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
END_ACTION

// CYCLIC CODE
// The main program is inside this ACTION. It connects to the server, reads the variable value, and disconnects
ACTION EasyUaRead_CyclicCode:
	
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
					Internal.Step := 253; 
				END_IF;
				Internal.UA_Connect_0(Execute := FALSE);
			END_IF;
		
		10: // Select method to obtain or complete the NodeID
			IF Internal.UA_NamespaceGetIndexList_0.NamespaceUris[0] <> '' THEN
				Internal.Step := 20;
			ELSE
				Internal.Step := 41;
			END_IF;
			
		20: // Get NamespaceIndex using the NamespaceUri
			Internal.UA_NamespaceGetIndexList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NamespaceGetIndexList_0.Busy = FALSE) THEN
				IF (Internal.UA_NamespaceGetIndexList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
					Internal.UA_NodeGetHandleList_0.NodeIDs[0].NamespaceIndex := Internal.UA_NamespaceGetIndexList_0.NamespaceIndexes[0];
					Internal.Step := 41;
				END_IF;
				IF (Internal.UA_NamespaceGetIndexList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_NamespaceGetIndexList_0.ErrorID;
					Internal.StatusIDs[0] := Internal.UA_NamespaceGetIndexList_0.ErrorIDs[0]; 
					Internal.Step := 253; 
				END_IF;
				Internal.UA_NamespaceGetIndexList_0(Execute := FALSE);
			END_IF;
	
		41: // Get NodeHdls
			Internal.UA_NodeGetHandleList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NodeGetHandleList_0.Busy = FALSE) THEN
				IF (Internal.UA_NodeGetHandleList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
					Internal.UA_ReadList_0.NodeHdls := Internal.UA_NodeGetHandleList_0.NodeHdls;
					Internal.UA_NodeReleaseHandleList_0.NodeHdls := Internal.UA_NodeGetHandleList_0.NodeHdls;
					Internal.Step := 51; 
				END_IF;
				IF (Internal.UA_NodeGetHandleList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_NodeGetHandleList_0.ErrorID;
					Internal.StatusIDs := Internal.UA_NodeGetHandleList_0.NodeErrorIDs;
					Internal.Step := 253; 
				END_IF;
				Internal.UA_NodeGetHandleList_0(Execute := FALSE);
			END_IF;
			
		51: // Read nodes
			Internal.UA_ReadList_0(Execute := TRUE, Variables := Internal.Variables, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_ReadList_0.Busy = FALSE) THEN
				IF (Internal.UA_ReadList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
					Internal.TimeStamps := Internal.UA_ReadList_0.TimeStamps;
					Internal.Step := 52; 
				END_IF;
				IF (Internal.UA_ReadList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_ReadList_0.ErrorID;
					Internal.StatusIDs := Internal.UA_ReadList_0.NodeErrorIDs;
					Internal.TimeStamps := Internal.UA_ReadList_0.TimeStamps;
					Internal.Step := 253; 
				END_IF;
				Internal.UA_ReadList_0(Execute := FALSE, Variables := Internal.Variables);
			END_IF;
		
		52: // Check KeepConnection
			Internal.KeepConnection := KeepConnection;
			IF Internal.KeepConnection = TRUE THEN
				Internal.Step := 53; 
			ELSE
				Internal.Step := 60; 
			END_IF;
			
		53: // Check Execute
			// When a positive flange is detected in the Execute while using KeepConnection
			// The main command is launched again without terminating the connection before
			// If the number of nodes to handle has changed then a special treatment is done
			// In the case that the number of nodes to handle is less than the number of current
			// obtained handlers then we just perform the operation. In the case the number of nodes
			// to handle is greater than the current nubmer of handlers then the current handlers are 
			// released and the new ones are obtained
			IF Execute = FALSE THEN
				brsmemset(ADR(Internal.TimeStamps), 0, SIZEOF(Internal.TimeStamps));
			END_IF;
			EasyUaRead_SetTimeStamp;
			EasyUaRead_SetDone;
			IF Execute = TRUE AND Internal.ExecuteOld = FALSE THEN
				EasyUaRead_SetBusy;
				Internal.Variables[0] := Variable;
				// If the number of nodes is greater than the current number of handlers obtained
				// it is necessary to get the new list of handlers. For this is necessary to release
				// the current ones and get the new ones
				IF brsmemcmp(ADR(NodeID), ADR(Internal.UA_NodeGetHandleList_0.NodeIDs[0]), SIZEOF(UANodeID)) = 0 THEN
					Internal.Step := 51; // Go to read state
				ELSE
					// Update NodeID in the case the node has changed
					Internal.UA_NodeGetHandleList_0.NodeIDs[0] := NodeID;
					Internal.Step := 60;
				END_IF;
			END_IF;
			
		60: // Release nodes
			Internal.UA_NodeReleaseHandleList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NodeReleaseHandleList_0.Busy = FALSE) THEN
				IF (Internal.UA_NodeReleaseHandleList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
					brsmemset(ADR(Internal.UA_ReadList_0.NodeHdls),0,SIZEOF(Internal.UA_ReadList_0.NodeHdls));
					brsmemset(ADR(Internal.UA_NodeReleaseHandleList_0.NodeHdls),0,SIZEOF(Internal.UA_NodeReleaseHandleList_0.NodeHdls));
					Internal.Step := 61;
				END_IF;
				IF (Internal.UA_NodeReleaseHandleList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_NodeReleaseHandleList_0.ErrorID;
					Internal.StatusIDs := Internal.UA_NodeReleaseHandleList_0.NodeErrorIDs;
					Internal.Step := 253;
				END_IF;
				Internal.UA_NodeReleaseHandleList_0(Execute := FALSE);
			END_IF;
			
		61: // Check KeepConnection
			// If KeepConnection is TRUE then we go back to get the handlers of the nodes
			// If not the connection is terminated
			IF Internal.KeepConnection = TRUE THEN
				Internal.Step := 41; 
			ELSE
				Internal.Step := 70; 
			END_IF;
		
		70: // Disconnect from the server
			Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_Disconnect_0.Busy = FALSE) THEN
				Internal.StatusID := 0;
				Internal.ConnectionHdl := 0;
				Internal.Step := 100;
				Internal.UA_Disconnect_0(Execute := FALSE);
			END_IF;
			
		100: // Done without errors
			EasyUaRead_SetTimeStamp;
			Internal.Executing := FALSE;
			EasyUaRead_SetDone;
		
		253: // Release nodes if an error occurs
			Internal.UA_NodeReleaseHandleList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NodeReleaseHandleList_0.Busy = FALSE) THEN
				brsmemset(ADR(Internal.UA_ReadList_0.NodeHdls),0,SIZEOF(Internal.UA_ReadList_0.NodeHdls));
				brsmemset(ADR(Internal.UA_NodeReleaseHandleList_0.NodeHdls),0,SIZEOF(Internal.UA_NodeReleaseHandleList_0.NodeHdls));
				Internal.Step := 254;
				Internal.UA_NodeReleaseHandleList_0(Execute := FALSE);
			END_IF;
			
		254: // Disconnect from the server if an error occurs
			Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl);
			IF (Internal.UA_Disconnect_0.Busy = FALSE) THEN
				Internal.ConnectionHdl := 0;
				Internal.Step := 255;
				Internal.UA_Disconnect_0(Execute := FALSE);
			END_IF;
			
		255: // Error state
			EasyUaRead_SetTimeStamp;
			Internal.Executing := FALSE;
			EasyUaRead_SetError;
	END_CASE;
END_ACTION

// SET TIMESTAMP
ACTION EasyUaRead_SetTimeStamp:
	TimeStamp := Internal.TimeStamps[0];
END_ACTION

// SET ERROR
ACTION EasyUaRead_SetError:
	Busy := FALSE;
	Done := FALSE;
	Error := TRUE;
	StatusID := Internal.StatusID;
	StatusIDs := Internal.StatusIDs[0];
END_ACTION

// SET DONE
ACTION EasyUaRead_SetDone:
	Done := TRUE;
	Busy := FALSE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
END_ACTION

// SET BUSY 
ACTION EasyUaRead_SetBusy:
	Done := FALSE;
	Busy := TRUE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
END_ACTION
	
// RESET INTERNAL
// Reset all the internal data for further executions
ACTION EasyUaRead_ResetInternal:
	Internal.UA_Connect_0(Execute:=FALSE);
	Internal.UA_NamespaceGetIndexList_0(Execute:=FALSE);
	Internal.UA_NodeGetHandleList_0(Execute:=FALSE);
	Internal.UA_ReadList_0(Execute:=FALSE, Variables:=Internal.Variables);
	Internal.UA_NodeReleaseHandleList_0(Execute:=FALSE);
	Internal.UA_Disconnect_0(Execute:=FALSE);
	brsmemset(ADR(Internal), 0, SIZEOF(Internal));
END_ACTION

// RESET OUTPUTS
// Reset all the outputs for further executions
ACTION EasyUaRead_ResetOutputs:
	Done := FALSE;
	Busy := FALSE;
	Active := FALSE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
	brsmemset(ADR(TimeStamp), 0, SIZEOF(TimeStamp));
END_ACTION