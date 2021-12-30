
const int TeachLimit_1H_Cavalorn = 30;
const int TeachLimit_1H_Keroloth = 60;
const int TeachLimit_1H_Alrik = 60;
const int TeachLimit_1H_Buster = 60;
const int TeachLimit_1H_Morgan = 75;
const int TeachLimit_1H_Wulfgar = 75;
const int TeachLimit_1H_Girion = 90;
const int TeachLimit_1H_Cedric = 90;
const int TeachLimit_1H_Cord = 90;
const int TeachLimit_1H_Lares = 100;
const int TeachLimit_1H_Hokurn = 100;
const int TeachLimit_1H_Lee = 100;

const int TeachLimit_2H_Keroloth = 60;
const int TeachLimit_2H_Wulfgar = 75;
const int TeachLimit_2H_Babo = 75;
const int TeachLimit_2H_Henry = 90;
const int TeachLimit_2H_Girion = 90;
const int TeachLimit_2H_Rod = 90;
const int TeachLimit_2H_Cord = 90;
const int TeachLimit_2H_Hokurn = 100;
const int TeachLimit_2H_Hagen = 100;
const int TeachLimit_2H_Lee = 100;
const int TeachLimit_2H_Gorn = 100;

const int TeachLimit_Bow_Niclas = 60;
const int TeachLimit_Bow_Bartok = 60;
const int TeachLimit_Bow_AlligatorJack = 75;
const int TeachLimit_Bow_Wolf = 90;
const int TeachLimit_Bow_Cavalorn = 90;

const int TeachLimit_Crossbow_Udar = 60;
const int TeachLimit_Crossbow_Dragomir = 75;
const int TeachLimit_Crossbow_Henry = 80;
const int TeachLimit_Crossbow_Girion = 90;
const int TeachLimit_Crossbow_Ruga = 90;
const int TeachLimit_Crossbow_Wolf = 100;

const int TeachCondition_Cord = 30;
const int TeachCondition_2H_Lee = 75;
const int TeachCondition_2H_Hagen = 90;

var C_Npc RealHero;

// Talent Sources
const int TS_Training = 0;
const int TS_TempBonus = 1;
const int TS_PermBonus = 2;
const int TS_Max = 3;

// Talents number controlled by the system
const int TAL_Max = 5;

// Values of talents, gained from different sources
var int TAL_Training[TAL_Max];
var int TAL_TempBonus[TAL_Max];
var int TAL_PermBonus[TAL_Max];

// in-game talent limits
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

// teacher over limiting depends on (training / equipment / permanent bonuses)
const int TAL_TeachLimitFlags[TS_Max] =
{
	1,
	1,
	1
};

// learn price depends on (training / equipment / permanent bonuses)
var int TAL_CostFlags_TS_Training;
var int TAL_CostFlags_TS_TempBonus;
var int TAL_CostFlags_TS_PermBonus;

// Teach Limit Reasons
const int TLR_AlreadyMax = 5; // talent >= 100
const int TLR_WillBeOverMax = 4; // talent + percent > 100
const int TLR_AlreadySame = 3; // talent == teacherMax
const int TLR_AlreadyBetter = 2; // talent > teacherMax
const int TLR_WillBeBetter = 1; // talent + percent > teacherMax
const int TLR_None = 0;

// secondary talent last change
var int SecondaryChange;

// gets minimum of two numbers
func int GetMin(var int x,var int y)
{
	if(x < y)
	{
		return x;
	};
	return y;
};

// gets maximum of two numbers
func int GetMax(var int x,var int y)
{
	if(x > y)
	{
		return x;
	};
	return y;
};

// return nearest to value number from segment [min..max]
func int CoerceInRange(var int value,var int min,var int max)
{
	value = GetMax(value,min);
	return GetMin(value,max);
};

func int IsHero(var C_Npc npc)
{
	if(C_NpcIsHero(npc))
	{
		RealHero = Hlp_GetNpc(npc);
		return TRUE;
	};
	return FALSE;
};

