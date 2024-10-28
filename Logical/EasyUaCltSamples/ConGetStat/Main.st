PROGRAM _INIT
	EasyUaConnectionGetStatus_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
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
	EasyUaConnectionGetStatus_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaConnectionGetStatus_0();
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM

