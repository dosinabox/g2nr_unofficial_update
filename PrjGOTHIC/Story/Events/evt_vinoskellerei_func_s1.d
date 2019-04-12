
var int FoundVinosKellerei;

func void evt_vinoskellerei_func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		FoundVinosKellerei = TRUE;
		B_GivePlayerXP(XP_FoundVinosKellerei);
	};
};

