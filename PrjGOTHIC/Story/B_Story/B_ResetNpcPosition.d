
func void B_ResetSergio()
{
	if(Sergio_GuideStatus == LOG_RUNNING)
	{
		if(!Npc_IsDead(Sergio))
		{
			if(Sergio.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				if((MIS_Babo_Training == LOG_SUCCESS) && !Npc_IsDead(Babo))
				{
					Npc_ExchangeRoutine(Sergio,"TRAIN");
				}
				else
				{
					Npc_ExchangeRoutine(Sergio,"START");
				};
				Sergio.aivar[AIV_PARTYMEMBER] = FALSE;
				Sergio_GuideStatus = LOG_SUCCESS;
			};
		};
	};
};

func void B_ResetFernando()
{
	if((Fernando_ImKnast == FALSE) && (MIS_Fernando_Erz == FALSE))
	{
		if(!Npc_IsDead(Fernando))
		{
			Npc_ExchangeRoutine(Fernando,"START");
			MIS_Fernando_Erz = LOG_OBSOLETE;
		};
	};
};

func void B_ResetSalandril()
{
	if((SalandrilLocation == LOC_NW_MONASTERY) && (TOPIC_END_MinenAnteile == TRUE))
	{
		if(!Npc_IsDead(Salandril))
		{
			Npc_ExchangeRoutine(Salandril,"START");
			SalandrilLocation = LOC_NW_CITY;
		};
	};
};

func void B_ResetWambo()
{
	if((WamboLocation == Q_HAFEN) && C_DaysSinceEvent(Wambo_Day,5))
	{
		if(!Npc_IsDead(Wambo))
		{
			Npc_ExchangeRoutine(Wambo,"START");
			WamboLocation = Q_OBERSTADT;
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
	if(!Npc_IsDead(Lares))
	{
		B_StartOtherRoutine(Lares,"START");
		Lares.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	B_StartOtherRoutine(BridgeBandit,"INTERCEPT");
};

func void B_ResetWolfSLDs()
{
	if(MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
		if(Npc_IsDead(SLD_Wolf))
		{
			B_StartOtherRoutine(SLD_815,"START");
			B_StartOtherRoutine(SLD_817,"START");
			MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		};
	};
};

func void B_ResetHenryPirates()
{
	if(!Npc_IsDead(SawPirate))
	{
		if(SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			Npc_ExchangeRoutine(SawPirate,"START");
			SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		};
	};
	if(!Npc_IsDead(HammerPirate))
	{
		if(HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			Npc_ExchangeRoutine(HammerPirate,"START");
			HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		};
	};
};

func void B_ResetSwampParty()
{
	if(DJG_SwampParty == TRUE)
	{
		if(!Npc_IsDead(DJG_Cipher))
		{
			Npc_ExchangeRoutine(DJG_Cipher,"START");
			DJG_Cipher.aivar[AIV_PARTYMEMBER] = FALSE;
		};
		if(!Npc_IsDead(DJG_Rod))
		{
			Npc_ExchangeRoutine(DJG_Rod,"START");
			DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
		};
		DJG_SwampParty = FALSE;
	};
};

