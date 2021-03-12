
func void b_magecavetrigger()
{
	if(MIS_Schnitzeljagd == LOG_Running)
	{
		if(Agon_Wait == FALSE)
		{
			if(Hlp_IsValidNpc(Agon) && !Npc_IsDead(Agon) && !Npc_IsDead(Magic_Golem))
			{
				AI_Teleport(Agon,"NW_TROLLAREA_PATH_02");
				Npc_ExchangeRoutine(Agon,"GOLEMLIVES");
				AI_ContinueRoutine(Agon);
				Agon_Wait = TRUE;
			};
		};
		if(Igaraz_Wait == FALSE)
		{
			if(Hlp_IsValidNpc(Igaraz) && !Npc_IsDead(Igaraz))
			{
				AI_Teleport(Igaraz,"NW_TROLLAREA_PATH_66");
				Npc_ExchangeRoutine(Igaraz,"CONTESTWAIT");
				AI_ContinueRoutine(Igaraz);
				Igaraz_Wait = TRUE;
			};
		};
	};
};

