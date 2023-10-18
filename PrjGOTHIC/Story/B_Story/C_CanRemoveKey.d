
func int C_CanRemoveKey()
{
	if(Hlp_IsItem(item,ItKe_EVT_UNDEAD_02))
	{
		return FALSE;
	};
	Print(ConcatStrings(PRINT_Used,item.description));
	return TRUE;
};