func void ValidateNpc(var C_Npc npc)
{
	if(!Hlp_IsValidNpc(npc))
	{
		Print("Talent System Error: invalid npc");
	};
};

func void ValidateTalent(var int talent)
{
	var string text;
	if((talent < NPC_TALENT_1H) || (talent > NPC_TALENT_CROSSBOW))
	{
		text = "Talent System Error: invalid talent (";
		text = ConcatStrings(text,IntToString(talent));
		text = ConcatStrings(text,")");
		Print(text);
	};
};

func int GetTalent(var C_Npc npc,var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return npc.HitChance[NPC_TALENT_1H];
	};
	if(talent == NPC_TALENT_2H)
	{
		return npc.HitChance[NPC_TALENT_2H];
	};
	if(talent == NPC_TALENT_BOW)
	{
		return npc.HitChance[NPC_TALENT_BOW];
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return npc.HitChance[NPC_TALENT_CROSSBOW];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

// removes and applies overlays when talent skill changed
func void UpdateOverlay(var C_Npc npc,var int oldSkill,var int newSkill,var string mds1,var string mds2)
{
	if(oldSkill == newSkill)
	{
		return;
	};
	if(oldSkill == 1)
	{
		Mdl_RemoveOverlayMds(npc,mds1);
	}
	else if(oldSkill == 2)
	{
		Mdl_RemoveOverlayMds(npc,mds2);
	};
	if(newSkill == 1)
	{
		Mdl_ApplyOverlayMds(npc,mds1);
	}
	else if(newSkill == 2)
	{
		Mdl_ApplyOverlayMds(npc,mds2);
	};
};

// calculates talent value, which should be used by the game
func int GetTalentPart_Game_Hero(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_1H] + TAL_TempBonus[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H],
			TAL_MinValue[NPC_TALENT_1H],
			TAL_MaxValue[NPC_TALENT_1H]
		);
	};
	if(talent == NPC_TALENT_2H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_2H] + TAL_TempBonus[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H],
			TAL_MinValue[NPC_TALENT_2H],
			TAL_MaxValue[NPC_TALENT_2H]
		);
	};
	if(talent == NPC_TALENT_BOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_BOW] + TAL_TempBonus[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW],
			TAL_MinValue[NPC_TALENT_BOW],
			TAL_MaxValue[NPC_TALENT_BOW]
		);
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_CROSSBOW] + TAL_TempBonus[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW],
			TAL_MinValue[NPC_TALENT_CROSSBOW],
			TAL_MaxValue[NPC_TALENT_CROSSBOW]
		);
	};
	return 0;
};

// calculates talent value, which determines learning cost value
func int GetTalentPart_Cost_Hero(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return 
			TAL_Training[NPC_TALENT_1H] * TAL_CostFlags_TS_Training + 
			TAL_TempBonus[NPC_TALENT_1H] * TAL_CostFlags_TS_TempBonus +
			TAL_PermBonus[NPC_TALENT_1H] * TAL_CostFlags_TS_PermBonus;
	};
	if(talent == NPC_TALENT_2H)
	{
		return 
			TAL_Training[NPC_TALENT_2H] * TAL_CostFlags_TS_Training + 
			TAL_TempBonus[NPC_TALENT_2H] * TAL_CostFlags_TS_TempBonus +
			TAL_PermBonus[NPC_TALENT_2H] * TAL_CostFlags_TS_PermBonus;		
	};
	if(talent == NPC_TALENT_BOW)
	{
		return 
			TAL_Training[NPC_TALENT_BOW] * TAL_CostFlags_TS_Training + 
			TAL_TempBonus[NPC_TALENT_BOW] * TAL_CostFlags_TS_TempBonus +
			TAL_PermBonus[NPC_TALENT_BOW] * TAL_CostFlags_TS_PermBonus;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return 
			TAL_Training[NPC_TALENT_CROSSBOW] * TAL_CostFlags_TS_Training + 
			TAL_TempBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags_TS_TempBonus +
			TAL_PermBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags_TS_PermBonus;
	};
	return 0;
};

