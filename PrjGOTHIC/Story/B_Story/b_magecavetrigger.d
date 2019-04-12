
func void b_magecavetrigger()
{
	if((Npc_IsDead(MagicGolem) == FALSE) && (mis_schnitzeljagd == LOG_Running))
	{
		if(Hlp_IsValidNpc(Agon) && !Npc_IsDead(Agon))
		{
			AI_Teleport(Agon,"NW_TROLLAREA_PATH_02");
			Npc_ExchangeRoutine(Agon,"GOLEMLIVES");
			AI_ContinueRoutine(Agon);
		};
	};
};

