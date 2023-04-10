
func void B_ResetSergio()
{
	if((Sergio_Follow == TRUE) && (Sergio_Follow_End == FALSE))
	{
		if(!Npc_IsDead(Sergio))
		{
			Sergio.aivar[AIV_PARTYMEMBER] = FALSE;
			if((MIS_Babo_Training == LOG_SUCCESS) && !Npc_IsDead(Babo))
			{
				Npc_ExchangeRoutine(Sergio,"PrayAndTrain");
			}
			else
			{
				Npc_ExchangeRoutine(Sergio,"Pray");
			};
			Sergio_Follow_End = TRUE;
		};
	};
};

func void B_ResetFernando()
{
	if((Fernando_ImKnast == FALSE) && (Kapitel >= 2) && (MIS_Fernando_Erz == FALSE))
	{
		if(!Npc_IsDead(Fernando))
		{
			Npc_ExchangeRoutine(Fernando,"START");
		};
	};
};

func void B_ResetSalandril()
{
	if((SalandrilLocation == LOC_MONASTERY) && (TOPIC_END_MinenAnteile == TRUE))
	{
		if(!Npc_IsDead(Salandril))
		{
			Npc_ExchangeRoutine(Salandril,"START");
			SalandrilLocation = LOC_CITY;
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
	B_StartOtherRoutine(Lares,"START");
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

