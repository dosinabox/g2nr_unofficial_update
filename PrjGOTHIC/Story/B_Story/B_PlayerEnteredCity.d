
func void B_PlayerEnteredCity()
{
	if(PlayerEnteredCity == FALSE)
	{
		if(!Npc_IsDead(Canthar))
		{
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
