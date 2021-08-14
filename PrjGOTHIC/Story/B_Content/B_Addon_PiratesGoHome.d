
func void B_Addon_PiratesGoHome()
{
	Skip.aivar[AIV_PARTYMEMBER] = FALSE;
	Matt.aivar[AIV_PARTYMEMBER] = FALSE;
	Brandon.aivar[AIV_PARTYMEMBER] = FALSE;
	RoastPirate.aivar[AIV_PARTYMEMBER] = FALSE;
	BenchPirate.aivar[AIV_PARTYMEMBER] = FALSE;
	AlligatorJack.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StartOtherRoutine(Skip,"START");
	B_StartOtherRoutine(Matt,"START");
	B_StartOtherRoutine(Brandon,"START");
	B_StartOtherRoutine(RoastPirate,"START");
	B_StartOtherRoutine(BenchPirate,"START");
	B_StartOtherRoutine(AlligatorJack,"START");
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
	//пляж с огненными ящерами - нет связи с точками в лагере
	/*if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_LONEBEACH_11") < 2000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_LONEBEACH_12") < 2500)
	{
		return TRUE;
	};*/
	//северный пляж, точка у пещеры с мракорисом
	/*if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_BEACH_28") < 3500)
	{
		return TRUE;
	};*/
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
	if((Npc_GetDistToNpc(hero,Skip) <= 2000) && !Npc_IsDead(Skip) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skip)))
	{
		Skip.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(Skip);
		B_StartOtherRoutine(Skip,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,Matt) <= 2000) && !Npc_IsDead(Matt) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Matt)))
	{
		Matt.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(Matt);
		B_StartOtherRoutine(Matt,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,Brandon) <= 2000) && !Npc_IsDead(Brandon) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Brandon)))
	{
		Brandon.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(Brandon);
		B_StartOtherRoutine(Brandon,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,RoastPirate) <= 2000) && !Npc_IsDead(RoastPirate) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(RoastPirate)))
	{
		RoastPirate.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(RoastPirate);
		B_StartOtherRoutine(RoastPirate,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,BenchPirate) <= 2000) && !Npc_IsDead(BenchPirate) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(BenchPirate)))
	{
		BenchPirate.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(BenchPirate);
		B_StartOtherRoutine(BenchPirate,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,AlligatorJack) <= 2000) && !Npc_IsDead(AlligatorJack) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(AlligatorJack)))
	{
		AlligatorJack.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(AlligatorJack);
		B_StartOtherRoutine(AlligatorJack,"FOLLOW");
	};
};

