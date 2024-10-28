                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_Connect
	VAR_INPUT
		Execute	           		: BOOL;
		ServerEndpointUrl		: STRING[MAX_LENGTH_STRING];
		SessionConnectInfo 		: UASessionConnectInfo;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		ConnectionHdl      		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_Disconnect
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NamespaceGetIndex
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NamespaceUri			: STRING[MAX_LENGTH_STRING];
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		NamespaceIndex			: UINT;
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NamespaceGetIndexList
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		NamespaceUrisCount		: UINT;
		NamespaceUris			: ARRAY[0..MAX_INDEX_NAMESPACES] OF STRING[MAX_LENGTH_STRING];
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID           		: DWORD;
		ErrorIDs           		: ARRAY[0..MAX_INDEX_NAMESPACES] OF DWORD;
		NamespaceIndexes		: ARRAY[0..MAX_INDEX_NAMESPACES] OF UINT;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_ServerGetUriByIndex
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		ServerIndex				: UDINT;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		ServerUri				: STRING[MAX_LENGTH_STRING];
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_ServerGetIndexByUriList
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		ServerUrisCount			: UINT;
		ServerUris				: ARRAY[0..MAX_INDEX_NAMESPACES] OF STRING[MAX_LENGTH_STRING];
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID           		: DWORD;
		ErrorIDs            	: ARRAY[0..MAX_INDEX_NAMESPACES] OF DWORD;
		ServerIndexes			: ARRAY[0..MAX_INDEX_NAMESPACES] OF UDINT;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_Browse
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		ViewDescription			: UAViewDescription;
		BrowseDescription		: UABrowseDescription;
		ContinuationPointIn		: DWORD;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		BrowseResultCount		: UINT;
		BrowseResult			: ARRAY[0..MAX_INDEX_BROWSERESULT] OF UAReferenceDescription;
		ContinuationPointOut	: DWORD;
	END_VAR
	
	VAR
		i_continuation			: DWORD;
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_TranslatePath
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		StartNodeID				: UANodeID;
		RelativePath			: STRING[MAX_LENGTH_STRING];	
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		TargetNodeID			: UANodeID;
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_TranslatePathList
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		BrowsePathsCount		: UINT;
		BrowsePaths				: ARRAY[0..MAX_INDEX_NODELIST] OF UABrowsePath;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		TargetNodeIDs			: ARRAY[0..MAX_INDEX_NODELIST] OF UANodeID;
		TargetErrorIDs			: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NodeGetHandle
	VAR_INPUT
		Execute	           	 	: BOOL;
		ConnectionHdl      	 	: DWORD;
		NodeID					: UANodeID;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		NodeHdl					: DWORD;
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NodeGetHandleList
	VAR_INPUT
		Execute	           	 	: BOOL;
		ConnectionHdl      	 	: DWORD;
		NodeIDCount				: UINT;
		NodeIDs					: ARRAY[0..MAX_INDEX_NODELIST] OF UANodeID;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID					: DWORD;
		NodeErrorIDs           	: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
		NodeHdls				: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NodeReleaseHandle
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeHdl      	 		: DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NodeReleaseHandleList
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeHdlCount   	 		: UINT;
		NodeHdls				: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID					: DWORD;
		NodeErrorIDs           	: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NodeGetInfo
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeID					: UANodeID;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		NodeInfo				: UANodeInfo;
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_NodeGetInformation
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeID					: UANodeID;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID           		: DWORD;
		NodeGetInfoErrorIDs     : ARRAY[0..22] OF DWORD;
		NodeInfo				: UANodeInformation;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_SubscriptionCreate
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		PublishingEnable		: BOOL;
		Priority				: BYTE;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		SubscriptionHdl			: DWORD;
	END_VAR

	VAR_IN_OUT
		PublishingInterval		: TIME;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_SubscriptionDelete
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_SubscriptionModify
	VAR_INPUT
		Execute					: BOOL;
		SubscriptionHdl			: DWORD;
		PublishingEnable		: BOOL;
		Priority				: BYTE;
		Timeout					: TIME;
	END_VAR
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR
	
	VAR_IN_OUT
		PublishingInterval		: TIME;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_SubscriptionProcessed
	VAR_INPUT
		Execute					: BOOL;
		SubscriptionHdl			: DWORD;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		Published				: BOOL;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MonitoredItemAddList
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		NodeHdlCount			: UINT;
		NodeHdls				: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
		SyncMode				: UAMonitoringSyncMode;
		NodeAddInfos			: ARRAY[0..MAX_INDEX_MONITORLIST] OF UANodeAdditionalInfo;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		NodeErrorIDs			: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
		MonitoredItemHdls		: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
	END_VAR

	VAR_IN_OUT
		Variables	   			: ARRAY[0..MAX_INDEX_MONITORLIST] OF UAMonitoredVariables;
		MonitoringParameter		: ARRAY[0..MAX_INDEX_MONITORLIST] OF UAMonitoringParameter;
		ValuesChanged			: ARRAY[0..MAX_INDEX_MONITORLIST] OF BOOL;
		MinLostValueCount		: ARRAY[0..MAX_INDEX_MONITORLIST] OF UINT;
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MonitoredItemRemoveList
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		MonitoredItemHdlCount	: UINT;
		MonitoredItemHdls		: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		NodeErrorIDs			: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MonitoredItemModifyList
	VAR_INPUT
		Execute					: BOOL;
		SubscriptionHdl			: DWORD;
		MonitoredItemHdlCount	: UINT;
		MonitoredItemHdls		: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		NodeErrorIDs			: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
	END_VAR
	
	VAR_IN_OUT
		MonitoringParameters	: ARRAY[0..MAX_INDEX_MONITORLIST] OF UAMonitoringParameter;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MonitoredItemOperateList
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		MonitoredItemHdlCount	: UINT;
		MonitoredItemHdls		: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		NodeErrorIDs			: ARRAY[0..MAX_INDEX_MONITORLIST] OF DWORD;
		Published				: BOOL;
	END_VAR	

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_EventItemAdd
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		NodeHdl					: DWORD;
		EventType				: UANodeID;
		EventFieldSelectionCount: UINT;
		EventFieldSelections	: ARRAY[0..MAX_INDEX_EVENTFIELDSELECTION] OF UARelativePath;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		EventItemHdl			: DWORD;
	END_VAR

	VAR_IN_OUT
		EventFields	   			: ARRAY[0..MAX_INDEX_EVENTFIELDSELECTION] OF STRING[MAX_LENGTH_VARIABLE];
		EventProcessed			: BOOL;
		RemainingEventCount		: UINT;
		FieldErrorIDs			: ARRAY[0..MAX_INDEX_EVENTFIELDSELECTION] OF DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_EventItemRemoveList
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		EventItemHdlCount		: UINT;
		EventItemHdls			: ARRAY[0..MAX_INDEX_EVENTITEMLIST] OF DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID           		: DWORD;
		ErrorIDs            	: ARRAY[0..MAX_INDEX_EVENTITEMLIST] OF DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_EventItemOperateList
	VAR_INPUT
		Execute	           		: BOOL;
		SubscriptionHdl			: DWORD;
		EventItemHdlCount		: UINT;
		EventItemHdls			: ARRAY[0..MAX_INDEX_EVENTITEMLIST] OF DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		EventProcessed			: BOOL;
		FieldErrorIDs			: ARRAY[0..MAX_INDEX_EVENTITEMLIST] OF DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_Read
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeHdl					: DWORD;
		NodeAddInfo				: UANodeAdditionalInfo;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		TimeStamp				: DT;
	END_VAR
	
	VAR_IN_OUT
		Variable	   			: STRING[MAX_LENGTH_VARIABLE];
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_ReadList
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeHdlCount			: UINT;
		NodeHdls				: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
		NodeAddInfo				: ARRAY[0..MAX_INDEX_NODELIST] OF UANodeAdditionalInfo;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		NodeErrorIDs			: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
		TimeStamps				: ARRAY[0..MAX_INDEX_NODELIST] OF DT;
	END_VAR
	
	VAR_IN_OUT
		Variables	   			: ARRAY[0..MAX_INDEX_NODELIST] OF STRING[MAX_LENGTH_VARIABLE];
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK BrUa_ReadBulk
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeIDCount				: UINT;
		NodeIDs					: UDINT;
		NodeAddInfo				: UDINT;
		Variables	   			: UDINT;
		NodeErrorIDs			: UDINT;
		TimeStamps				: UDINT;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_Write
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeHdl					: DWORD;
		NodeAddInfo				: UANodeAdditionalInfo;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR_IN_OUT
		Variable	   			: STRING[MAX_LENGTH_VARIABLE];
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_WriteList
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeHdlCount			: UINT;
		NodeHdls				: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
		NodeAddInfo				: ARRAY[0..MAX_INDEX_NODELIST] OF UANodeAdditionalInfo;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		NodeErrorIDs			: ARRAY[0..MAX_INDEX_NODELIST] OF DWORD;
	END_VAR

	VAR_IN_OUT
		Variables   			: ARRAY[0..MAX_INDEX_NODELIST] OF STRING[MAX_LENGTH_VARIABLE];
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK BrUa_WriteBulk
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		NodeIDCount				: UINT;
		NodeIDs					: UDINT;
		NodeAddInfo				: UDINT;
		Variables	   			: UDINT;
		NodeErrorIDs			: UDINT;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MethodGetHandle
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		ObjectNodeID			: UANodeID;
		MethodNodeID			: UANodeID;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		MethodHdl				: DWORD;
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MethodGetHandleList
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		NodeIDCount				: UINT;
		ObjectNodeIDs			: ARRAY[0..MAX_INDEX_METHOD] OF UANodeID;
		MethodNodeIDs			: ARRAY[0..MAX_INDEX_METHOD] OF UANodeID;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID           		: DWORD;
		ErrorIDs            	: ARRAY[0..MAX_INDEX_METHOD] OF DWORD;
		MethodHdls				: ARRAY[0..MAX_INDEX_METHOD] OF DWORD;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MethodReleaseHandle
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		MethodHdl				: DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MethodReleaseHandleList
	VAR_INPUT
		Execute					: BOOL;
		ConnectionHdl			: DWORD;
		MethodHdlCount			: UINT;
		MethodHdls				: ARRAY[0..MAX_INDEX_METHOD] OF DWORD;
		Timeout					: TIME;
	END_VAR
	
	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID           		: DWORD;
		ErrorIDs            	: ARRAY[0..MAX_INDEX_METHOD] OF DWORD;
	END_VAR
	
	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_MethodCall
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		MethodHdl				: DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
	END_VAR

	VAR_IN_OUT
		MethodResult			: DWORD;
		InputArguments			: ARRAY[0..MAX_INDEX_ARGUMENTS] OF BrUaMethodArgument;
		OutputArguments			: ARRAY[0..MAX_INDEX_ARGUMENTS] OF BrUaMethodArgument;
	END_VAR

	VAR
		i_busy             		: BOOL;
		i_tid					: UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK UA_ConnectionGetStatus
	VAR_INPUT
		Execute	           		: BOOL;
		ConnectionHdl      		: DWORD;
		Timeout            		: TIME;
	END_VAR

	VAR_OUTPUT
		Done			   		: BOOL;
		Busy               		: BOOL;
		Error              		: BOOL;
		ErrorID            		: DWORD;
		ConnectionStatus		: UAConnectionStatus;
		ServerState				: UAServerState;
		ServiceLevel			: BYTE;
	END_VAR

	VAR
		i_busy             		: BOOL;
	END_VAR
END_FUNCTION_BLOCK