// calculates talent value, comparable with teacher limit
func int GetTalentPart_TeachLimit_Hero(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return 
			TAL_Training[NPC_TALENT_1H] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_1H] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_1H] * TAL_TeachLimitFlags[TS_PermBonus];
	};
	if(talent == NPC_TALENT_2H)
	{
		return 
			TAL_Training[NPC_TALENT_2H] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_2H] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_2H] * TAL_TeachLimitFlags[TS_PermBonus];		
	};
	if(talent == NPC_TALENT_BOW)
	{
		return 
			TAL_Training[NPC_TALENT_BOW] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_BOW] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_BOW] * TAL_TeachLimitFlags[TS_PermBonus];
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return 
			TAL_Training[NPC_TALENT_CROSSBOW] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_CROSSBOW] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_CROSSBOW] * TAL_TeachLimitFlags[TS_PermBonus];
	};
	return 0;
};

// check RealHero talent value to start training
func int TeacherCanTrainTalent(var int talent,var int teacherMin)
{
	var int teachPart;
	teachPart = GetTalentPart_TeachLimit_Hero(talent);
	if(teachPart >= teacherMin)
	{
		return TRUE;
	};
	return FALSE;
};

// get talent value without temp bonuses
func int RealTalentValue(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return TAL_Training[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H];
	};
	if(talent == NPC_TALENT_2H)
	{
		return TAL_Training[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H];
	};
	if(talent == NPC_TALENT_BOW)
	{
		return TAL_Training[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW];
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return TAL_Training[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

// get visible talent value (training + perm bonuses + temp bonuses)
func int VisibleTalentValue(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return hero.HitChance[NPC_TALENT_1H];
	};
	if(talent == NPC_TALENT_2H)
	{
		return hero.HitChance[NPC_TALENT_2H];
	};
	if(talent == NPC_TALENT_BOW)
	{
		return hero.HitChance[NPC_TALENT_BOW];
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return hero.HitChance[NPC_TALENT_CROSSBOW];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

func void UpdateTalent(var C_Npc npc,var int talent,var int value)
{
	var int oldSkill;
	var int newSkill;
	if(talent == NPC_TALENT_1H)
	{
		npc.HitChance[NPC_TALENT_1H] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_1H);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_1H] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_1hST1.MDS","humans_1hST2.MDS");
	}
	else if(talent == NPC_TALENT_2H)
	{
		npc.HitChance[NPC_TALENT_2H] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_2H);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_2H] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_2hST1.MDS","humans_2hST2.MDS");
	}
	else if(talent == NPC_TALENT_BOW)
	{
		npc.HitChance[NPC_TALENT_BOW] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_BOW);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_BOW] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_bowT1.MDS","humans_bowT2.MDS");
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		npc.HitChance[NPC_TALENT_CROSSBOW] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_CROSSBOW);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_CROSSBOW] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_cbowT1.MDS","humans_cbowT2.MDS");
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
};

// updates talent's in-game value
func void UpdateTalent_Hero(var int talent)
{
	UpdateTalent(RealHero,talent,GetTalentPart_Game_Hero(talent));
};

// cuts the value, when talent's teach limit part exceeds allowed range
func int CutChange_Hero(var int talent,var int change,var int source)
{
	var int minChange;
	var int maxChange;
	var int teachPart;
	var int isPositive;
	minChange = -10000;
	maxChange = 10000;
	teachPart = GetTalentPart_TeachLimit_Hero(talent);
	isPositive = FALSE;
	if(change > 0)
	{
		isPositive = TRUE;
	};
	if(
		((source == TS_Training) && (TAL_TeachLimitFlags[TS_Training] == 0)) ||
		((source == TS_TempBonus) && (TAL_TeachLimitFlags[TS_TempBonus] == 0)) ||
		((source == TS_PermBonus) && (TAL_TeachLimitFlags[TS_PermBonus] == 0))
	)
	{
		// source doesn't affect teach limit (don't cut)
		return change;
	};
	if(talent == NPC_TALENT_1H)
	{
		minChange = TAL_MinValue[NPC_TALENT_1H] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_1H] - teachPart;
	}
	else if(talent == NPC_TALENT_2H)
	{
		minChange = TAL_MinValue[NPC_TALENT_2H] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_2H] - teachPart;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		minChange = TAL_MinValue[NPC_TALENT_BOW] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_BOW] - teachPart;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		minChange = TAL_MinValue[NPC_TALENT_CROSSBOW] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_CROSSBOW] - teachPart;
	};
	change = CoerceInRange(change,minChange,maxChange);
	if(isPositive == TRUE)
	{
		return GetMax(0,change);
	};
	return GetMin(0,change);
};

