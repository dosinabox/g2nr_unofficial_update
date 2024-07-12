
func int C_IniOptionEnabled(var string option)
{
	//system\autorun\OptionChecker.d
	return FALSE;
};

func int B_CheckOption(var string iniOption,var int varOption)
{
	if(UnionActivated == TRUE)
	{
		return C_IniOptionEnabled(iniOption);
	};
	return varOption;
};

func int C_PremiumTeachersEnabled()
{
	return B_CheckOption("PremiumTeachersEnabled",PremiumTeachersEnabled);
};

