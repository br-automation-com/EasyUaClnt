PROGRAM _INIT
	VarA;
	VarB;
	VarC;
	
	EasyUaWriteBulk_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	
	EasyUaWriteBulk_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	
	EasyUaWriteBulk_0.NodeIDCount := 3;
	
	NodeIDs_0[0].NamespaceIndex := 5;
	NodeIDs_0[0].Identifier := '::ServerTask:VarX';
	NodeIDs_0[0].IdentifierType := UAIT_String;
	
	NodeIDs_0[1].NamespaceIndex := 5;
	NodeIDs_0[1].Identifier := '::ServerTask:VarY';
	NodeIDs_0[1].IdentifierType := UAIT_String;
	
	
	NodeIDs_0[2].NamespaceIndex := 5;
	NodeIDs_0[2].Identifier := '::ServerTask:VarZ';
	NodeIDs_0[2].IdentifierType := UAIT_String;
	
	Variables_0[0] := '::WriteBulk:VarA';
	Variables_0[1] := '::WriteBulk:VarB';
	Variables_0[2] := '::WriteBulk:VarC';
	
	EasyUaWriteBulk_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	SessionConnectInfo.SecurityMsgMode := UASMM_BestAvailable;
	SessionConnectInfo.SecurityPolicy := UASP_BestAvailable;
	SessionConnectInfo.TransportProfile := UATP_UATcp;
	SessionConnectInfo.UserIdentityToken.UserIdentityTokenType := UAUITT_Username;
	SessionConnectInfo.UserIdentityToken.TokenParam1 := 'Admin'; //Username
	SessionConnectInfo.UserIdentityToken.TokenParam2 := '12345'; //Password
	SessionConnectInfo.SessionTimeout := T#1m;			
	SessionConnectInfo.MonitorConnection := T#10s;
END_PROGRAM

PROGRAM _CYCLIC
	
	EasyUaWriteBulk_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaWriteBulk_0.NodeIDs := ADR(NodeIDs_0);
	EasyUaWriteBulk_0.NodeIDsLen := SIZEOF(NodeIDs_0);
	EasyUaWriteBulk_0.Variables := ADR(Variables_0);
	EasyUaWriteBulk_0.NodeErrorIDs := ADR(NodeErrorIDs_0);
	EasyUaWriteBulk_0();
	
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM

