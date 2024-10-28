FUNCTION_BLOCK EasyUaSubscription

	IF Enable = TRUE AND Internal.EnableOld = FALSE THEN
		IF Internal.Executing = FALSE THEN
			EasyUaSubscription_CheckParameters;
		END_IF;
		IF Internal.ParametersValid = TRUE THEN
			Internal.Executing := TRUE;
		END_IF;
	END_IF;
	
	IF Internal.Executing = TRUE THEN
		EasyUaSubscription_CyclicCode;
	END_IF;
	
	Internal.EnableOld := Enable;
		
	IF Internal.Executing = FALSE AND Enable = FALSE THEN
		EasyUaSubscription_ResetInternal;
		EasyUaSubscription_ResetOutputs;
	END_IF;
	
	Active := Internal.Executing;
	
END_FUNCTION_BLOCK