// CHECK INPUT PARAMETERS
// The parameters are checked, not to return an error but to put default values in the case the
// input was left empty.
ACTION EasyUaConnectionGetStatus_CheckParameters:
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
	// Only 1 NamespaceUri and 1 node allowed
	Internal.UA_Connect_0.ServerEndpointUrl := ServerEndpointUrl;
	
	// Initialize internal variables for program flow
	Internal.ServerEndpointUrl := ServerEndpointUrl;
	Internal.KeepConnection := KeepConnection;
	Internal.ParametersValid := TRUE;	
	Internal.Executing := TRUE;
	Internal.StatusID := 0;
	Internal.ConnectionStatus := UACS_ConnectionError;
	Internal.ServerState := UASS_Unknown;
	Internal.ServiceLevel := 0;

	// Initialize outputs
	Done := FALSE;
	Busy := TRUE;
	Active := TRUE;
	Error := FALSE;
	StatusID := 0;
END_ACTION

// CYCLIC CODE
// The main program is inside this ACTION. It connects to the server, reads the variable value, and disconnects
ACTION EasyUaConnectionGetStatus_CyclicCode:
	
	CASE Internal.Step OF
		0: // Connect to the OPC UA server
			Internal.UA_Connect_0(Execute := TRUE, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_Connect_0.Busy = FALSE) THEN
				IF (Internal.UA_Connect_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					Internal.ConnectionHdl := Internal.UA_Connect_0.ConnectionHdl;
					Internal.Step := 51; 
				END_IF;
				IF (Internal.UA_Connect_0.Error = TRUE) THEN
					Internal.StatusID := Internal.UA_Connect_0.ErrorID;
					Internal.ConnectionHdl := 0;
					Internal.Step := 254; 
				END_IF;
				Internal.UA_Connect_0(Execute := FALSE);
			END_IF;
			
		51: // Read nodes
			Internal.UA_ConnectionGetStatus_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_ConnectionGetStatus_0.Busy = FALSE) THEN
				Internal.ConnectionStatus := Internal.UA_ConnectionGetStatus_0.ConnectionStatus;
				Internal.ServerState := Internal.UA_ConnectionGetStatus_0.ServerState;
				Internal.ServiceLevel := Internal.UA_ConnectionGetStatus_0.ServiceLevel;
				IF (Internal.UA_ConnectionGetStatus_0.Done = TRUE) THEN
					Internal.StatusID:= 0;
					Internal.Step := 52; 
				END_IF;
				IF (Internal.UA_ConnectionGetStatus_0.Error = TRUE) THEN
					Internal.StatusID:= Internal.UA_ConnectionGetStatus_0.ErrorID;
					Internal.Step := 254; 
				END_IF;
				Internal.UA_ConnectionGetStatus_0(Execute := FALSE);
			END_IF;
		
		52: // Check KeepConnection
			Internal.KeepConnection := KeepConnection;
			IF Internal.KeepConnection = TRUE THEN
				Internal.Step := 53;
			ELSE
				Internal.Step := 70; 
			END_IF;
			
		53: // Check Execute
			IF Execute = FALSE THEN
				Internal.ConnectionStatus := UACS_ConnectionError;
				Internal.ServerState := UASS_Unknown;
				Internal.ServiceLevel := 0;
			END_IF;
			Internal.ServerEndpointUrl := ServerEndpointUrl;
			EasyUaConnectionGetStatus_SetServerStatus;
			EasyUaConnectionGetStatus_SetDone;
			IF Execute = TRUE AND Internal.ExecuteOld = FALSE THEN
				IF Internal.ServerEndpointUrl = Internal.UA_Connect_0.ServerEndpointUrl THEN
					Internal.Step := 51; // Go to main command state
				ELSE
					Internal.UA_Connect_0.ServerEndpointUrl := Internal.ServerEndpointUrl;
					Internal.Step := 70; // Go to next state
				END_IF;
			END_IF;
		
		70: // Disconnect from the server
			Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl, Timeout := EASYUA_EXECUTE_TIMEOUT);
			IF (Internal.UA_Disconnect_0.Busy = FALSE) THEN
				Internal.StatusID := 0;
				Internal.ConnectionHdl := 0;
				Internal.Step := 71; // Go to next state
				Internal.UA_Disconnect_0(Execute := FALSE);
			END_IF;
			
		71: // Check KeepConnection
			IF Internal.KeepConnection = TRUE THEN
				Internal.Step := 0;
			ELSE
				Internal.Step := 100; 
			END_IF;
			
		100: // Done without errors
			EasyUaConnectionGetStatus_SetServerStatus;
			Internal.Executing := FALSE;
			EasyUaConnectionGetStatus_SetDone;
			
		254: // Disconnect from the server if an error occurs
			Internal.UA_Disconnect_0(Execute := TRUE, ConnectionHdl := Internal.ConnectionHdl);
			IF (Internal.UA_Disconnect_0.Busy = FALSE) THEN
				Internal.ConnectionHdl := 0;
				Internal.Step := 255;
				Internal.UA_Disconnect_0(Execute := FALSE);
			END_IF;
			
		255: // Error state
			EasyUaConnectionGetStatus_SetServerStatus;
			Internal.Executing := FALSE;
			EasyUaConnectionGetStatus_SetError;
	END_CASE;
END_ACTION

// SET SERVER STATUS
ACTION EasyUaConnectionGetStatus_SetServerStatus:
	ConnectionStatus := Internal.ConnectionStatus;
	ServerState := Internal.ServerState;
	ServiceLevel := Internal.ServiceLevel;
END_ACTION

// SET ERROR
ACTION EasyUaConnectionGetStatus_SetError:
	Busy := FALSE;
	Done := FALSE;
	Error := TRUE;
	StatusID := Internal.StatusID;
END_ACTION

// SET DONE
ACTION EasyUaConnectionGetStatus_SetDone:
	Done := TRUE;
	Busy := FALSE;
	Error := FALSE;
	StatusID := 0;
END_ACTION

// SET BUSY 
ACTION EasyUaConnectionGetStatus_SetBusy:
	Done := FALSE;
	Busy := TRUE;
	Error := FALSE;
	StatusID := 0;
END_ACTION
	
// RESET INTERNAL
// Reset all the internal data for further executions
ACTION EasyUaConnectionGetStatus_ResetInternal:
	Internal.UA_Connect_0(Execute:=FALSE);
	Internal.UA_ConnectionGetStatus_0(Execute:=FALSE);
	Internal.UA_Disconnect_0(Execute:=FALSE);
	brsmemset(ADR(Internal), 0, SIZEOF(Internal));
END_ACTION

// RESET OUTPUTS
// Reset all the outputs for further executions
ACTION EasyUaConnectionGetStatus_ResetOutputs:
	Done := FALSE;
	Busy := FALSE;
	Active := FALSE;
	Error := FALSE;
	StatusID := 0;
	ConnectionStatus := UACS_ConnectionError;
	ServerState := UASS_Unknown;
	ServiceLevel := 0;
END_ACTION