
func void B_PlayerEnteredCity()
{
	if(PlayerEnteredCity == FALSE)
	{
		if(!Npc_IsDead(Canthar))
		{
			if(C_WorldIsFixed(NEWWORLD_ZEN))
			{
				Wld_SendTrigger("CANTHAR_CART_01");
				Wld_SendTrigger("CANTHAR_CART_02");
			};
			Npc_ExchangeRoutine(Canthar,"START");
		};
		if(Lobart.aivar[AIV_IGNORE_Theft] == TRUE)
		{
			Lobart.aivar[AIV_IGNORE_Theft] = FALSE;
		};
		PlayerEnteredCity = TRUE;
	};
	if(LesterMovedToXardas == FALSE)
	{
		if(Npc_KnowsInfo(hero,DIA_Lester_SEND_XARDAS) && (Kapitel < 3))
		{
			B_StartOtherRoutine(Lester,"XARDAS");
			LesterMovedToXardas = TRUE;
		};
	};
};

func void B_PlayerEnteredUpperCity()
{
	B_PlayerEnteredCity();
	PlayerEnteredUpperCity = TRUE;
};

