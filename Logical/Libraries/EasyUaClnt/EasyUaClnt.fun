
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaConnectionGetStatus (*Queries connection information*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		ConnectionStatus : {REDUND_UNREPLICABLE} UAConnectionStatus; (*Status of the connection, see UAConnectionStatus. Outputs "ServerState" and "ServiceLevel" are only valid if ConnectionStatus = UACS_Connected*) (* *) (*#PAR*)
		ServerState : {REDUND_UNREPLICABLE} UAServerState; (*Status of the server, see UAServerState*) (* *) (*#PAR*)
		ServiceLevel : {REDUND_UNREPLICABLE} BYTE; (*ServiceLevel" describes the server's ability to provide the client with data*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaConnGetStatusInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaRead (*Reads the value of a variable on a single node on the OPC UA server*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID[].NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeID : {REDUND_UNREPLICABLE} UANodeID; (*NodeID, identification of the node. For information about the structure, see UANodeID in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		pNodeAddInfo : REFERENCE TO UANodeAdditionalInfo; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo.*) (* *) (*#PAR#OPT*)
		Variable : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_VARIABLE]; (*Name of the variable on the controller in the syntax Application module::Task:Variable.Element*) (* *) (*#PAR*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		StatusIDs : {REDUND_UNREPLICABLE} DWORD; (*Status informations of the NodeErrorIDs*)
		TimeStamp : {REDUND_UNREPLICABLE} DATE_AND_TIME; (*Timestamp of the read node.*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaReadInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaReadList (*Reads the value of a variable on a single node on the OPC UA server*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID.NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeIDCount : {REDUND_UNREPLICABLE} UINT; (*Number of nodes in the list to be written. The maximum number is limited by the server limit.Only the number of configued NodeIDs must be used, otherwise, undefined behavior, access violations and a controller restart can occur*) (* *) (*#PAR*)
		NodeIDs : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_NODELIST] OF UANodeID; (*List of NodeIDs for the identification of nodes. For information about the structure, see UANodeID.*) (* *) (*#PAR*)
		pNodeAddInfo : REFERENCE TO ARRAY[0..MAX_INDEX_NODELIST] OF UANodeAdditionalInfo; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo in AsOpcUac Automation Studio Help*) (* *) (*#PAR#OPT*)
		Variables : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_NODELIST] OF STRING[MAX_LENGTH_VARIABLE]; (* Name of the variables on the controller in the syntax Application module::Task:Variable.Element*) (* *) (*#PAR*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
	END_VAR
	VAR_IN_OUT
		TimeStamps : ARRAY[0..MAX_INDEX_NODELIST] OF DATE_AND_TIME; (*Timestamp of the read nodes.*) (* *) (*#CYC*)
		NodeErrorIDs : ARRAY[0..MAX_INDEX_NODELIST] OF DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#CYC*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaReadListInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaReadBulk (*Improved performance for acyclic read requests with high data volume*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID[].NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeIDCount : {REDUND_UNREPLICABLE} UINT; (*Number of nodes in the list to be read. The maximum number is limited by the server limit. Only the number of configued NodeIDs must be used, otherwise, undefined behavior, access violations and a controller restart can occur*) (* *) (*#PAR*)
		NodeIDs : {REDUND_UNREPLICABLE} UDINT; (*List of NodeIDs for the identification of nodes. For information about the structure, see UANodeID  in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		NodeIDsLen : {REDUND_UNREPLICABLE} UDINT; (*Size of the variable conected to the input NodeIDs*) (* *) (*#PAR*)
		NodeAddInfo : {REDUND_UNREPLICABLE} UDINT; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo.*) (* *) (*#PAR#OPT*)
		Variables : {REDUND_UNREPLICABLE} UDINT; (* Name of the variables on the controller in the syntax Application module::Task:Variable.Element*) (* *) (*#PAR*)
		NodeErrorIDs : {REDUND_UNREPLICABLE} UDINT; (*Address of a list of DWORD for returning the error codes for the read operations.*) (* *) (*#PAR#OPT*)
		TimeStamps : {REDUND_UNREPLICABLE} UDINT; (*Timestamp of the read nodes.*) (* *) (*#PAR#OPT*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*At least one node of the list has an error or there was a fub execution error. If StatusID = 0 check NodeErrorIDs.*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		StatusIDs : {REDUND_UNREPLICABLE} DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaReadBulkInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaWrite (*Writes the value of a variable to a single node on the OPC UA server*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID[].NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeID : {REDUND_UNREPLICABLE} UANodeID; (*NodeID, identification of the node. For information about the structure, see UANodeID in AsOpcUac Automation Studio Help. *) (* *) (*#PAR*)
		pNodeAddInfo : REFERENCE TO UANodeAdditionalInfo; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo.*) (* *) (*#PAR#OPT*)
		Variable : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_VARIABLE]; (* Name of the variable on the controller in the syntax Application module::Task:Variable.Element*) (* *) (*#PAR*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		StatusIDs : {REDUND_UNREPLICABLE} DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaWriteInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaWriteList (*Reads the value of a variable on a single node on the OPC UA server*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID.NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeIDCount : {REDUND_UNREPLICABLE} UINT; (*Number of nodes in the list to be written. The maximum number is limited by the server limit.Only the number of configued NodeIDs must be used, otherwise, undefined behavior, access violations and a controller restart can occur*) (* *) (*#PAR*)
		NodeIDs : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_NODELIST] OF UANodeID; (*List of NodeIDs for the identification of nodes. For information about the structure, see UANodeID.*) (* *) (*#PAR*)
		pNodeAddInfo : REFERENCE TO ARRAY[0..MAX_INDEX_NODELIST] OF UANodeAdditionalInfo; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo in AsOpcUac Automation Studio Help*) (* *) (*#PAR#OPT*)
		Variables : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_NODELIST] OF STRING[MAX_LENGTH_VARIABLE]; (* Name of the variables on the controller in the syntax Application module::Task:Variable.Element*) (* *) (*#PAR*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
	END_VAR
	VAR_IN_OUT
		NodeErrorIDs : ARRAY[0..MAX_INDEX_NODELIST] OF DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaWriteListInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaWriteBulk (*Improved performance for acyclic write requests with high data volume*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID[].NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeIDCount : {REDUND_UNREPLICABLE} UINT; (*Number of nodes in the list to be read. The maximum number is limited by the server limit. Only the number of configued NodeIDs must be used, otherwise, undefined behavior, access violations and a controller restart can occur*) (* *) (*#PAR*)
		NodeIDs : {REDUND_UNREPLICABLE} UDINT; (*List of NodeIDs for the identification of nodes. For information about the structure, see UANodeID  in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		NodeIDsLen : {REDUND_UNREPLICABLE} UDINT; (*Size of the variable conected to the input NodeIDs*) (* *) (*#PAR*)
		NodeAddInfo : {REDUND_UNREPLICABLE} UDINT; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo.*) (* *) (*#PAR#OPT*)
		Variables : {REDUND_UNREPLICABLE} UDINT; (* Name of the variables on the controller in the syntax Application module::Task:Variable.Element*) (* *) (*#PAR*)
		NodeErrorIDs : {REDUND_UNREPLICABLE} UDINT; (*Address of a list of DWORD for returning the error codes for the read operations.*) (* *) (*#PAR#OPT*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*At least one node of the list has an error or there was a fub execution error. If StatusID = 0 check NodeErrorIDs.*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		StatusIDs : {REDUND_UNREPLICABLE} DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaWriteBulkInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaSubscription (*Operates a simple subscription to a single node on the OPC UA server*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enable the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID[].NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeID : {REDUND_UNREPLICABLE} UANodeID; (*List of NodeIDs for the identification of nodes. For information about the structure, see UANodeID  in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		pNodeAddInfo : REFERENCE TO UANodeAdditionalInfo; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo.*) (* *) (*#PAR#OPT*)
		PublishingInterval : {REDUND_UNREPLICABLE} TIME; (*Interval at which data should be published to the client. Since the server does not have to accept every desired interval, the interval actually used by the server is returned on the output after the call.*)
		Priority : {REDUND_UNREPLICABLE} BYTE; (*Specifies the priority of the subscription on the server (with respect to other subscriptions from the same client).*) (* *) (*#PAR*)
		pMonitoringSettings : REFERENCE TO UAMonitoringParameter; (*List of additional parameters for specifying and verifying monitoring. The number of list elements is defined by NodeHdlCount.*)
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*At least one node of the list has an error or there was a fub execution error. If StatusID = 0 check NodeErrorIDs.*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		StatusIDs : {REDUND_UNREPLICABLE} DWORD; (*Status informations of the NodeErrorIDs*)
		SubscriptionActive : {REDUND_UNREPLICABLE} BOOL; (*The specified node has an active subscription without errors.*) (* *) (*#PAR*)
	END_VAR
	VAR_IN_OUT
		Variable : UAMonitoredVariables; (*Target variable for accepting the value changes received.*) (* *) (*#CYC*)
		ValueChanged : BOOL; (*Set to TRUE when receiving a value change of the corresponding item. Can be used to determine if a change has been reprocessed.*) (* *) (*#CYC*)
		MinLostValueCount : UINT; (*Minimal lost value changes because a queue overflow (QueueSize > 0) occurred on the server.*) (* *) (*#CYC*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaSubscriptionInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaSubscriptionList (*Operates a simple subscription to a list of nodes on the OPC UA server*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enable the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[MAX_LENGTH_STRING]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified the NodeID[].NamespaceIndex is used*) (* *) (*#PAR#OPT*)
		NodeIDCount : {REDUND_UNREPLICABLE} UINT; (*Number of nodes in the list to be subscripted. The maximum number is limited by the server limit.Only the number of configued NodeIDs must be used, otherwise, undefined behavior, access violations and a controller restart can occur*) (* *) (*#PAR*)
		NodeIDs : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_NODELIST] OF UANodeID; (*List of NodeIDs for the identification of nodes. For information about the structure, see UANodeID  in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		pNodeAddInfos : REFERENCE TO ARRAY[0..MAX_INDEX_MONITORLIST] OF UANodeAdditionalInfo; (*Additional parameters for specifying the node.For information about the structure, see UANodeAdditionalInfo.*) (* *) (*#PAR#OPT*)
		PublishingInterval : {REDUND_UNREPLICABLE} TIME; (*Interval at which data should be published to the client. Since the server does not have to accept every desired interval, the interval actually used by the server is returned on the output after the call.*) (* *) (*#PAR#OPT*)
		Priority : {REDUND_UNREPLICABLE} BYTE; (*Specifies the priority of the subscription on the server (with respect to other subscriptions from the same client).*) (* *) (*#PAR#OPT*)
		pMonitoringSettings : REFERENCE TO ARRAY[0..MAX_INDEX_MONITORLIST] OF UAMonitoringParameter; (*List of additional parameters for specifying and verifying monitoring. The number of list elements is defined by NodeHdlCount.*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*At least one node of the list has an error or there was a fub execution error. If StatusID = 0 check NodeErrorIDs.*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		NodeStatusIDs : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_NODELIST] OF DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#PAR*)
		MonitorStatusIDs : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD; (*Status informations of the MonitorErrorIDs*) (* *) (*#PAR*)
		SubscriptionListActive : {REDUND_UNREPLICABLE} BOOL; (*At least one node of the list has an active subscription without errors*) (* *) (*#PAR*)
	END_VAR
	VAR_IN_OUT
		Variables : ARRAY[0..MAX_INDEX_MONITORLIST] OF UAMonitoredVariables; (*List of target variables for accepting the value changes received*) (* *) (*#CYC*)
		ValuesChanged : ARRAY[0..MAX_INDEX_MONITORLIST] OF BOOL; (*Set to TRUE when receiving a value change of the corresponding item. Can be used to determine if a change has been reprocessed*) (* *) (*#CYC*)
		MinLostValueCount : ARRAY[0..MAX_INDEX_MONITORLIST] OF UINT; (*Minimal lost value changes because a queue overflow (QueueSize > 0) occurred on the server.*) (* *) (*#CYC*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaSubsListInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EasyUaMethodCall (*Calls a method on the OPC UA server*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execute the function block*) (* *) (*#PAR*)
		ServerEndpointUrl : {REDUND_UNREPLICABLE} STRING[255]; (*Server endpoint URL specified in the syntax opc.tcp://IP address:Port*) (* *) (*#PAR*)
		pSessionConnectInfo : REFERENCE TO UASessionConnectInfo; (*Reference to structure UASessionConnectInfo *) (* *) (*#PAR#OPT*)
		NamespaceUri : {REDUND_UNREPLICABLE} STRING[255]; (*Specifies the namespace URI. Example: "urn:B&R/pv/". If not specified ObjectNodeID.NamespaceIndex and MethodNodeID.NamespaceIndex are used*) (* *) (*#PAR#OPT*)
		ObjectNodeID : {REDUND_UNREPLICABLE} UANodeID; (*Identification of the object that contains the method. For information about the structure, see UANodeID in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		MethodNodeID : {REDUND_UNREPLICABLE} UANodeID; (*Identification of the method. For information about the structure, see UANodeID in AsOpcUac Automation Studio Help*) (* *) (*#PAR*)
		InputArguments : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_ARGUMENTS] OF BrUaMethodArgument; (*Array with the assignment of the InputArguments to the source variables.*) (* *) (*#PAR*)
		OutputArguments : {REDUND_UNREPLICABLE} ARRAY[0..MAX_INDEX_ARGUMENTS] OF BrUaMethodArgument; (*Array with the assignment of the OutputArguments to the target variables.*) (* *) (*#PAR*)
		KeepConnection : {REDUND_UNREPLICABLE} BOOL; (*Maintains the connection open with the OPC UA server*) (* *) (*#PAR#OPT*)
	END_VAR
	VAR_OUTPUT
		Done : {REDUND_UNREPLICABLE} BOOL; (*Execute is done*) (* *) (*#PAR*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Function block is busy*) (* *) (*#PAR*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*Function block is active*) (* *) (*#PAR*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*Indicates an error*) (* *) (*#PAR*)
		StatusID : {REDUND_UNREPLICABLE} DWORD; (*Status information*) (* *) (*#PAR*)
		StatusIDs : {REDUND_UNREPLICABLE} DWORD; (*Status informations of the NodeErrorIDs*) (* *) (*#PAR*)
		MethodResult : {REDUND_UNREPLICABLE} DWORD; (*The OPC UA StatusCode that was returned by the server as the OperationResult of the call operation is output on this output. For methods that are implemented on the B&R OPC UA server with UaSrv_MethodOperate, input MethodResult is returned to this output.*) (* *) (*#PAR*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} EasyUaMethodCallInternalType; (*Data for internal use*) (* *) (*#OMIT*)
	END_VAR
END_FUNCTION_BLOCK
