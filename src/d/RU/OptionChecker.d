func int C_IniOptionEnabled(var string option)
{
	if(Hlp_ReadOptionInt("Gothic","SCRIPTPATCH",option,0) == 1)
	{
		return TRUE;
	};
	return FALSE;
};
