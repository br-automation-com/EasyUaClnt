
PROGRAM _INIT
	VarA;
	EasyUaRead_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	EasyUaRead_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	EasyUaRead_0.NodeID.NamespaceIndex := 5;
	EasyUaRead_0.NodeID.Identifier := '::ServerTask:VarX';
	EasyUaRead_0.NodeID.IdentifierType := UAIT_String;
	EasyUaRead_0.Variable := '::Read:VarA';
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
	EasyUaRead_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaRead_0();
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM

