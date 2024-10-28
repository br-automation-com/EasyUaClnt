FUNCTION_BLOCK EasyUaSubscriptionList

	IF Enable = TRUE AND Internal.EnableOld = FALSE THEN
		IF Internal.Executing = FALSE THEN
			EasyUaSubscriptionList_CheckParameters;
		END_IF;
		IF Internal.ParametersValid = TRUE THEN
			Internal.Executing := TRUE;
		END_IF;
	END_IF;
	
	IF Internal.Executing = TRUE THEN
		EasyUaSubscriptionList_CyclicCode;
	END_IF;
	
	Internal.EnableOld := Enable;
		
	IF Internal.Executing = FALSE AND Enable = FALSE THEN
		EasyUaSubscriptionList_ResetInternal;
		EasyUaSubscriptionList_ResetOutputs;
	END_IF;
	
	Active := Internal.Executing;
	
END_FUNCTION_BLOCK