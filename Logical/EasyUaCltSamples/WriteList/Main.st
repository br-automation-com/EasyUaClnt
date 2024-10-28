PROGRAM _INIT
	VarA;
	VarB;
	VarC;
	EasyUaWriteList_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	EasyUaWriteList_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	EasyUaWriteList_0.NodeIDCount := 3;
	EasyUaWriteList_0.NodeIDs[0].NamespaceIndex := 5;
	EasyUaWriteList_0.NodeIDs[0].Identifier := '::ServerTask:VarX';
	EasyUaWriteList_0.NodeIDs[0].IdentifierType := UAIT_String;
	EasyUaWriteList_0.NodeIDs[1].NamespaceIndex := 5;
	EasyUaWriteList_0.NodeIDs[1].Identifier := '::ServerTask:VarY';
	EasyUaWriteList_0.NodeIDs[1].IdentifierType := UAIT_String;
	EasyUaWriteList_0.NodeIDs[2].NamespaceIndex := 5;
	EasyUaWriteList_0.NodeIDs[2].Identifier := '::ServerTask:VarZ';
	EasyUaWriteList_0.NodeIDs[2].IdentifierType := UAIT_String;
	EasyUaWriteList_0.Variables[0] := '::WriteList:VarA';
	EasyUaWriteList_0.Variables[1] := '::WriteList:VarB';
	EasyUaWriteList_0.Variables[2] := '::WriteList:VarC';
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
	EasyUaWriteList_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaWriteList_0(NodeErrorIDs := NodeErrorIDs_0);
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM
