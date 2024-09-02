
func void B_PlayerEnteredCity()
{
	if(PlayerEnteredCity == FALSE)
	{
		if(!Npc_IsDead(Lobart))
		{
			Lobart.aivar[AIV_IGNORE_Theft] = FALSE;
		};
		if(!Npc_IsDead(Hilda))
		{
			Hilda.aivar[AIV_IGNORE_Theft] = FALSE;
		};
		PlayerEnteredCity = TRUE;
		B_CheckLog();
	};
	if(LesterMovedToXardas == FALSE)
	{
		if((Lester_SentToXardas == TRUE) && (Kapitel < 3))
		{
			B_StartOtherRoutine(Lester,"XARDAS");
			LesterMovedToXardas = TRUE;
		};
	};
	if(CantharMovedToCity == FALSE)
	{
		if(C_NpcIsInQuarter(hero) != Q_MARKT)
		{
			if(!Npc_IsDead(Canthar))
			{
				if(C_WorldIsFixed())
				{
					Wld_SendTrigger("CANTHAR_CART_01");
					Wld_SendTrigger("CANTHAR_CART_02");
				};
				Npc_ExchangeRoutine(Canthar,"START");
			};
			CantharMovedToCity = TRUE;
		};
	};
};

