                                                                      
 TYPE
	UASecurityMsgMode :
	(												(* Message security modes *)
    	UASMM_BestAvailable 				:= 0,	(* Detects best available mode the server provides (may result in no security) 	*)
	  	UASMM_None          				:= 1,	(* No secure communication 														*)
	  	UASMM_Sign          				:= 2,	(* Messages are signed to verify peer authenticity 								*)
	  	UASMM_SignEncrypt   				:= 3	(* Messages are signed and encrypted 											*)
	);
	
  	UASecurityPolicy :
  	(												(* Security policies *)
    	UASP_BestAvailable  				:= 0,	(* Detects best available policy the server provides (may result in no security)	*)
    	UASP_None           				:= 1,	(* http://opcfoundation.org/UA/SecurityPolicy#None									*)
    	UASP_Basic128Rsa15  				:= 2,	(* http://opcfoundation.org/UA/SecurityPolicy#Basic128Rsa15 (Deprecated)			*)
    	UASP_Basic256       				:= 3,	(* http://opcfoundation.org/UA/SecurityPolicy#Basic256 (Deprecated)					*)
    	UASP_Basic256Sha256   				:= 4,	(* http://opcfoundation.org/UA/SecurityPolicy#Basic256Sha256						*)
		UASP_Aes128_Sha256_RsaOaep   		:= 5,	(* http://opcfoundation.org/UA/SecurityPolicy#Aes128_Sha256_RsaOaep					*)
		UASP_Aes256_Sha256_RsaPss   		:= 6,	(* http://opcfoundation.org/UA/SecurityPolicy#Aes256_Sha256_RsaPss					*)
		UASP_EccNnistP256   				:= 7,	(* http://opcfoundation.org/UA/SecurityPolicy#ECC_nistP256							*)
		UASP_EccNistP384   					:= 8,	(* http://opcfoundation.org/UA/SecurityPolicy#ECC_nistP384							*)
		UASP_EccBrainpoolP256r1   			:= 9,	(* http://opcfoundation.org/UA/SecurityPolicy#ECC_brainpoolP256r1					*)
		UASP_EccBrainpoolP384r1   			:= 10,	(* http://opcfoundation.org/UA/SecurityPolicy#ECC_brainpoolP384r1					*)
		UASP_EccCurve25519   				:= 11	(* http://opcfoundation.org/UA/SecurityPolicy#ECC_curve25519						*)
  	);
  	
  	UATransportProfile :
  	(  												(* Transport profiles to select encoding and protocol					*)
    	UATP_UATcp             				:= 1,	(* http://opcfoundation.org/UA-Profile/Transport/uatcp-uasc-uabinary	*)
    	UATP_WSHttpBinary      				:= 2,	(* http://opcfoundation.org/UA-Profile/Transport/https-uabinary			*)
    	UATP_WSHttpXmlOrBinary 				:= 3,	(* Client will chose one of UATP_WSHttpXml or UATP_WSHttpBinary			*)
    	UATP_WSHttpXml         				:= 4	(* http://opcfoundation.org/UA-Profile/Transport/https-uasoapxml		*)
  	);
  	
 	UAUserIdentityTokenTtype :
 	(  												(* Authentication token type provided for logon *)
 		UAUITT_Anonymous					:= 0,	(* Logon anonymously					*)
 		UAUITT_Username						:= 1,	(* Logon with user name and password 	*)
 		UAUITT_x509							:= 2	(* Logon with user certificate			*)
 	);
	 
	UAIdentifierType :
	(												(* Node identifier type *)
		UAIT_Numeric 						:= 0,	(* Numeric value	*)
		UAIT_String 						:= 1,	(* String			*)
		UAIT_GUID 							:= 2,	(* GUID				*)
		UAIT_Opaque							:= 3	(* ByteString		*)
	);
	
	UADeadbandType :
	(												(* Deadband type for monitored item sampling *)
		UADT_None 							:= 0,	(* No deadband, each value change is sampled						*)
		UADT_Absolute 						:= 1,	(* Absolute value to exceed from last sample to make new sample		*)
		UADT_Percent						:= 2	(* Percent of EURange to exceed from last sample to make new sample	*)
	);
	
	UANodeClass :
	(												(* Node classes defined through the OPC-UA standard *)
		UANodeClass_None 					:= 0,
		UANodeClass_Object					:= 1,
		UANodeClass_Variable 				:= 2,
		UANodeClass_Method					:= 4,
		UANodeClass_ObjectType				:= 8,
		UANodeClass_VariableType			:= 16,
		UANodeClass_ReferenceType			:= 32,
		UANodeClass_DataType				:= 64,
		UANodeClass_View					:= 128,
		UANodeClass_All						:= 255	
	);
	
	UANodeClassMask :
	(
		UANCM_None							:= 0,		(* No node class (unspecified). *)
		UANCM_Object						:= 1,
		UANCM_Variable						:= 2,
		UANCM_Method						:= 4,
		UANCM_ObjectType					:= 8,
		UANCM_VariableType					:= 16,
		UANCM_ReferenceType					:= 32,
		UANCM_DataType						:= 64,
		UANCM_View							:= 128,
		UANCM_All							:= 255
	);
	
	UAAttributeID :
	(												(* Attributes defined through the OPC-UA standard *)
	  	UAAI_Default						:= 0,
		UAAI_NodeId							:= 1,
		UAAI_NodeClass						:= 2,
		UAAI_BrowseName						:= 3,
		UAAI_DisplayName					:= 4,
		UAAI_Description					:= 5,
		UAAI_WriteMask						:= 6,
		UAAI_UserWriteMask					:= 7,
		UAAI_IsAbstract						:= 8,
		UAAI_Symmetric						:= 9,
		UAAI_InverseName					:= 10,
		UAAI_ContainsNoLoops				:= 11,
		UAAI_EventNotifier					:= 12,
		UAAI_Value							:= 13,
		UAAI_DataType						:= 14,
		UAAI_ValueRank						:= 15,
		UAAI_ArrayDimensions				:= 16,
		UAAI_AccessLevel					:= 17,
		UAAI_UserAccessLevel				:= 18,
		UAAI_MinimumSamplingInterval		:= 19,
		UAAI_Historizing					:= 20,
		UAAI_Executable						:= 21,
		UAAI_UserExecutable					:= 22,
		UAAI_DataTypeDefinition				:= 23,
		UAAI_RolePermission					:= 24,
		UAAI_UserRolePermissions			:= 25,
		UAAI_AccessRestriction				:= 26,
		UAAI_AccessLevelEx					:= 27
	);
	  
	UAConnectionStatus :
	(												(* Status of the underlying connection		*)
		UACS_Connected						:= 0,
		UACS_ConnectionError				:= 1,
		UACS_Shutdown						:= 2
	);
	  
	UAServerState :
	(												(* State of the server read from Object.Server.ServerStatus.State	*)
		UASS_Running						:= 0,
		UASS_Failed							:= 1,
		UASS_NoConfiguration				:= 2,
		UASS_Suspended						:= 3,
		UASS_Shutdown						:= 4,
		UASS_Test							:= 5,
		UASS_CommunicationFault				:= 6,
		UASS_Unknown              			:= 7
	);

	BrUaVariantType :				
	(												(* Kind of the variant data *)
		BrUaVariantType_Null				:= 0,	(* No data *)
		BrUaVariantType_Boolean				:= 1,	(* Data in element Boolean *)
		BrUaVariantType_SByte				:= 2,	(* Data in element SByte *)
		BrUaVariantType_Byte				:= 3,	(* Data in element Byte *)
		BrUaVariantType_Int16				:= 4,	(* Data in element Int16 *)
		BrUaVariantType_UInt16				:= 5,	(* Data in element UInt16 *)
		BrUaVariantType_Int32				:= 6,	(* Data in element Int32 *)
		BrUaVariantType_UInt32				:= 7,	(* Data in element UInt32 *)
		BrUaVariantType_Int64				:= 8,	(* Data in element Int64 *)
		BrUaVariantType_UInt64				:= 9,	(* Data in element UInt64 *)
		BrUaVariantType_Float				:= 10,	(* Data in element Float *)
		BrUaVariantType_Double				:= 11,	(* Data in element Double *)
		BrUaVariantType_String				:= 12,	(* Data in element String *)
		BrUaVariantType_DateTime			:= 13,	(* Data in element DateTime *)
		BrUaVariantType_Guid				:= 14,	(* Guid data in element String *)
		BrUaVariantType_ByteString			:= 15,	(* Byte string in element String *)
		BrUaVariantType_XmlElement			:= 16,	(* XML data in element String *)
		BrUaVariantType_NodeId				:= 17,	(* Data in element NodeId *)
		BrUaVariantType_ExpandedNodeId		:= 18,	(* Data in element ExpandedNodeId *)
		BrUaVariantType_StatusCode			:= 19,	(* Status code in element UInt32 *)
		BrUaVariantType_QualifiedName		:= 20,	(* Data in element QualifiedName *)
		BrUaVariantType_LocalizedText		:= 21	(* Data in element LocalizedText *)
	);

	UABrowseDirection :
	(
		UABD_Forward						:= 0,	(* Select only forward References. *)
		UABD_Inverse						:= 1,	(* Select only inverse References. *)
		UABD_Both							:= 2	(* Select forward and inverse References. *)
	);
	
	UABrowseResultMask :
	(
		UABRM_None							:= 0,
		UABRM_ReferenceType					:= 1,
		UABRM_IsForward						:= 2,
		UABRM_NodeClass						:= 4,
		UABRM_BrowseName					:= 8,
		UABRM_DisplayName					:= 16,
		UABRM_TypeDefinition				:= 32,
		UABRM_TargetInfo					:= 60,	(* NodeClass + BrowseName + DisplayName + TypeDefinition *)
		UABRM_All							:= 63
	);	

	UAMonitoringSyncMode :
	(
		UAMS_Unknown						:= 0,	(* Unknown SynMode *)
		UAMS_ControllerSync					:= 1,	(* SyncMode is ControllerSync *)
		UAMS_FwSync							:= 2	(* SyncMode is FwSync (FirmwareSync) *)
	);
	
	BrUaArrayLength : DINT;							(* Arraylength of value attribute in AttributeRead and AttributeWrite services *)

	BrUaNoOfElements : DINT;						(* Number of elements for arrays nested in structures *)

   	UAUserIdentityToken : STRUCT 					(* Identity token for authentication on an OPC-UA server *)
		UserIdentityTokenType	: UAUserIdentityTokenTtype;	
		TokenParam1 			: STRING[MAX_LENGTH_STRING];
		TokenParam2				: STRING[MAX_LENGTH_STRING];
	END_STRUCT;
 
 	UASessionConnectInfo : STRUCT 					(* Session information and parameters *)
 	  	SessionName   			: STRING[MAX_LENGTH_STRING];
 	  	ApplicationName   		: STRING[MAX_LENGTH_STRING];
 	  	SecurityMsgMode   		: UASecurityMsgMode;
    	SecurityPolicy   		: UASecurityPolicy;
		CertificateStore		: STRING[MAX_LENGTH_STRING];
		ClientCertificateName	: STRING[MAX_LENGTH_STRING];
		ServerUri				: STRING[MAX_LENGTH_STRING];
		CheckServerCertificate	: BOOL;
    	TransportProfile 		: UATransportProfile;
    	UserIdentityToken		: UAUserIdentityToken;
		VendorSpecificParameter	: STRING[MAX_LENGTH_STRING];
    	SessionTimeout   		: TIME;
    	MonitorConnection		: TIME;
    	LocaleIDs				: ARRAY[0..4] OF STRING[MAX_LENGTH_LOCALEID];
	END_STRUCT;
	
  	UANodeID : STRUCT 											(* Node identifier used to address nodes on the server		*)
		NamespaceIndex			: UINT;							(* Index of the namespace which contains the node			*)
		Identifier 				: STRING[MAX_LENGTH_STRING];	(* Node identifier according to the identifier types format *)	
		IdentifierType			: UAIdentifierType; 			(* String, Numeric, GUID, ByteString						*)
	END_STRUCT;

	UAMonitoringParameter : STRUCT								(* Settings for data item monitoring								*)
		SamplingInterval		: TIME;							(* Time in ms 														*)
		QueueSize				: UINT;							(* Size of the server sided queue to collect value changes			*)
		DiscardOldest			: BOOL;							(* True to discard oldest on queue overflow or newest otherwise		*)
		DeadbandType			: UADeadbandType; 				(* Deadband type which applies to deadband value					*)
		Deadband				: REAL; 						(* Deadband value, semantics depending on DeadbandType 				*)
	END_STRUCT;
	
	UAMonitoredVariables : STRUCT
		Values					: STRING[MAX_LENGTH_VARIABLE];	(* Name of variable matching to MonitoredItem data type and QueueSize 	*)
		TimeStamps				: STRING[MAX_LENGTH_VARIABLE];	(* Name of DATE_AND_TIME variable matching to QueueSize 				*)
		NodeQualityIDs			: STRING[MAX_LENGTH_VARIABLE];	(* Name of DWORD variable matching to QueueSize							*)
		NewValuesCount			: UINT;
	END_STRUCT;
	
	UALocalizedText : STRUCT									(* Localized text with locale identifer and text		*)
		Locale					: STRING[MAX_LENGTH_LOCALEID];
		Text					: WSTRING[MAX_LENGTH_STRING];
	END_STRUCT;
	
	UANodeInfo : STRUCT											(* Node attribute values		*)
		AccessLevel 			: BYTE;
		ArrayDimension			: ARRAY[0..MAX_INDEX_ARRAYDIMENSION] OF UDINT;
		BrowseName				: STRING[MAX_LENGTH_STRING];
		ContainsNoLoops 		: BOOL; 
		DataType				: UANodeID;
		Description				: UALocalizedText;
		DisplayName				: UALocalizedText;
		EventNotifier			: BYTE;
		Executable				: BOOL;
		Historizing				: BOOL;
		InverseName				: STRING[MAX_LENGTH_STRING];
		IsAbstract				: BOOL; 
		MinimumSamplingInterval	: TIME;
		NodeClass				: UANodeClass;
		NodeID					: UANodeID;
		Symmetric				: BOOL;
		UserAccessLevel			: BYTE;
		UserExecutable			: BOOL; 
		UserWriteMask			: UDINT;
		ValueRank				: DINT; 
		WriteMask				: UDINT;	
	END_STRUCT;	
	
	UANodeInformation : STRUCT											(* Node attribute values		*)
		AccessLevel 			: BYTE;
		ArrayDimension			: ARRAY[0..MAX_INDEX_ARRAYDIMENSION] OF UDINT;
		BrowseName				: UAQualifiedName ;
		ContainsNoLoops 		: BOOL; 
		DataType				: UANodeID;
		Description				: UALocalizedText;
		DisplayName				: UALocalizedText;
		EventNotifier			: BYTE;
		Executable				: BOOL;
		Historizing				: BOOL;
		InverseName				: STRING[MAX_LENGTH_STRING];
		IsAbstract				: BOOL; 
		MinimumSamplingInterval	: TIME;
		NodeClass				: UANodeClassMask;
		Symmetric				: BOOL;
		UserAccessLevel			: BYTE;
		UserExecutable			: BOOL; 
		UserWriteMask			: UDINT;
		ValueRank				: DINT; 
		WriteMask				: UDINT;	
	END_STRUCT;

	UAIndexRange : STRUCT										(* Index range used for indexed access on arrays	*)
		StartIndex				: UINT;	
		EndIndex 				: UINT;	
	END_STRUCT;
	
	UANodeAdditionalInfo : STRUCT								(* Additional info for reading and writing node attributes	*)
		AttributeID				: UAAttributeID;
		IndexRangeCount			: UINT;
		IndexRange 				: ARRAY[0..MAX_INDEX_INDEXRANGE] OF UAIndexRange;
	END_STRUCT;
	
	BrUaMethodArgument : STRUCT										(* Method argument used to supply the input and receive the output argument values for method calls *)
		Name					: STRING[MAX_LENGTH_ARGUMENT];		(* Name of the method argument																		*)
		Value					: STRING[MAX_LENGTH_VARIABLE];		(* Source/Destination variable name for the argument value											*)
	END_STRUCT;

	UAExpandedNodeID : STRUCT 						(* Expanded node identfier type *) 
		ID						: UANodeID;
		NamespaceURI			: STRING[MAX_LENGTH_STRING];
		ServerIndex				: UDINT;
	END_STRUCT;

	UAQualifiedName : STRUCT						(* Qualified name type *) 
		NamespaceIndex			: UINT;
		Name					: STRING[MAX_LENGTH_STRING];
	END_STRUCT;
	
	UARelativePathElement : STRUCT					(* Relative path element used to build a relative path	*)
	    ReferenceTypeId			: UANodeID;
		IsInverse				: BOOL;
		IncludeSubtypes			: BOOL;
		TargetName				: UAQualifiedName;
	END_STRUCT;
	
	UARelativePath : STRUCT							(* Relative path used to translate and browse nodes	*)
	    NoOfElements			: UINT;
		Elements				: ARRAY[0..MAX_INDEX_RELATIVEPATH] OF UARelativePathElement;
	END_STRUCT;
	
	UABrowsePath : STRUCT
		StartingNode			: UANodeID; 		(* Starting NodeId from where the relative path will be evaluated. *)
		RelativePath			: UARelativePath; 	(* The relative path which will be evaluated. *)
	END_STRUCT;

	UAViewDescription : STRUCT
		ViewID					: UANodeID;
		TimeStamp				: DATE_AND_TIME;
		Version					: UDINT;
	END_STRUCT;

	UABrowseDescription	: STRUCT
		StartingNodeID			: UANodeID;
		Direction				: UABrowseDirection;
		ReferenceTypeID			: UANodeID;
		IncludeSubtypes			: BOOL;
		NodeClass				: UANodeClassMask;
		ResultMask				: UABrowseResultMask;
	END_STRUCT;
	
	UAReferenceDescription : STRUCT
		ReferenceTypeID			: UANodeID;
		IsForward				: BOOL;
		NodeID					: UAExpandedNodeID;
		BrowseName				: STRING[MAX_LENGTH_STRING];
		DisplayName				: UALocalizedText;
		NodeClass				: UANodeClassMask;
		TypeDefinition			: UAExpandedNodeID;
	END_STRUCT;

	BrUaDataValue : STRUCT							(* Additional informations about data value *) 
		Valid 					: BOOL;
		Reserved				: ARRAY[0..2] OF USINT; 
		StatusCode				: UDINT;
		SourceTimestamp			: DATE_AND_TIME;
		ServerTimestamp			: DATE_AND_TIME;
	END_STRUCT;
	
	BrUaVariant : STRUCT							(* Standard type for variant data *) 
		VariantType				: BrUaVariantType;
		Boolean					: BOOL;
		SByte					: SINT;
		Byte					: USINT;
		Int16					: INT;
		UInt16					: UINT;
		Int32					: DINT;
		UInt32					: UDINT;
		Float					: REAL;
		Double					: LREAL;
		DateTime				: DATE_AND_TIME;
		String					: STRING[MAX_LENGTH_STRING];
		NodeId					: UANodeID;
		ExpandedNodeId			: UAExpandedNodeID;
		QualifiedName			: UAQualifiedName;
		LocalizedText			: UALocalizedText;
		DataValue				: BrUaDataValue;
	END_STRUCT;

	BrUaRange : STRUCT								(* Range for a value *)
		Low						: LREAL;
		High					: LREAL;
	END_STRUCT;

	BrUaEUInformation : STRUCT 						(* Information about the engineering units *)
		NamespaceUri			: STRING[MAX_LENGTH_STRING];
		UnitId					: DINT;
		DisplayName				: UALocalizedText;
		Description				: UALocalizedText;
	END_STRUCT;

	BrUaNodeId					: UANodeID;
	BrUaQualifiedName			: UAQualifiedName;
	BrUaLocalizedText			: UALocalizedText;

	BrUaByteString : STRUCT							(* Byte string containing length and data	*)
		Length					: DINT;
		Data					: ARRAY[0..MAX_INDEX_BYTESTRING] OF USINT;
	END_STRUCT;

	BrUaGuidString				: STRING[36];

	BrUaXmlElement : STRUCT
		Length					: DINT;
		Data					: STRING[65535];
	END_STRUCT;

	BrUaImageBMP : STRUCT
		Length					: DINT;
		Data					: ARRAY[0..6291455] OF USINT;
	END_STRUCT;
	BrUaImageGIF : STRUCT
		Length					: DINT;
		Data					: ARRAY[0..524287] OF USINT;
	END_STRUCT;
	BrUaImageJPG : STRUCT
		Length					: DINT;
		Data					: ARRAY[0..1048575] OF USINT;
	END_STRUCT;
	BrUaImagePNG : STRUCT
		Length					: DINT;
		Data					: ARRAY[0..2621439] OF USINT;
	END_STRUCT;

	BrUaDuration				: LREAL;
	BrUaLocaleIdString			: STRING[MAX_LENGTH_LOCALEID];
	
	BrUaTimeZoneDataType : STRUCT					(* Information about time zone	*)
		TimeOffset				: INT;				(* Offset in minutes from UTC	*)
		DaylightSaving			: BOOL;				(* Offset includes the DST		*)
	END_STRUCT;

END_TYPE
