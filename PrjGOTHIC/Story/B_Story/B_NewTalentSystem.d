
const int TS_Training = 0;
const int TS_TempBonus = 1;
const int TS_PermBonus = 2;
const int TS_Max = 3;

const int TAL_Max = 5;

var int TAL_Training[TAL_Max];
var int TAL_TempBonus[TAL_Max];
var int TAL_PermBonus[TAL_Max];

const int TAL_MinValue[TAL_Max] =
{
	0,
	0,
	0,
	0,
	0
};

const int TAL_MaxValue[TAL_Max] =
{
	0,
	100,
	100,
	100,
	100
};

const int TAL_CostFlags[TS_Max] =
{
	1,
	0,
	1
};

func int GetMin(var int x,var int y)
{
	if(x < y)
	{
		return x;
	};
	return y;
};

func int GetMax(var int x,var int y)
{
	if(x > y)
	{
		return x;
	};
	return y;
};

func int CoerceInRange(var int value,var int min,var int max)
{
	value = GetMax(value,min);
	return GetMin(value,max);
};

func void UpdateHeroOverlay(var int oldSkill,var int newSkill,var string mds1,var string mds2)
{
	if(oldSkill == newSkill)
	{
		return;
	};
	if(oldSkill == 1)
	{
		Mdl_RemoveOverlayMds(hero,mds1);
	}
	else if(oldSkill == 2)
	{
		Mdl_RemoveOverlayMds(hero,mds2);
	};
	if(newSkill == 1)
	{
		Mdl_ApplyOverlayMds(hero,mds1);
	}
	else if(newSkill == 2)
	{
		Mdl_ApplyOverlayMds(hero,mds2);
	};
};

func int GetInGameTalent(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_1H] + TAL_TempBonus[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H],
			TAL_MinValue[NPC_TALENT_1H],
			TAL_MaxValue[NPC_TALENT_1H]
		);
	}
	else if(talent == NPC_TALENT_2H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_2H] + TAL_TempBonus[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H],
			TAL_MinValue[NPC_TALENT_2H],
			TAL_MaxValue[NPC_TALENT_2H]
		);
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_BOW] + TAL_TempBonus[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW],
			TAL_MinValue[NPC_TALENT_BOW],
			TAL_MaxValue[NPC_TALENT_BOW]
		);
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_CROSSBOW] + TAL_TempBonus[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW],
			TAL_MinValue[NPC_TALENT_CROSSBOW],
			TAL_MaxValue[NPC_TALENT_CROSSBOW]
		);
	}
	else
	{
		Print(PRINT_WrongParameter);
		return 0;
	};
	return 0;
};

func int B_GetInTrainingTalent(var int talent)
{
//	var int sum;
//	sum = 0;
	if(talent == NPC_TALENT_1H)
	{
		return 
			TAL_Training[NPC_TALENT_1H] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_1H] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_1H] * TAL_CostFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_2H)
	{
		return 
			TAL_Training[NPC_TALENT_2H] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_2H] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_2H] * TAL_CostFlags[TS_PermBonus];		
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return 
			TAL_Training[NPC_TALENT_BOW] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_BOW] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_BOW] * TAL_CostFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return 
			TAL_Training[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_PermBonus];
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
//	return sum;
	return 0;
};

func void B_ChangeTalent(var int talent,var int value,var int source)
{
	var int oldSkill;
	var int newSkill;
	if(talent == NPC_TALENT_1H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_1H] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_1H] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_1H] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_1H] = GetInGameTalent(NPC_TALENT_1H);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_1H);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_1H] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_1hST1.MDS","humans_1hST2.MDS");
	}
	else if(talent == NPC_TALENT_2H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_2H] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_2H] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_2H] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_2H] = GetInGameTalent(NPC_TALENT_2H);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_2H);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_2H] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_2hST1.MDS","humans_2hST2.MDS");
	}
	else if(talent == NPC_TALENT_BOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_BOW] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_BOW] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_BOW] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_BOW] = GetInGameTalent(NPC_TALENT_BOW);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_BOW);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_BOW] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_bowT1.MDS","humans_bowT2.MDS");
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_CROSSBOW] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_CROSSBOW] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_CROSSBOW] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_CROSSBOW] = GetInGameTalent(NPC_TALENT_CROSSBOW);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_CROSSBOW] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_cbowT1.MDS","humans_cbowT2.MDS");
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
};

func int GetTalentPointCost(var int talent,var int value)
{
	if(talent >= NPC_TALENT_1H && talent <= NPC_TALENT_CROSSBOW)
	{
		return CoerceInRange(value / 30 + 1, 1, 5);
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
//	return ?;
};

func int GetTalentChangeCostImpl(var int talent,var int value,var int change,var int result)
{
	if(change == 0)
	{
		return result;
	};
	return GetTalentChangeCostImpl(talent,value + 1,change - 1,result + GetTalentPointCost(talent,value));
};

func int B_GetTalentChangeCost(var int talent,var int change)
{
	if(change < 0)
	{
		Print(PRINT_WrongParameter);
		return 0;
	};
	return GetTalentChangeCostImpl(talent,B_GetInTrainingTalent(talent),change,0);
};

func int B_IsTalentSupported(var C_NPC npc,var int talent)
{
//	if(C_NpcIsHero(npc) && (talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return TRUE;
	};
	return FALSE;
};

func int B_GetTalentMax(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return TAL_MaxValue[NPC_TALENT_1H];
	};
	if(talent == NPC_TALENT_2H)
	{
		return TAL_MaxValue[NPC_TALENT_2H];
	};
	if(talent == NPC_TALENT_BOW)
	{
		return TAL_MaxValue[NPC_TALENT_BOW];
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return TAL_MaxValue[NPC_TALENT_CROSSBOW];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

// New Game
func void B_InitTalentSystem()
{
	B_ChangeTalent(NPC_TALENT_1H,hero.HitChance[NPC_TALENT_1H],TS_Training);
	B_ChangeTalent(NPC_TALENT_2H,hero.HitChance[NPC_TALENT_2H],TS_Training);
	B_ChangeTalent(NPC_TALENT_BOW,hero.HitChance[NPC_TALENT_BOW],TS_Training);
	B_ChangeTalent(NPC_TALENT_CROSSBOW,hero.HitChance[NPC_TALENT_CROSSBOW],TS_Training);
};

