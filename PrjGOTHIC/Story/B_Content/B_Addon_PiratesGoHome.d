
func void B_PirateGoHome(var C_Npc pirate)
{
	if(!Npc_IsDead(pirate))
	{
		pirate.aivar[AIV_PARTYMEMBER] = FALSE;
		B_StartOtherRoutine(pirate,"START");
	};
};

func void B_Addon_PiratesGoHome()
{
	B_PirateGoHome(Skip);
	B_PirateGoHome(Matt);
	B_PirateGoHome(Brandon);
	B_PirateGoHome(RoastPirate);
	B_PirateGoHome(BenchPirate);
	B_PirateGoHome(AlligatorJack);
};

func int C_GregsPiratesTooFar()
{
	if(Npc_GetDistToWP(hero,"ADW_CANYON_MINE1_09") < 3000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(hero,"ADW_CANYON_MINE2_04") < 2000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(hero,"ADW_CANYON_LIBRARY_04") < 2000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(hero,"ADW_CANYON_PATH_TO_BANDITS_25") < 6000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_WAY_16") < 8000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_BEACH_28") < 3500)
	{
		return TRUE;
	};
	if(C_WorldIsFixed(ADDONWORLD_ZEN))
	{
		if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_LONEBEACH_11") < 2000)
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_LONEBEACH_12") < 2500)
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_HowManyPiratesInParty()
{
	var int count;
	count = 0;
	if(!Npc_IsDead(Skip))
	{
		if(Skip.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			count += 1;
		};
	};
	if(!Npc_IsDead(Matt))
	{
		if(Matt.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			count += 1;
		};
	};
	if(!Npc_IsDead(Brandon))
	{
		if(Brandon.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			count += 1;
		};
	};
	if(!Npc_IsDead(RoastPirate))
	{
		if(RoastPirate.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			count += 1;
		};
	};
	if(!Npc_IsDead(BenchPirate))
	{
		if(BenchPirate.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			count += 1;
		};
	};
	if(!Npc_IsDead(AlligatorJack))
	{
		if(AlligatorJack.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			count += 1;
		};
	};
	return count;
};

func void B_PirateFollowAgain(var C_Npc pirate)
{
	if(!Npc_IsDead(pirate) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(pirate)))
	{
		if(Npc_GetDistToNpc(hero,pirate) <= 2000)
		{
			pirate.aivar[AIV_PARTYMEMBER] = TRUE;
			Npc_ClearAIQueue(pirate);
			B_StartOtherRoutine(pirate,"FOLLOW");
		};
	};
};

func void B_Addon_PiratesFollowAgain()
{
	if(Npc_GetDistToWP(hero,"STRAND") < 4000)
	{
		return;
	};
	if(C_HowManyPiratesInParty() != 0)
	{
		return;
	};
	B_PirateFollowAgain(Skip);
	B_PirateFollowAgain(Matt);
	B_PirateFollowAgain(Brandon);
	B_PirateFollowAgain(RoastPirate);
	B_PirateFollowAgain(BenchPirate);
	B_PirateFollowAgain(AlligatorJack);
};

