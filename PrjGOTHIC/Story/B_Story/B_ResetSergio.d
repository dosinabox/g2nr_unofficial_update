
func void B_ResetSergio()
{
	if(!Npc_IsDead(Sergio))
	{
		if((Sergio.aivar[AIV_PARTYMEMBER] == TRUE) && (Sergio_Follow_End == FALSE))
		{
			Sergio.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(Sergio,"START");
			Sergio_Follow_End = TRUE;
		};
	};
};