// changes talent by the value with specified Talent Source
// returns talent's real change, also set SecondaryChange variable
func int ChangeTalent(var C_Npc npc,var int talent,var int change,var int source)
{
	SecondaryChange = 0;
	if(talent == NPC_TALENT_1H)
	{
		UpdateTalent(npc,talent,npc.HitChance[NPC_TALENT_1H] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_1H] - npc.HitChance[NPC_TALENT_2H] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			UpdateTalent(npc,NPC_TALENT_2H,npc.HitChance[NPC_TALENT_2H] + SecondaryChange);
		};
	}
	else if(talent == NPC_TALENT_2H)
	{
		UpdateTalent(npc,talent,npc.HitChance[NPC_TALENT_2H] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_2H] - npc.HitChance[NPC_TALENT_1H] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			UpdateTalent(npc,NPC_TALENT_1H,npc.HitChance[NPC_TALENT_1H] + SecondaryChange);
		};
	}
	else if(talent == NPC_TALENT_BOW)
	{
		UpdateTalent(npc,talent,npc.HitChance[NPC_TALENT_BOW] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_BOW] - npc.HitChance[NPC_TALENT_CROSSBOW] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			UpdateTalent(npc,NPC_TALENT_CROSSBOW,npc.HitChance[NPC_TALENT_CROSSBOW] + SecondaryChange);
		};
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		UpdateTalent(npc,talent,npc.HitChance[NPC_TALENT_CROSSBOW] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_CROSSBOW] - npc.HitChance[NPC_TALENT_BOW] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			UpdateTalent(npc,NPC_TALENT_BOW,npc.HitChance[NPC_TALENT_BOW] + SecondaryChange);
		};
	};
	return change;
};

// changes talent by the value with specified Talent Source
// returns talent's real change, also set SecondaryChange variable
func int ChangeTalent_Hero(var int talent,var int change,var int source)
{
	SecondaryChange = 0;
	if(source == TS_Training)
	{
		change = CutChange_Hero(talent,change,source);
	};
	if(talent == NPC_TALENT_1H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_1H] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_1H) - GetTalentPart_Cost_Hero(NPC_TALENT_2H) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			TAL_Training[NPC_TALENT_2H] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_1H] += change;
		}
		else if(source == TS_PermBonus)
		{
			if(TAL_Training[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H] < 100)
			{
				TAL_PermBonus[NPC_TALENT_1H] += change;
			}
			else
			{
				return 0;
			};
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_1H);
		UpdateTalent_Hero(NPC_TALENT_2H);
		return change;
	}
	else if(talent == NPC_TALENT_2H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_2H] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_2H) - GetTalentPart_Cost_Hero(NPC_TALENT_1H) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			TAL_Training[NPC_TALENT_1H] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_2H] += change;
		}
		else if(source == TS_PermBonus)
		{
			if(TAL_Training[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H] < 100)
			{
				TAL_PermBonus[NPC_TALENT_2H] += change;
			}
			else
			{
				return 0;
			};
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_2H);
		UpdateTalent_Hero(NPC_TALENT_1H);
		return change;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_BOW] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_BOW) - GetTalentPart_Cost_Hero(NPC_TALENT_CROSSBOW) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			TAL_Training[NPC_TALENT_CROSSBOW] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_BOW] += change;
		}
		else if(source == TS_PermBonus)
		{
			if(TAL_Training[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW] < 100)
			{
				TAL_PermBonus[NPC_TALENT_BOW] += change;
			}
			else
			{
				return 0;
			};
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_BOW);
		UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
		return change;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_CROSSBOW] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_CROSSBOW) - GetTalentPart_Cost_Hero(NPC_TALENT_BOW) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			TAL_Training[NPC_TALENT_BOW] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_CROSSBOW] += change;
		}
		else if(source == TS_PermBonus)
		{
			if(TAL_Training[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW] < 100)
			{
				TAL_PermBonus[NPC_TALENT_CROSSBOW] += change;
			}
			else
			{
				return 0;
			};
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
		UpdateTalent_Hero(NPC_TALENT_BOW);
		return change;
	};
	return 0;
};

