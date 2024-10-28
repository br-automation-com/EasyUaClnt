PROGRAM _INIT
	VarA;
	VarB;
	VarC;
	EasyUaReadList_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';		
	EasyUaReadList_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	EasyUaReadList_0.NodeIDCount := 3;
	EasyUaReadList_0.NodeIDs[0].NamespaceIndex := 5;
	EasyUaReadList_0.NodeIDs[0].Identifier := '::ServerTask:VarX';
	EasyUaReadList_0.NodeIDs[0].IdentifierType := UAIT_String;
	EasyUaReadList_0.NodeIDs[1].NamespaceIndex := 5;
	EasyUaReadList_0.NodeIDs[1].Identifier := '::ServerTask:VarY';
	EasyUaReadList_0.NodeIDs[1].IdentifierType := UAIT_String;
	EasyUaReadList_0.NodeIDs[2].NamespaceIndex := 5;
	EasyUaReadList_0.NodeIDs[2].Identifier := '::ServerTask:VarZ';
	EasyUaReadList_0.NodeIDs[2].IdentifierType := UAIT_String;
	EasyUaReadList_0.Variables[0] := '::ReadList:VarA';
	EasyUaReadList_0.Variables[1] := '::ReadList:VarB';
	EasyUaReadList_0.Variables[2] := '::ReadList:VarC';
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
	EasyUaReadList_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaReadList_0(NodeErrorIDs := NodeErrorIDs_0, TimeStamps := TimeStamps_0);
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM
