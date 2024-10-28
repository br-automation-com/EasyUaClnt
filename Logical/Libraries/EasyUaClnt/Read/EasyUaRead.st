FUNCTION_BLOCK EasyUaRead

	IF Execute = TRUE AND Internal.ExecuteOld = FALSE THEN
		IF Internal.Executing = FALSE THEN
			EasyUaRead_CheckParameters;
		END_IF;
		IF Internal.ParametersValid = TRUE THEN
			Internal.Executing := TRUE;
		END_IF;
	END_IF;
	
	IF Internal.Executing = TRUE THEN
		EasyUaRead_CyclicCode;
	END_IF;
	
	Internal.ExecuteOld := Execute;
		
	IF Internal.Executing = FALSE AND Execute = FALSE THEN
		EasyUaRead_ResetInternal;
		EasyUaRead_ResetOutputs;
	END_IF;
	
	Active := Internal.Executing;
	
END_FUNCTION_BLOCK