// gets cost of one point of talent, which cost-part equals to value
func int GetTalentPointCost(var int talent,var int value)
{
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return CoerceInRange(value / 30 + 1, 1, 1000);
	};
	return 0;
};

// gets next cost barrier for talent, which cost-part equals to value
func int GetNextTalentBarrier(var int talent,var int value)
{
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return CoerceInRange(value / 30 * 30 + 30, 30, 90);
	};
	return 0;
};

// calculates lp-cost of increasing talent by 'change'
func int GetTalentTrainCost_Impl(var int talent,var int value,var int change)
{	
	var int barrier;
	var int costBefore;
	var int costAfter;
	var int pointsBefore;
	barrier = GetNextTalentBarrier(talent,value);
	costBefore = GetTalentPointCost(talent,value);
	costAfter = GetTalentPointCost(talent,barrier);
	pointsBefore = GetMin(barrier - value,change);
	if(LP_Static > 0)
	{
		return change * LP_Static;
	};
	if(HonestStatCalculation == FALSE)
	{
		return change * costBefore;
	};
	return pointsBefore * costBefore + (change - pointsBefore) * costAfter;
};

// calculates lp-cost of increasing talent by 'change'
func int GetTalentTrainCost_Hero(var int talent,var int change)
{
	return GetTalentTrainCost_Impl(talent,GetTalentPart_Cost_Hero(talent),change);
};

// calculates lp-cost of increasing talent by 'change'
func int GetTalentTrainCost(var C_Npc npc,var int talent,var int change)
{
	return GetTalentTrainCost_Impl(talent,GetTalent(npc,talent),change);
};

// gets maximum in-game value of talent
func int GetTalentMax(var int talent)
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

// returns the reason the teacher can't teach talent
func int GetTeachLimitReason_Hero(var int talent,var int change,var int teacherMax)
{
	var int teachPart;
	var int talentMax;
	change *= TAL_TeachLimitFlags[TS_Training];
	teachPart = GetTalentPart_TeachLimit_Hero(talent);
	talentMax = GetTalentMax(talent);
	if(teachPart >= GetTalentMax(talent))
	{
		return TLR_AlreadyMax;
	};
	if(teachPart + change > GetTalentMax(talent))
	{
		return TLR_WillBeOverMax;
	};
	if(teachPart == teacherMax)
	{
		return TLR_AlreadySame;
	};
	if(teachPart > teacherMax)
	{
		return TLR_AlreadyBetter;
	};
	if(teachPart + change > teacherMax)
	{
		return TLR_WillBeBetter;
	};
	return TLR_None;
};

func int GetTeachLimitReason(var C_Npc npc,var int talent,var int change,var int teacherMax)
{
	var int value;
	value = GetTalent(npc,talent);
	if(value >= GetTalentMax(talent))
	{
		return TLR_AlreadyMax;
	};
	if(value + change > GetTalentMax(talent))
	{
		return TLR_WillBeOverMax;
	};
	if(value == teacherMax)
	{
		return TLR_AlreadySame;
	};
	if(value > teacherMax)
	{
		return TLR_AlreadyBetter;
	};
	if(value + change > teacherMax)
	{
		return TLR_WillBeBetter;
	};
	return TLR_None;
};

