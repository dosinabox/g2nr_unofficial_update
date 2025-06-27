
var int FoundVinosKellerei;

func void EVT_VinosKellerei_Func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		FoundVinosKellerei = TRUE;
		B_GivePlayerXP(XP_FoundVinosKellerei);
	};
};

