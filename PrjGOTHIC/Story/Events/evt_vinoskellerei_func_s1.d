
var int FoundVinosKellerei;

func void evt_vinoskellerei_func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		B_GivePlayerXP(XP_FoundVinosKellerei);
		FoundVinosKellerei = TRUE;
	};
};