//===============================INTERFACE============================================

var int TalentSystemSynced;

// initialize the talent system (must not be called twice)
func void B_InitTalentSystem()
{
	TAL_CostFlags_TS_Training = 1;
	TAL_CostFlags_TS_TempBonus = 0;
	TAL_CostFlags_TS_PermBonus = 1;
	ValidateNpc(hero);
	RealHero = Hlp_GetNpc(hero);
	TAL_Training[NPC_TALENT_1H] = 0;
	TAL_Training[NPC_TALENT_2H] = 0;
	TAL_Training[NPC_TALENT_BOW] = 0;
	TAL_Training[NPC_TALENT_CROSSBOW] = 0;
	TAL_TempBonus[NPC_TALENT_1H] = 0;
	TAL_TempBonus[NPC_TALENT_2H] = 0;
	TAL_TempBonus[NPC_TALENT_BOW] = 0;
	TAL_TempBonus[NPC_TALENT_CROSSBOW] = 0;
	TAL_PermBonus[NPC_TALENT_1H] = 0;
	TAL_PermBonus[NPC_TALENT_2H] = 0;
	TAL_PermBonus[NPC_TALENT_BOW] = 0;
	TAL_PermBonus[NPC_TALENT_CROSSBOW] = 0;
	TAL_Training[NPC_TALENT_1H] = RealHero.HitChance[NPC_TALENT_1H];
	TAL_Training[NPC_TALENT_2H] = RealHero.HitChance[NPC_TALENT_2H];
	TAL_Training[NPC_TALENT_BOW] = RealHero.HitChance[NPC_TALENT_BOW];
	TAL_Training[NPC_TALENT_CROSSBOW] = RealHero.HitChance[NPC_TALENT_CROSSBOW];
	UpdateTalent_Hero(NPC_TALENT_1H);
	UpdateTalent_Hero(NPC_TALENT_2H);
	UpdateTalent_Hero(NPC_TALENT_BOW);
	UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
	TalentSystemSynced = TRUE;
};

// returns the reason the teacher can't teach talent
func int B_GetTeachLimitReason(var C_Npc npc,var int talent,var int change,var int teacherMax)
{
	ValidateNpc(npc);
	ValidateTalent(talent);
	if(IsHero(npc))
	{
		return GetTeachLimitReason_Hero(talent,change,teacherMax);
	};
	return GetTeachLimitReason(npc,talent,change,teacherMax);
};

func int B_GetTalentTrainCost(var C_Npc npc,var int talent,var int change)
{
	ValidateNpc(npc);
	ValidateTalent(talent);
	if(IsHero(npc))
	{
		return GetTalentTrainCost_Hero(talent,change);
	};
	return GetTalentTrainCost(npc,talent,change);
};

func int B_ChangeTalent(var C_Npc npc,var int talent,var int change,var int source)
{
	ValidateNpc(npc);
	ValidateTalent(talent);
	if(IsHero(npc))
	{
		return ChangeTalent_Hero(talent,change,source);
	};
	return ChangeTalent(npc,talent,change,source);
};

// reset hero talents
func void B_ResetTalentSystem()
{
	if(IsHero(hero))
	{
		TAL_Training[NPC_TALENT_1H] = 10;
		TAL_Training[NPC_TALENT_2H] = 10;
		TAL_Training[NPC_TALENT_BOW] = 10;
		TAL_Training[NPC_TALENT_CROSSBOW] = 10;
		TAL_PermBonus[NPC_TALENT_1H] = 0;
		TAL_PermBonus[NPC_TALENT_2H] = 0;
		TAL_PermBonus[NPC_TALENT_BOW] = 0;
		TAL_PermBonus[NPC_TALENT_CROSSBOW] = 0;
		UpdateTalent_Hero(NPC_TALENT_1H);
		UpdateTalent_Hero(NPC_TALENT_2H);
		UpdateTalent_Hero(NPC_TALENT_BOW);
		UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
	}
	else
	{
		Print("ERROR");
	};
};

