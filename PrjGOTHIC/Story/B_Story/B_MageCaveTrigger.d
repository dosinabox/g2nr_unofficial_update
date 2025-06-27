
func void B_MageCaveTrigger()
{
	if(MIS_Schnitzeljagd == LOG_RUNNING)
	{
		if(Agon_Wait == FALSE)
		{
			if(C_NpcIsValidAndAlive(Agon) && C_NpcIsValidAndAlive(Magic_Golem))
			{
				AI_Teleport(Agon,"NW_TROLLAREA_PATH_02");
				Npc_ExchangeRoutine(Agon,"GOLEMLIVES");
				AI_ContinueRoutine(Agon);
				Agon_Wait = TRUE;
			};
		};
		if(Igaraz_Wait == FALSE)
		{
			if(C_NpcIsValidAndAlive(Igaraz))
			{
				AI_Teleport(Igaraz,"NW_TROLLAREA_PATH_66");
				Npc_ExchangeRoutine(Igaraz,"CONTESTWAIT");
				AI_ContinueRoutine(Igaraz);
				Igaraz_Wait = TRUE;
			};
		};
	};
};

