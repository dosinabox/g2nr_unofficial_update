
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

func void B_ResetLares()
{
	if(LaresGuide_ZuOnar != 2)
	{
		LaresGuide_ZuOnar = 0;
	};
	if(LaresGuide_ZumPortal != 8)
	{
		LaresGuide_ZumPortal = 0;
	};
	if(LaresGuide_OrnamentForest != 3)
	{
		LaresGuide_OrnamentForest = 0;
	};
	B_StartOtherRoutine(Lares,"Start");
	B_StartOtherRoutine(BridgeBandit,"Intercept");
};

func void B_ResetHenryPirates()
{
	if(!Npc_IsDead(SawPirate))
	{
		if(SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(SawPirate,"START");
		};
	};
	if(!Npc_IsDead(HammerPirate))
	{
		if(HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(HammerPirate,"START");
		};
	};
};

