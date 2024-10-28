// CHECK INPUT PARAMETERS
// The parameters are checked, not to return an error but to put default values in the case the
// input was left empty.
ACTION EasyUaReadBulk_CheckParameters:
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
	
	// Set the NodeAddInfo if not null
	IF ADR(NodeAddInfo) <> 0 THEN
		Internal.BrUa_ReadBulk_0.NodeAddInfo := NodeAddInfo;
	END_IF;
	
	// Assign inputs to the corresponding internal FUBs
	// Only 1 NamespaceUri is allowed
	Internal.UA_Connect_0.ServerEndpointUrl := ServerEndpointUrl;
	Internal.UA_NamespaceGetIndexList_0.NamespaceUris[0] := NamespaceUri;
	Internal.UA_NamespaceGetIndexList_0.NamespaceUrisCount := 1;
	Internal.BrUa_ReadBulk_0.NodeIDCount := NodeIDCount;
	Internal.BrUa_ReadBulk_0.NodeIDs := NodeIDs;
	Internal.BrUa_ReadBulk_0.Variables := Variables;
	Internal.BrUa_ReadBulk_0.NodeErrorIDs := NodeErrorIDs;
	Internal.BrUa_ReadBulk_0.TimeStamps := TimeStamps;
	
	// Initialize internal variables for program flow
	Internal.Variables := Variables;
	Internal.NodeIDCount := NodeIDCount;
	Internal.KeepConnection := KeepConnection;
	Internal.NodeIDsAdr := NodeIDs;
	Internal.NodeIDsLen := NodeIDsLen;
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
ACTION EasyUaReadBulk_CyclicCode:
	
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
				Internal.Step := 51;
			END_IF;
			
		20: // Get NamespaceIndex using the NamespaceUri
			Internal.UA_NamespaceGetIndexList_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_NamespaceGetIndexList_0.Busy = FALSE) THEN
				IF (Internal.UA_NamespaceGetIndexList_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
					Internal.Step := 21;
				END_IF;
				IF (Internal.UA_NamespaceGetIndexList_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_NamespaceGetIndexList_0.ErrorID;
					Internal.StatusIDs[0] := Internal.UA_NamespaceGetIndexList_0.ErrorIDs[0]; 
					Internal.Step := 253; 
				END_IF;
				Internal.UA_NamespaceGetIndexList_0(Execute := FALSE);
			END_IF;
		
		21: // Complete NodeIDs NamespaceIndexes using the NamespaceIndexes obtained with UA_NamespaceGetIndexList
			IF Internal.BrUa_ReadBulk_0.NodeIDCount = 0 OR Internal.BrUa_ReadBulk_0.NodeIDs = 0 THEN
				Internal.Step := 51;
			ELSE
				IF Internal.NodeIDsLen <> 0 AND Internal.NodeIDsAdr <> 0 THEN
					IF  (Internal.NodeIDsLen/SIZEOF(UANodeID)) >= Internal.BrUa_ReadBulk_0.NodeIDCount THEN
						FOR Internal.Idx := 0 TO Internal.BrUa_ReadBulk_0.NodeIDCount - 1 DO
							brsmemcpy(Internal.NodeIDsAdr+Internal.Idx*SIZEOF(UANodeID), ADR(Internal.UA_NamespaceGetIndexList_0.NamespaceIndexes[0]), SIZEOF(UINT));
						END_FOR;
					ELSE
						Internal.BrUa_ReadBulk_0.NodeIDCount := UDINT_TO_UINT(Internal.NodeIDsLen/SIZEOF(UANodeID));
						FOR Internal.Idx := 0 TO ((Internal.NodeIDsLen/SIZEOF(UANodeID))-1) DO
							brsmemcpy(Internal.NodeIDsAdr+Internal.Idx*SIZEOF(UANodeID), ADR(Internal.UA_NamespaceGetIndexList_0.NamespaceIndexes[0]), SIZEOF(UINT));
						END_FOR;
					END_IF;
				END_IF;
				Internal.Step := 51;
			END_IF;
			
		51: // Read nodes
			Internal.BrUa_ReadBulk_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.BrUa_ReadBulk_0.Busy = 0) THEN
				IF (Internal.BrUa_ReadBulk_0.Done = 1) THEN
					Internal.StatusID:= 0;
					brsmemset(ADR(Internal.StatusIDs), 0, SIZEOF(Internal.StatusIDs));
					Internal.Step := 52;
				END_IF
				IF (Internal.BrUa_ReadBulk_0.Error = 1) THEN
					Internal.StatusID:= Internal.BrUa_ReadBulk_0.ErrorID;
					Internal.Step := 254;
				END_IF
				Internal.BrUa_ReadBulk_0(Execute := FALSE);
			END_IF
		
		52: // Check KeepConnection
			Internal.KeepConnection := KeepConnection;
			IF Internal.KeepConnection = TRUE THEN
				Internal.Step := 53; 
			ELSE
				Internal.Step := 70; 
			END_IF;
			
		53: // Check Execute
			// When a positive flange is detected in the Execute while using KeepConnection
			// The main command is launched again without terminating the connection before
			// If the number of nodes to handle has changed then a special treatment is done
			// In the case that the number of nodes to handle is less than the number of current
			// obtained handlers then we just perform the operation. In the case the number of nodes
			// to handle is greater than the current nubmer of handlers then the current handlers are 
			// released and the new ones are obtained
			EasyUaReadBulk_SetDone;
			Internal.NodeIDCount := NodeIDCount;
			IF Execute = TRUE AND Internal.ExecuteOld = FALSE THEN
				EasyUaReadBulk_SetBusy;
				Internal.Variables := Variables;
				Internal.BrUa_ReadBulk_0.NodeIDCount := Internal.NodeIDCount;
				Internal.Step := 51; // Go to read state				
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
			Internal.Executing := FALSE;
			EasyUaReadBulk_SetDone;		
			
		254: // Disconnect from the server if an error occurs
			Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl);
			IF (Internal.UA_Disconnect_0.Busy = FALSE) THEN
				Internal.ConnectionHdl := 0;
				Internal.Step := 255;
				Internal.UA_Disconnect_0(Execute := FALSE);
			END_IF;
			
		255: // Error state
			Internal.Executing := FALSE;
			EasyUaReadBulk_SetError;
	END_CASE;
END_ACTION

// SET ERROR
ACTION EasyUaReadBulk_SetError:
	Busy := FALSE;
	Done := FALSE;
	Error := TRUE;
	StatusID := Internal.StatusID;
	StatusIDs := Internal.StatusIDs[0];
END_ACTION

// SET DONE
ACTION EasyUaReadBulk_SetDone:
	Done := TRUE;
	Busy := FALSE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
END_ACTION

// SET BUSY 
ACTION EasyUaReadBulk_SetBusy:
	Done := FALSE;
	Busy := TRUE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
END_ACTION
	
// RESET INTERNAL
// Reset all the internal data for further executions
ACTION EasyUaReadBulk_ResetInternal:
	Internal.UA_Connect_0(Execute:=FALSE);
	Internal.UA_NamespaceGetIndexList_0(Execute:=FALSE);
	Internal.BrUa_ReadBulk_0(Execute:=FALSE);
	Internal.UA_Disconnect_0(Execute:=FALSE);
	brsmemset(ADR(Internal), 0, SIZEOF(Internal));
END_ACTION

// RESET OUTPUTS
// Reset all the outputs for further executions
ACTION EasyUaReadBulk_ResetOutputs:
	Done := FALSE;
	Busy := FALSE;
	Active := FALSE;
	Error := FALSE;
	StatusID := 0;
	StatusIDs := 0;
END_ACTION