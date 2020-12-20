
func void b_magecavetrigger()
{
	if(!Npc_IsDead(Magic_Golem) && (MIS_Schnitzeljagd == LOG_Running))
	{
		if(Hlp_IsValidNpc(Agon) && !Npc_IsDead(Agon))
		{
			AI_Teleport(Agon,"NW_TROLLAREA_PATH_02");
			Npc_ExchangeRoutine(Agon,"GOLEMLIVES");
			AI_ContinueRoutine(Agon);
		};
	};
};

