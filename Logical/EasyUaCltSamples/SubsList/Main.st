PROGRAM _INIT
	VarA;
	VarB;
	VarC;
	TimeStamps_0;
	NodeQualityIDs_0;
	EasyUaSubscriptionList_0.ServerEndpointUrl := 'opc.tcp://localhost:4840';
	EasyUaSubscriptionList_0.NamespaceUri := 'http://br-automation.com/OpcUa/PLC/PV/';
	EasyUaSubscriptionList_0.NodeIDCount := 3;
	EasyUaSubscriptionList_0.NodeIDs[0].NamespaceIndex := 5;
	EasyUaSubscriptionList_0.NodeIDs[0].Identifier := '::ServerTask:VarX';
	EasyUaSubscriptionList_0.NodeIDs[0].IdentifierType := UAIT_String;
	EasyUaSubscriptionList_0.NodeIDs[1].NamespaceIndex := 5;
	EasyUaSubscriptionList_0.NodeIDs[1].Identifier := '::ServerTask:VarY';
	EasyUaSubscriptionList_0.NodeIDs[1].IdentifierType := UAIT_String;
	EasyUaSubscriptionList_0.NodeIDs[2].NamespaceIndex := 5;
	EasyUaSubscriptionList_0.NodeIDs[2].Identifier := '::ServerTask:VarZ';
	EasyUaSubscriptionList_0.NodeIDs[2].IdentifierType := UAIT_String;
	Variables_0[0].Values := '::SubsList:VarA';
	Variables_0[0].TimeStamps := '::SubsList:TimeStamps_0[0]';
	Variables_0[0].NodeQualityIDs := '::SubsList:NodeQualityIDs_0[0]';
	Variables_0[1].Values := '::SubsList:VarB';
	Variables_0[1].TimeStamps := '::SubsList:TimeStamps_0[1]';
	Variables_0[1].NodeQualityIDs := '::SubsList:NodeQualityIDs_0[1]';
	Variables_0[2].Values := '::SubsList:VarC';
	Variables_0[2].TimeStamps := '::SubsList:TimeStamps_0[2]';
	Variables_0[2].NodeQualityIDs := '::SubsList:NodeQualityIDs_0[2]';
	EasyUaSubscriptionList_0.PublishingInterval := T#50ms;
	EasyUaSubscriptionList_0.pSessionConnectInfo := ADR(SessionConnectInfo);
	SessionConnectInfo.SecurityMsgMode := UASMM_BestAvailable;
	SessionConnectInfo.SecurityPolicy := UASP_BestAvailable;
	SessionConnectInfo.TransportProfile := UATP_UATcp;
	SessionConnectInfo.UserIdentityToken.UserIdentityTokenType := UAUITT_Username;
	SessionConnectInfo.UserIdentityToken.TokenParam1 := 'Admin'; //Username
	SessionConnectInfo.UserIdentityToken.TokenParam2 := '12345'; //Password
	SessionConnectInfo.SessionTimeout := T#1m;			
	SessionConnectInfo.MonitorConnection := T#10s;
	EasyUaSubscriptionList_0.Enable := TRUE;
END_PROGRAM

PROGRAM _CYCLIC
	EasyUaSubscriptionList_0(Variables := Variables_0, ValuesChanged := ValuesChange_0, MinLostValueCount := MinLostValueCount_0);
END_PROGRAM

PROGRAM _EXIT
	REPEAT
		EasyUaSubscriptionList_0(Enable:= FALSE, Variables := Variables_0, ValuesChanged := ValuesChange_0, MinLostValueCount := MinLostValueCount_0);
		UNTIL EasyUaSubscriptionList_0.Active = FALSE 
	END_REPEAT;
END_PROGRAM
