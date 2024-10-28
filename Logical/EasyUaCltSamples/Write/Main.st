
PROGRAM _INIT
	VarA;
	EasyUaWrite_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	EasyUaWrite_0.NodeID.NamespaceIndex := 5;
	EasyUaWrite_0.NodeID.Identifier := '::ServerTask:VarX';
	EasyUaWrite_0.NodeID.IdentifierType := UAIT_String;
	EasyUaWrite_0.Variable := '::Write:VarA';
	EasyUaWrite_0.pSessionConnectInfo := ADR(SessionConnectInfo);
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
	EasyUaWrite_0();
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM

