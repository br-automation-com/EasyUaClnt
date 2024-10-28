/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASOPCUAC_
#define _ASOPCUAC_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum UASecurityMsgMode
{	UASMM_BestAvailable = 0,
	UASMM_None = 1,
	UASMM_Sign = 2,
	UASMM_SignEncrypt = 3
} UASecurityMsgMode;

typedef enum UASecurityPolicy
{	UASP_BestAvailable = 0,
	UASP_None = 1,
	UASP_Basic128Rsa15 = 2,
	UASP_Basic256 = 3,
	UASP_Basic256Sha256 = 4,
	UASP_Aes128_Sha256_RsaOaep = 5,
	UASP_Aes256_Sha256_RsaPss = 6,
	UASP_EccNnistP256 = 7,
	UASP_EccNistP384 = 8,
	UASP_EccBrainpoolP256r1 = 9,
	UASP_EccBrainpoolP384r1 = 10,
	UASP_EccCurve25519 = 11
} UASecurityPolicy;

typedef enum UATransportProfile
{	UATP_UATcp = 1,
	UATP_WSHttpBinary = 2,
	UATP_WSHttpXmlOrBinary = 3,
	UATP_WSHttpXml = 4
} UATransportProfile;

typedef enum UAUserIdentityTokenTtype
{	UAUITT_Anonymous = 0,
	UAUITT_Username = 1,
	UAUITT_x509 = 2
} UAUserIdentityTokenTtype;

typedef enum UAIdentifierType
{	UAIT_Numeric = 0,
	UAIT_String = 1,
	UAIT_GUID = 2,
	UAIT_Opaque = 3
} UAIdentifierType;

typedef enum UADeadbandType
{	UADT_None = 0,
	UADT_Absolute = 1,
	UADT_Percent = 2
} UADeadbandType;

typedef enum UANodeClass
{	UANodeClass_None = 0,
	UANodeClass_Object = 1,
	UANodeClass_Variable = 2,
	UANodeClass_Method = 4,
	UANodeClass_ObjectType = 8,
	UANodeClass_VariableType = 16,
	UANodeClass_ReferenceType = 32,
	UANodeClass_DataType = 64,
	UANodeClass_View = 128,
	UANodeClass_All = 255
} UANodeClass;

typedef enum UANodeClassMask
{	UANCM_None = 0,
	UANCM_Object = 1,
	UANCM_Variable = 2,
	UANCM_Method = 4,
	UANCM_ObjectType = 8,
	UANCM_VariableType = 16,
	UANCM_ReferenceType = 32,
	UANCM_DataType = 64,
	UANCM_View = 128,
	UANCM_All = 255
} UANodeClassMask;

typedef enum UAAttributeID
{	UAAI_Default = 0,
	UAAI_NodeId = 1,
	UAAI_NodeClass = 2,
	UAAI_BrowseName = 3,
	UAAI_DisplayName = 4,
	UAAI_Description = 5,
	UAAI_WriteMask = 6,
	UAAI_UserWriteMask = 7,
	UAAI_IsAbstract = 8,
	UAAI_Symmetric = 9,
	UAAI_InverseName = 10,
	UAAI_ContainsNoLoops = 11,
	UAAI_EventNotifier = 12,
	UAAI_Value = 13,
	UAAI_DataType = 14,
	UAAI_ValueRank = 15,
	UAAI_ArrayDimensions = 16,
	UAAI_AccessLevel = 17,
	UAAI_UserAccessLevel = 18,
	UAAI_MinimumSamplingInterval = 19,
	UAAI_Historizing = 20,
	UAAI_Executable = 21,
	UAAI_UserExecutable = 22,
	UAAI_DataTypeDefinition = 23,
	UAAI_RolePermission = 24,
	UAAI_UserRolePermissions = 25,
	UAAI_AccessRestriction = 26,
	UAAI_AccessLevelEx = 27
} UAAttributeID;

typedef enum UAConnectionStatus
{	UACS_Connected = 0,
	UACS_ConnectionError = 1,
	UACS_Shutdown = 2
} UAConnectionStatus;

typedef enum UAServerState
{	UASS_Running = 0,
	UASS_Failed = 1,
	UASS_NoConfiguration = 2,
	UASS_Suspended = 3,
	UASS_Shutdown = 4,
	UASS_Test = 5,
	UASS_CommunicationFault = 6,
	UASS_Unknown = 7
} UAServerState;

typedef enum BrUaVariantType
{	BrUaVariantType_Null = 0,
	BrUaVariantType_Boolean = 1,
	BrUaVariantType_SByte = 2,
	BrUaVariantType_Byte = 3,
	BrUaVariantType_Int16 = 4,
	BrUaVariantType_UInt16 = 5,
	BrUaVariantType_Int32 = 6,
	BrUaVariantType_UInt32 = 7,
	BrUaVariantType_Int64 = 8,
	BrUaVariantType_UInt64 = 9,
	BrUaVariantType_Float = 10,
	BrUaVariantType_Double = 11,
	BrUaVariantType_String = 12,
	BrUaVariantType_DateTime = 13,
	BrUaVariantType_Guid = 14,
	BrUaVariantType_ByteString = 15,
	BrUaVariantType_XmlElement = 16,
	BrUaVariantType_NodeId = 17,
	BrUaVariantType_ExpandedNodeId = 18,
	BrUaVariantType_StatusCode = 19,
	BrUaVariantType_QualifiedName = 20,
	BrUaVariantType_LocalizedText = 21
} BrUaVariantType;

typedef enum UABrowseDirection
{	UABD_Forward = 0,
	UABD_Inverse = 1,
	UABD_Both = 2
} UABrowseDirection;

typedef enum UABrowseResultMask
{	UABRM_None = 0,
	UABRM_ReferenceType = 1,
	UABRM_IsForward = 2,
	UABRM_NodeClass = 4,
	UABRM_BrowseName = 8,
	UABRM_DisplayName = 16,
	UABRM_TypeDefinition = 32,
	UABRM_TargetInfo = 60,
	UABRM_All = 63
} UABrowseResultMask;

typedef enum UAMonitoringSyncMode
{	UAMS_Unknown = 0,
	UAMS_ControllerSync = 1,
	UAMS_FwSync = 2
} UAMonitoringSyncMode;

typedef struct UAUserIdentityToken
{	enum UAUserIdentityTokenTtype UserIdentityTokenType;
	plcstring TokenParam1[256];
	plcstring TokenParam2[256];
} UAUserIdentityToken;

typedef struct UASessionConnectInfo
{	plcstring SessionName[256];
	plcstring ApplicationName[256];
	enum UASecurityMsgMode SecurityMsgMode;
	enum UASecurityPolicy SecurityPolicy;
	plcstring CertificateStore[256];
	plcstring ClientCertificateName[256];
	plcstring ServerUri[256];
	plcbit CheckServerCertificate;
	enum UATransportProfile TransportProfile;
	struct UAUserIdentityToken UserIdentityToken;
	plcstring VendorSpecificParameter[256];
	plctime SessionTimeout;
	plctime MonitorConnection;
	plcstring LocaleIDs[5][7];
} UASessionConnectInfo;

typedef struct UANodeID
{	unsigned short NamespaceIndex;
	plcstring Identifier[256];
	enum UAIdentifierType IdentifierType;
} UANodeID;

typedef struct UAMonitoringParameter
{	plctime SamplingInterval;
	unsigned short QueueSize;
	plcbit DiscardOldest;
	enum UADeadbandType DeadbandType;
	float Deadband;
} UAMonitoringParameter;

typedef struct UAMonitoredVariables
{	plcstring Values[256];
	plcstring TimeStamps[256];
	plcstring NodeQualityIDs[256];
	unsigned short NewValuesCount;
} UAMonitoredVariables;

typedef struct UALocalizedText
{	plcstring Locale[7];
	plcwstring Text[256];
} UALocalizedText;

typedef struct UANodeInfo
{	plcbyte AccessLevel;
	unsigned long ArrayDimension[7];
	plcstring BrowseName[256];
	plcbit ContainsNoLoops;
	struct UANodeID DataType;
	struct UALocalizedText Description;
	struct UALocalizedText DisplayName;
	plcbyte EventNotifier;
	plcbit Executable;
	plcbit Historizing;
	plcstring InverseName[256];
	plcbit IsAbstract;
	plctime MinimumSamplingInterval;
	enum UANodeClass NodeClass;
	struct UANodeID NodeID;
	plcbit Symmetric;
	plcbyte UserAccessLevel;
	plcbit UserExecutable;
	unsigned long UserWriteMask;
	signed long ValueRank;
	unsigned long WriteMask;
} UANodeInfo;

typedef struct UAQualifiedName
{	unsigned short NamespaceIndex;
	plcstring Name[256];
} UAQualifiedName;

typedef struct UANodeInformation
{	plcbyte AccessLevel;
	unsigned long ArrayDimension[7];
	struct UAQualifiedName BrowseName;
	plcbit ContainsNoLoops;
	struct UANodeID DataType;
	struct UALocalizedText Description;
	struct UALocalizedText DisplayName;
	plcbyte EventNotifier;
	plcbit Executable;
	plcbit Historizing;
	plcstring InverseName[256];
	plcbit IsAbstract;
	plctime MinimumSamplingInterval;
	enum UANodeClassMask NodeClass;
	plcbit Symmetric;
	plcbyte UserAccessLevel;
	plcbit UserExecutable;
	unsigned long UserWriteMask;
	signed long ValueRank;
	unsigned long WriteMask;
} UANodeInformation;

typedef struct UAIndexRange
{	unsigned short StartIndex;
	unsigned short EndIndex;
} UAIndexRange;

typedef struct UANodeAdditionalInfo
{	enum UAAttributeID AttributeID;
	unsigned short IndexRangeCount;
	struct UAIndexRange IndexRange[8];
} UANodeAdditionalInfo;

typedef struct BrUaMethodArgument
{	plcstring Name[65];
	plcstring Value[256];
} BrUaMethodArgument;

typedef struct UAExpandedNodeID
{	struct UANodeID ID;
	plcstring NamespaceURI[256];
	unsigned long ServerIndex;
} UAExpandedNodeID;

typedef struct UARelativePathElement
{	struct UANodeID ReferenceTypeId;
	plcbit IsInverse;
	plcbit IncludeSubtypes;
	struct UAQualifiedName TargetName;
} UARelativePathElement;

typedef struct UARelativePath
{	unsigned short NoOfElements;
	struct UARelativePathElement Elements[16];
} UARelativePath;

typedef struct UABrowsePath
{	struct UANodeID StartingNode;
	struct UARelativePath RelativePath;
} UABrowsePath;

typedef struct UAViewDescription
{	struct UANodeID ViewID;
	plcdt TimeStamp;
	unsigned long Version;
} UAViewDescription;

typedef struct UABrowseDescription
{	struct UANodeID StartingNodeID;
	enum UABrowseDirection Direction;
	struct UANodeID ReferenceTypeID;
	plcbit IncludeSubtypes;
	enum UANodeClassMask NodeClass;
	enum UABrowseResultMask ResultMask;
} UABrowseDescription;

typedef struct UAReferenceDescription
{	struct UANodeID ReferenceTypeID;
	plcbit IsForward;
	struct UAExpandedNodeID NodeID;
	plcstring BrowseName[256];
	struct UALocalizedText DisplayName;
	enum UANodeClassMask NodeClass;
	struct UAExpandedNodeID TypeDefinition;
} UAReferenceDescription;

typedef struct BrUaDataValue
{	plcbit Valid;
	unsigned char Reserved[3];
	unsigned long StatusCode;
	plcdt SourceTimestamp;
	plcdt ServerTimestamp;
} BrUaDataValue;

typedef struct BrUaVariant
{	enum BrUaVariantType VariantType;
	plcbit Boolean;
	signed char SByte;
	unsigned char Byte;
	signed short Int16;
	unsigned short UInt16;
	signed long Int32;
	unsigned long UInt32;
	float Float;
	double Double;
	plcdt DateTime;
	plcstring String[256];
	struct UANodeID NodeId;
	struct UAExpandedNodeID ExpandedNodeId;
	struct UAQualifiedName QualifiedName;
	struct UALocalizedText LocalizedText;
	struct BrUaDataValue DataValue;
} BrUaVariant;

typedef struct BrUaRange
{	double Low;
	double High;
} BrUaRange;

typedef struct BrUaEUInformation
{	plcstring NamespaceUri[256];
	signed long UnitId;
	struct UALocalizedText DisplayName;
	struct UALocalizedText Description;
} BrUaEUInformation;

typedef struct BrUaByteString
{	signed long Length;
	unsigned char Data[1024];
} BrUaByteString;

typedef struct BrUaXmlElement
{	signed long Length;
	plcstring Data[65536];
} BrUaXmlElement;

typedef struct BrUaImageBMP
{	signed long Length;
	unsigned char Data[6291456];
} BrUaImageBMP;

typedef struct BrUaImageGIF
{	signed long Length;
	unsigned char Data[524288];
} BrUaImageGIF;

typedef struct BrUaImageJPG
{	signed long Length;
	unsigned char Data[1048576];
} BrUaImageJPG;

typedef struct BrUaImagePNG
{	signed long Length;
	unsigned char Data[2621440];
} BrUaImagePNG;

typedef struct BrUaTimeZoneDataType
{	signed short TimeOffset;
	plcbit DaylightSaving;
} BrUaTimeZoneDataType;

typedef struct UA_Connect
{
	/* VAR_INPUT (analog) */
	plcstring ServerEndpointUrl[256];
	struct UASessionConnectInfo SessionConnectInfo;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword ConnectionHdl;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_Connect_typ;

typedef struct UA_Disconnect
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_Disconnect_typ;

typedef struct UA_NamespaceGetIndex
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcstring NamespaceUri[256];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	unsigned short NamespaceIndex;
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NamespaceGetIndex_typ;

typedef struct UA_NamespaceGetIndexList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NamespaceUrisCount;
	plcstring NamespaceUris[64][256];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword ErrorIDs[64];
	unsigned short NamespaceIndexes[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NamespaceGetIndexList_typ;

typedef struct UA_ServerGetUriByIndex
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned long ServerIndex;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcstring ServerUri[256];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_ServerGetUriByIndex_typ;

typedef struct UA_ServerGetIndexByUriList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short ServerUrisCount;
	plcstring ServerUris[64][256];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword ErrorIDs[64];
	unsigned long ServerIndexes[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_ServerGetIndexByUriList_typ;

typedef struct UA_Browse
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	struct UAViewDescription ViewDescription;
	struct UABrowseDescription BrowseDescription;
	plcdword ContinuationPointIn;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	unsigned short BrowseResultCount;
	struct UAReferenceDescription BrowseResult[64];
	plcdword ContinuationPointOut;
	/* VAR (analog) */
	plcdword i_continuation;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_Browse_typ;

typedef struct UA_TranslatePath
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	struct UANodeID StartNodeID;
	plcstring RelativePath[256];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	struct UANodeID TargetNodeID;
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_TranslatePath_typ;

typedef struct UA_TranslatePathList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short BrowsePathsCount;
	struct UABrowsePath BrowsePaths[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	struct UANodeID TargetNodeIDs[64];
	plcdword TargetErrorIDs[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_TranslatePathList_typ;

typedef struct UA_NodeGetHandle
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	struct UANodeID NodeID;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword NodeHdl;
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NodeGetHandle_typ;

typedef struct UA_NodeGetHandleList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeIDCount;
	struct UANodeID NodeIDs[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	plcdword NodeHdls[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NodeGetHandleList_typ;

typedef struct UA_NodeReleaseHandle
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcdword NodeHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NodeReleaseHandle_typ;

typedef struct UA_NodeReleaseHandleList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeHdlCount;
	plcdword NodeHdls[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NodeReleaseHandleList_typ;

typedef struct UA_NodeGetInfo
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	struct UANodeID NodeID;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	struct UANodeInfo NodeInfo;
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NodeGetInfo_typ;

typedef struct UA_NodeGetInformation
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	struct UANodeID NodeID;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeGetInfoErrorIDs[23];
	struct UANodeInformation NodeInfo;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_NodeGetInformation_typ;

typedef struct UA_SubscriptionCreate
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcbyte Priority;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword SubscriptionHdl;
	/* VAR_IN_OUT (analog and digital) */
	plctime* PublishingInterval;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit PublishingEnable;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_SubscriptionCreate_typ;

typedef struct UA_SubscriptionDelete
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_SubscriptionDelete_typ;

typedef struct UA_SubscriptionModify
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	plcbyte Priority;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_IN_OUT (analog and digital) */
	plctime* PublishingInterval;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit PublishingEnable;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_SubscriptionModify_typ;

typedef struct UA_SubscriptionProcessed
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	plcbit Published;
	/* VAR (digital) */
	plcbit i_busy;
} UA_SubscriptionProcessed_typ;

typedef struct UA_MonitoredItemAddList
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	unsigned short NodeHdlCount;
	plcdword NodeHdls[64];
	enum UAMonitoringSyncMode SyncMode;
	struct UANodeAdditionalInfo NodeAddInfos[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	plcdword MonitoredItemHdls[64];
	/* VAR_IN_OUT (analog and digital) */
	struct UAMonitoredVariables (*Variables)[64];
	struct UAMonitoringParameter (*MonitoringParameter)[64];
	plcbit (*ValuesChanged)[64];
	unsigned short (*MinLostValueCount)[64];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MonitoredItemAddList_typ;

typedef struct UA_MonitoredItemRemoveList
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	unsigned short MonitoredItemHdlCount;
	plcdword MonitoredItemHdls[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MonitoredItemRemoveList_typ;

typedef struct UA_MonitoredItemModifyList
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	unsigned short MonitoredItemHdlCount;
	plcdword MonitoredItemHdls[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	/* VAR_IN_OUT (analog and digital) */
	struct UAMonitoringParameter (*MonitoringParameters)[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MonitoredItemModifyList_typ;

typedef struct UA_MonitoredItemOperateList
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	unsigned short MonitoredItemHdlCount;
	plcdword MonitoredItemHdls[64];
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	plcbit Published;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MonitoredItemOperateList_typ;

typedef struct UA_EventItemAdd
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	plcdword NodeHdl;
	struct UANodeID EventType;
	unsigned short EventFieldSelectionCount;
	struct UARelativePath EventFieldSelections[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword EventItemHdl;
	/* VAR_IN_OUT (analog and digital) */
	plcstring (*EventFields)[64][256];
	plcbit* EventProcessed;
	unsigned short* RemainingEventCount;
	plcdword (*FieldErrorIDs)[64];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_EventItemAdd_typ;

typedef struct UA_EventItemRemoveList
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	unsigned short EventItemHdlCount;
	plcdword EventItemHdls[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword ErrorIDs[64];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_EventItemRemoveList_typ;

typedef struct UA_EventItemOperateList
{
	/* VAR_INPUT (analog) */
	plcdword SubscriptionHdl;
	unsigned short EventItemHdlCount;
	plcdword EventItemHdls[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword FieldErrorIDs[64];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	plcbit EventProcessed;
	/* VAR (digital) */
	plcbit i_busy;
} UA_EventItemOperateList_typ;

typedef struct UA_Read
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcdword NodeHdl;
	struct UANodeAdditionalInfo NodeAddInfo;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdt TimeStamp;
	/* VAR_IN_OUT (analog and digital) */
	plcstring *Variable;
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_Read_typ;

typedef struct UA_ReadList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeHdlCount;
	plcdword NodeHdls[64];
	struct UANodeAdditionalInfo NodeAddInfo[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	plcdt TimeStamps[64];
	/* VAR_IN_OUT (analog and digital) */
	plcstring (*Variables)[64][256];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_ReadList_typ;

typedef struct BrUa_ReadBulk
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeIDCount;
	unsigned long NodeIDs;
	unsigned long NodeAddInfo;
	unsigned long Variables;
	unsigned long NodeErrorIDs;
	unsigned long TimeStamps;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} BrUa_ReadBulk_typ;

typedef struct UA_Write
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcdword NodeHdl;
	struct UANodeAdditionalInfo NodeAddInfo;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_IN_OUT (analog and digital) */
	plcstring *Variable;
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_Write_typ;

typedef struct UA_WriteList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeHdlCount;
	plcdword NodeHdls[64];
	struct UANodeAdditionalInfo NodeAddInfo[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword NodeErrorIDs[64];
	/* VAR_IN_OUT (analog and digital) */
	plcstring (*Variables)[64][256];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_WriteList_typ;

typedef struct BrUa_WriteBulk
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeIDCount;
	unsigned long NodeIDs;
	unsigned long NodeAddInfo;
	unsigned long Variables;
	unsigned long NodeErrorIDs;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} BrUa_WriteBulk_typ;

typedef struct UA_MethodGetHandle
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	struct UANodeID ObjectNodeID;
	struct UANodeID MethodNodeID;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword MethodHdl;
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MethodGetHandle_typ;

typedef struct UA_MethodGetHandleList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short NodeIDCount;
	struct UANodeID ObjectNodeIDs[64];
	struct UANodeID MethodNodeIDs[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword ErrorIDs[64];
	plcdword MethodHdls[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MethodGetHandleList_typ;

typedef struct UA_MethodReleaseHandle
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcdword MethodHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MethodReleaseHandle_typ;

typedef struct UA_MethodReleaseHandleList
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	unsigned short MethodHdlCount;
	plcdword MethodHdls[64];
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	plcdword ErrorIDs[64];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MethodReleaseHandleList_typ;

typedef struct UA_MethodCall
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plcdword MethodHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	/* VAR_IN_OUT (analog and digital) */
	plcdword* MethodResult;
	struct BrUaMethodArgument (*InputArguments)[10];
	struct BrUaMethodArgument (*OutputArguments)[10];
	/* VAR (analog) */
	unsigned long i_tid;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_MethodCall_typ;

typedef struct UA_ConnectionGetStatus
{
	/* VAR_INPUT (analog) */
	plcdword ConnectionHdl;
	plctime Timeout;
	/* VAR_OUTPUT (analog) */
	plcdword ErrorID;
	enum UAConnectionStatus ConnectionStatus;
	enum UAServerState ServerState;
	plcbyte ServiceLevel;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	/* VAR (digital) */
	plcbit i_busy;
} UA_ConnectionGetStatus_typ;

typedef signed long BrUaArrayLength;

typedef signed long BrUaNoOfElements;

typedef UANodeID BrUaNodeId;

typedef UAQualifiedName BrUaQualifiedName;

typedef UALocalizedText BrUaLocalizedText;

typedef plcstring BrUaGuidString[37];

typedef double BrUaDuration;

typedef plcstring BrUaLocaleIdString[7];



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void UA_Connect(struct UA_Connect* inst);
_BUR_PUBLIC void UA_Disconnect(struct UA_Disconnect* inst);
_BUR_PUBLIC void UA_NamespaceGetIndex(struct UA_NamespaceGetIndex* inst);
_BUR_PUBLIC void UA_NamespaceGetIndexList(struct UA_NamespaceGetIndexList* inst);
_BUR_PUBLIC void UA_ServerGetUriByIndex(struct UA_ServerGetUriByIndex* inst);
_BUR_PUBLIC void UA_ServerGetIndexByUriList(struct UA_ServerGetIndexByUriList* inst);
_BUR_PUBLIC void UA_Browse(struct UA_Browse* inst);
_BUR_PUBLIC void UA_TranslatePath(struct UA_TranslatePath* inst);
_BUR_PUBLIC void UA_TranslatePathList(struct UA_TranslatePathList* inst);
_BUR_PUBLIC void UA_NodeGetHandle(struct UA_NodeGetHandle* inst);
_BUR_PUBLIC void UA_NodeGetHandleList(struct UA_NodeGetHandleList* inst);
_BUR_PUBLIC void UA_NodeReleaseHandle(struct UA_NodeReleaseHandle* inst);
_BUR_PUBLIC void UA_NodeReleaseHandleList(struct UA_NodeReleaseHandleList* inst);
_BUR_PUBLIC void UA_NodeGetInfo(struct UA_NodeGetInfo* inst);
_BUR_PUBLIC void UA_NodeGetInformation(struct UA_NodeGetInformation* inst);
_BUR_PUBLIC void UA_SubscriptionCreate(struct UA_SubscriptionCreate* inst);
_BUR_PUBLIC void UA_SubscriptionDelete(struct UA_SubscriptionDelete* inst);
_BUR_PUBLIC void UA_SubscriptionModify(struct UA_SubscriptionModify* inst);
_BUR_PUBLIC void UA_SubscriptionProcessed(struct UA_SubscriptionProcessed* inst);
_BUR_PUBLIC void UA_MonitoredItemAddList(struct UA_MonitoredItemAddList* inst);
_BUR_PUBLIC void UA_MonitoredItemRemoveList(struct UA_MonitoredItemRemoveList* inst);
_BUR_PUBLIC void UA_MonitoredItemModifyList(struct UA_MonitoredItemModifyList* inst);
_BUR_PUBLIC void UA_MonitoredItemOperateList(struct UA_MonitoredItemOperateList* inst);
_BUR_PUBLIC void UA_EventItemAdd(struct UA_EventItemAdd* inst);
_BUR_PUBLIC void UA_EventItemRemoveList(struct UA_EventItemRemoveList* inst);
_BUR_PUBLIC void UA_EventItemOperateList(struct UA_EventItemOperateList* inst);
_BUR_PUBLIC void UA_Read(struct UA_Read* inst);
_BUR_PUBLIC void UA_ReadList(struct UA_ReadList* inst);
_BUR_PUBLIC void BrUa_ReadBulk(struct BrUa_ReadBulk* inst);
_BUR_PUBLIC void UA_Write(struct UA_Write* inst);
_BUR_PUBLIC void UA_WriteList(struct UA_WriteList* inst);
_BUR_PUBLIC void BrUa_WriteBulk(struct BrUa_WriteBulk* inst);
_BUR_PUBLIC void UA_MethodGetHandle(struct UA_MethodGetHandle* inst);
_BUR_PUBLIC void UA_MethodGetHandleList(struct UA_MethodGetHandleList* inst);
_BUR_PUBLIC void UA_MethodReleaseHandle(struct UA_MethodReleaseHandle* inst);
_BUR_PUBLIC void UA_MethodReleaseHandleList(struct UA_MethodReleaseHandleList* inst);
_BUR_PUBLIC void UA_MethodCall(struct UA_MethodCall* inst);
_BUR_PUBLIC void UA_ConnectionGetStatus(struct UA_ConnectionGetStatus* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define UA_Bad_MonitoringQueueSize 2952790029U
 #define UA_Bad_ElementCount 2952790028U
 #define UA_Bad_VariableNameInvalid 2952790020U
 #define UA_Bad_SyncModeInvalid 2684355843U
 #define UA_Bad_MonitoredItemSyncMismatch 2684355842U
 #define UA_Bad_MonitoredItemInvalidHdl 2684355841U
 #define UA_Bad_SubscriptionInvalidHdl 2684355840U
 #define UA_Bad_AttributeIdInvalid 2684355585U
 #define UA_Bad_AttributeIdUnknown 2684355584U
 #define UA_Bad_MethodInvalidHdl 2684355331U
 #define UA_Bad_NodeInvalidHdl 2684355330U
 #define UA_Bad_ResultTooLong 2684355328U
 #define UA_Bad_NsNotFound 2684355072U
 #define UA_Bad_ConnectionInvalidHdl 2684354821U
 #define UA_Bad_FW_TempError 2684354562U
 #define UA_Bad_FW_PermanentError 2684354561U
 #define MAX_INDEX_EVENTFIELDSELECTION 63U
 #define MAX_INDEX_EVENTITEMLIST 63U
 #define MAX_INDEX_METHOD 63U
 #define MAX_INDEX_NAMESPACES 63U
 #define MAX_INDEX_BROWSERESULT 63U
 #define MAX_INDEX_BYTESTRING 1023U
 #define MAX_INDEX_RELATIVEPATH 15U
 #define MAX_INDEX_ARGUMENTS 9U
 #define MAX_INDEX_MONITORLIST 63U
 #define MAX_INDEX_NODELIST 63U
 #define MAX_INDEX_INDEXRANGE 7U
 #define MAX_INDEX_ARRAYDIMENSION 6U
 #define MAX_EVENT_FIELD_SELECTIONS 64U
 #define MAX_ELEMENTS_EVENTITEMLIST 64U
 #define MAX_ELEMENTS_METHOD 64U
 #define MAX_ELEMENTS_NAMESPACES 64U
 #define MAX_ELEMENTS_BROWSERESULT 64U
 #define MAX_ELEMENTS_RELATIVEPATH 16U
 #define MAX_ELEMENTS_ARGUMENTS 10U
 #define MAX_ELEMENTS_MONITORLIST 64U
 #define MAX_ELEMENTS_NODELIST 64U
 #define MAX_ELEMENTS_INDEXRANGE 8U
 #define MAX_ELEMENTS_ARRAYDIMENSION 7U
 #define MAX_LENGTH_LOCALEID 6U
 #define MAX_LENGTH_BYTESTRING 1024U
 #define MAX_LENGTH_ARGUMENT 64U
 #define MAX_LENGTH_VARIABLE 255U
 #define MAX_LENGTH_STRING 255U
#else
 _GLOBAL_CONST unsigned long UA_Bad_MonitoringQueueSize;
 _GLOBAL_CONST unsigned long UA_Bad_ElementCount;
 _GLOBAL_CONST unsigned long UA_Bad_VariableNameInvalid;
 _GLOBAL_CONST unsigned long UA_Bad_SyncModeInvalid;
 _GLOBAL_CONST unsigned long UA_Bad_MonitoredItemSyncMismatch;
 _GLOBAL_CONST unsigned long UA_Bad_MonitoredItemInvalidHdl;
 _GLOBAL_CONST unsigned long UA_Bad_SubscriptionInvalidHdl;
 _GLOBAL_CONST unsigned long UA_Bad_AttributeIdInvalid;
 _GLOBAL_CONST unsigned long UA_Bad_AttributeIdUnknown;
 _GLOBAL_CONST unsigned long UA_Bad_MethodInvalidHdl;
 _GLOBAL_CONST unsigned long UA_Bad_NodeInvalidHdl;
 _GLOBAL_CONST unsigned long UA_Bad_ResultTooLong;
 _GLOBAL_CONST unsigned long UA_Bad_NsNotFound;
 _GLOBAL_CONST unsigned long UA_Bad_ConnectionInvalidHdl;
 _GLOBAL_CONST unsigned long UA_Bad_FW_TempError;
 _GLOBAL_CONST unsigned long UA_Bad_FW_PermanentError;
 _GLOBAL_CONST unsigned short MAX_INDEX_EVENTFIELDSELECTION;
 _GLOBAL_CONST unsigned short MAX_INDEX_EVENTITEMLIST;
 _GLOBAL_CONST unsigned short MAX_INDEX_METHOD;
 _GLOBAL_CONST unsigned short MAX_INDEX_NAMESPACES;
 _GLOBAL_CONST unsigned short MAX_INDEX_BROWSERESULT;
 _GLOBAL_CONST unsigned short MAX_INDEX_BYTESTRING;
 _GLOBAL_CONST unsigned short MAX_INDEX_RELATIVEPATH;
 _GLOBAL_CONST unsigned short MAX_INDEX_ARGUMENTS;
 _GLOBAL_CONST unsigned short MAX_INDEX_MONITORLIST;
 _GLOBAL_CONST unsigned short MAX_INDEX_NODELIST;
 _GLOBAL_CONST unsigned short MAX_INDEX_INDEXRANGE;
 _GLOBAL_CONST unsigned short MAX_INDEX_ARRAYDIMENSION;
 _GLOBAL_CONST unsigned short MAX_EVENT_FIELD_SELECTIONS;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_EVENTITEMLIST;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_METHOD;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_NAMESPACES;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_BROWSERESULT;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_RELATIVEPATH;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_ARGUMENTS;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_MONITORLIST;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_NODELIST;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_INDEXRANGE;
 _GLOBAL_CONST unsigned short MAX_ELEMENTS_ARRAYDIMENSION;
 _GLOBAL_CONST unsigned short MAX_LENGTH_LOCALEID;
 _GLOBAL_CONST unsigned short MAX_LENGTH_BYTESTRING;
 _GLOBAL_CONST unsigned short MAX_LENGTH_ARGUMENT;
 _GLOBAL_CONST unsigned short MAX_LENGTH_VARIABLE;
 _GLOBAL_CONST unsigned short MAX_LENGTH_STRING;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASOPCUAC_ */

