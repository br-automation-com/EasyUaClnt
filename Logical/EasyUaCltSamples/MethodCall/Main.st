PROGRAM _INIT
	VarA;
	VarB;
	VarC;
	EasyUaMethodCall_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	EasyUaMethodCall_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	EasyUaMethodCall_0.ObjectNodeID.NamespaceIndex := 5;
	EasyUaMethodCall_0.ObjectNodeID.Identifier := '::ServerTask';
	EasyUaMethodCall_0.ObjectNodeID.IdentifierType := UAIT_String;
	EasyUaMethodCall_0.MethodNodeID.NamespaceIndex := 5;
	EasyUaMethodCall_0.MethodNodeID.Identifier := '::ServerTask:Multiply';
	EasyUaMethodCall_0.MethodNodeID.IdentifierType := UAIT_String;
	EasyUaMethodCall_0.InputArguments[0].Name := 'Input1';
	EasyUaMethodCall_0.InputArguments[0].Value := '::MethodCall:VarA';
	EasyUaMethodCall_0.InputArguments[1].Name := 'Input2';
	EasyUaMethodCall_0.InputArguments[1].Value := '::MethodCall:VarB';
	EasyUaMethodCall_0.OutputArguments[0].Name := 'Result';
	EasyUaMethodCall_0.OutputArguments[0].Value := '::MethodCall:VarC';
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
	EasyUaMethodCall_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaMethodCall_0();
END_PROGRAM

PROGRAM _EXIT
END_PROGRAM

