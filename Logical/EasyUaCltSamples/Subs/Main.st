PROGRAM _INIT	
	VarA;
	ValueChanged_0;
	TimeStamp_0;
	NodeQualityID_0;
	EasyUaSubscription_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	EasyUaSubscription_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	EasyUaSubscription_0.NodeID.NamespaceIndex := 5;
	EasyUaSubscription_0.NodeID.Identifier := '::ServerTask:VarX';
	EasyUaSubscription_0.NodeID.IdentifierType := UAIT_String;
	Variable_0.Values := '::Subs:VarA';
	Variable_0.TimeStamps := '::Subs:TimeStamp_0';
	Variable_0.NodeQualityIDs := '::Subs:NodeQualityID_0';
	EasyUaSubscription_0.PublishingInterval := T#500ms;
	EasyUaSubscription_0.pSessionConnectInfo := ADR(SessionConnectInfo);
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
	EasyUaSubscription_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	EasyUaSubscription_0(Variable := Variable_0, ValueChanged := ValueChanged_0, MinLostValueCount := MinLostValueCount_0);
END_PROGRAM

PROGRAM _EXIT
	REPEAT
		EasyUaSubscription_0(Enable:=FALSE, Variable := Variable_0, ValueChanged := ValueChanged_0, MinLostValueCount := MinLostValueCount_0);
		UNTIL EasyUaSubscription_0.Active = FALSE 
	END_REPEAT;
END_PROGRAM

