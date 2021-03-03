
func void b_magecavetrigger()
{
	if(MIS_Schnitzeljagd == LOG_Running)
	{
		if(!Npc_IsDead(Magic_Golem))
		{
			if(Hlp_IsValidNpc(Agon) && !Npc_IsDead(Agon))
			{
				AI_Teleport(Agon,"NW_TROLLAREA_PATH_02");
				Npc_ExchangeRoutine(Agon,"GOLEMLIVES");
				AI_ContinueRoutine(Agon);
			};
		};
		if(Hlp_IsValidNpc(Igaraz) && !Npc_IsDead(Igaraz))
		{
			if(Igaraz_Wait == FALSE)
			{
				AI_Teleport(Igaraz,"NW_TROLLAREA_PATH_66");
				Npc_ExchangeRoutine(Igaraz,"CONTESTWAIT");
				AI_ContinueRoutine(Igaraz);
				Igaraz_Wait = TRUE;
			};
		};
	};
};

