
func int C_SCHasBeliarsRune()
{
	if((Npc_HasItems(hero,ItRu_BeliarsRage) == TRUE) || (Npc_HasItems(hero,ItRu_SuckEnergy) == TRUE) || (Npc_HasItems(hero,ItRu_GreenTentacle) == TRUE) || (Npc_HasItems(hero,ItRu_Swarm) == TRUE) || (Npc_HasItems(hero,ItRu_Skull) == TRUE) || (Npc_HasItems(hero,ItRu_SummonZombie) == TRUE) || (Npc_HasItems(hero,ItRu_SummonGuardian) == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasBeliarsWeapon()
{
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20) || C_SCHasBeliarsRune())
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemBeliarsWeapon(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMw_BeliarWeapon_Raven) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_01) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_02) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_03) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_04) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_05) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_06) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_07) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_08) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_09) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_10) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_11) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_12) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_13) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_14) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_15) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_16) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_17) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_18) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_19) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_20) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_01) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_02) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_03) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_04) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_05) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_06) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_07) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_08) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_09) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_10) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_11) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_12) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_13) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_14) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_15) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_16) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_17) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_18) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_19) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_20) == TRUE) || (Hlp_IsItem(Weap,ItRu_BeliarsRage) == TRUE) || (Hlp_IsItem(Weap,ItRu_SuckEnergy) == TRUE) || (Hlp_IsItem(Weap,ItRu_GreenTentacle) == TRUE) || (Hlp_IsItem(Weap,ItRu_Swarm) == TRUE) || (Hlp_IsItem(Weap,ItRu_Skull) == TRUE) || (Hlp_IsItem(Weap,ItRu_SummonZombie) == TRUE) || (Hlp_IsItem(Weap,ItRu_SummonGuardian) == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedBeliarsWeapon()
{
	var C_Item ReadyWeap;
	ReadyWeap = Npc_GetReadiedWeapon(hero);
	if(C_IsItemBeliarsWeapon(ReadyWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasEquippedBeliarsWeapon()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	if(C_IsItemBeliarsWeapon(EquipWeap))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_ClearBeliarsWeapon()
{
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_Raven,Npc_HasItems(hero,ItMw_BeliarWeapon_Raven));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_01,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_02,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_03,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_04,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_05,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_06,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_07,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_08,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_09,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_10,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_11,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_12,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_13,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_14,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_15,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_16,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_17,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_18,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_19,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_20,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_01,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_02,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_03,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_04,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_05,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_06,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_07,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_08,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_09,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_10,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_11,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_12,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_13,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_14,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_15,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_16,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_17,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_18,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_19,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_20,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20));
	Npc_RemoveInvItems(hero,ItRu_BeliarsRage,Npc_HasItems(hero,ItRu_BeliarsRage));
	Npc_RemoveInvItems(hero,ItRu_SuckEnergy,Npc_HasItems(hero,ItRu_SuckEnergy));
	Npc_RemoveInvItems(hero,ItRu_GreenTentacle,Npc_HasItems(hero,ItRu_GreenTentacle));
	Npc_RemoveInvItems(hero,ItRu_Swarm,Npc_HasItems(hero,ItRu_Swarm));
	Npc_RemoveInvItems(hero,ItRu_Skull,Npc_HasItems(hero,ItRu_Skull));
	Npc_RemoveInvItems(hero,ItRu_SummonZombie,Npc_HasItems(hero,ItRu_SummonZombie));
	Npc_RemoveInvItems(hero,ItRu_SummonGuardian,Npc_HasItems(hero,ItRu_SummonGuardian));
};


var int BeliarWeapCurrentLvL;
var int BeliarWeapNextLvL;
var int BeliarNextDamageChance;

func int C_ScCanUpgrateBeliarsWeapon()
{
	var int herolvl;
	herolvl = hero.level;
	if(hero.guild == GIL_KDF)
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5)
		{
			BeliarWeapNextLvL = 5;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
		{
			BeliarWeapNextLvL = 4;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
		{
			BeliarWeapNextLvL = 3;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
		{
			BeliarWeapNextLvL = 2;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 1)
		{
			BeliarWeapNextLvL = 1;
		};
		return TRUE;
	}
	else if(herolvl > 46)
	{
		BeliarWeapNextLvL = 20;
		BeliarNextDamageChance = BeliarDamageChance_20;
	}
	else if(herolvl > 44)
	{
		BeliarWeapNextLvL = 19;
		BeliarNextDamageChance = BeliarDamageChance_19;
	}
	else if(herolvl > 42)
	{
		BeliarWeapNextLvL = 18;
		BeliarNextDamageChance = BeliarDamageChance_18;
	}
	else if(herolvl > 40)
	{
		BeliarWeapNextLvL = 17;
		BeliarNextDamageChance = BeliarDamageChance_17;
	}
	else if(herolvl > 38)
	{
		BeliarWeapNextLvL = 16;
		BeliarNextDamageChance = BeliarDamageChance_16;
	}
	else if(herolvl > 36)
	{
		BeliarWeapNextLvL = 15;
		BeliarNextDamageChance = BeliarDamageChance_15;
	}
	else if(herolvl > 34)
	{
		BeliarWeapNextLvL = 14;
		BeliarNextDamageChance = BeliarDamageChance_14;
	}
	else if(herolvl > 32)
	{
		BeliarWeapNextLvL = 13;
		BeliarNextDamageChance = BeliarDamageChance_13;
	}
	else if(herolvl > 30)
	{
		BeliarWeapNextLvL = 12;
		BeliarNextDamageChance = BeliarDamageChance_12;
	}
	else if(herolvl > 28)
	{
		BeliarWeapNextLvL = 11;
		BeliarNextDamageChance = BeliarDamageChance_11;
	}
	else if(herolvl > 26)
	{
		BeliarWeapNextLvL = 10;
		BeliarNextDamageChance = BeliarDamageChance_10;
	}
	else if(herolvl > 24)
	{
		BeliarWeapNextLvL = 9;
		BeliarNextDamageChance = BeliarDamageChance_09;
	}
	else if(herolvl > 22)
	{
		BeliarWeapNextLvL = 8;
		BeliarNextDamageChance = BeliarDamageChance_08;
	}
	else if(herolvl > 20)
	{
		BeliarWeapNextLvL = 7;
		BeliarNextDamageChance = BeliarDamageChance_07;
	}
	else if(herolvl > 18)
	{
		BeliarWeapNextLvL = 6;
		BeliarNextDamageChance = BeliarDamageChance_06;
	}
	else if(herolvl > 16)
	{
		BeliarWeapNextLvL = 5;
		BeliarNextDamageChance = BeliarDamageChance_05;
	}
	else if(herolvl > 14)
	{
		BeliarWeapNextLvL = 4;
		BeliarNextDamageChance = BeliarDamageChance_04;
	}
	else if(herolvl > 12)
	{
		BeliarWeapNextLvL = 3;
		BeliarNextDamageChance = BeliarDamageChance_03;
	}
	else if(herolvl > 10)
	{
		BeliarWeapNextLvL = 2;
		BeliarNextDamageChance = BeliarDamageChance_02;
	}
	else if(herolvl <= 10)
	{
		BeliarWeapNextLvL = 1;
		BeliarNextDamageChance = BeliarDamageChance_01;
	};
	if(BeliarWeapCurrentLvL < BeliarWeapNextLvL)
	{
		return TRUE;
	};
};

func void B_UpgrateBeliarsWeapon()
{
	var int BeliarsTribute;
	var string concatText;
	BeliarsTribute = (BeliarWeapNextLvL - BeliarWeapCurrentLvL) * 5;
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - BeliarsTribute;
	if(BeliarsTribute > 0)
	{
		concatText = ConcatStrings(PRINT_Beliarshitpoints_MAX,IntToString(BeliarsTribute));
		PrintScreen(concatText,-1,-1,FONT_Screen,4);
	};
	BeliarDamageChance = BeliarNextDamageChance;
	BeliarWeapCurrentLvL = BeliarWeapNextLvL;
	if(hero.guild == GIL_KDF)
	{
		Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
		if(BeliarWeapCurrentLvL >= 1)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_GreenTentacle,PC_PrayShrine_UPGRATEBELIARSWEAPON_GreenTentacle);
		};
		if(BeliarWeapCurrentLvL >= 2)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_SuckEnergy,PC_PrayShrine_UPGRATEBELIARSWEAPON_SuckEnergy);
		};
		if(BeliarWeapCurrentLvL >= 3)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_SummonGuardian,PC_PrayShrine_UPGRATEBELIARSWEAPON_NAME_SPL_SummonGuardian);
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_BeliarsRage,PC_PrayShrine_UPGRATEBELIARSWEAPON_BeliarsRage);
		};
		if(BeliarWeapCurrentLvL >= 4)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_Swarm,PC_PrayShrine_UPGRATEBELIARSWEAPON_Swarm);
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_SummonZombie,PC_PrayShrine_UPGRATEBELIARSWEAPON_summonZombie);
		};
		if(BeliarWeapCurrentLvL >= 5)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_Skull,PC_PrayShrine_UPGRATEBELIARSWEAPON_SPL_Skull);
		};
	}
	else if(hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
	{
		if(BeliarWeapCurrentLvL <= 1)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_01);
		}
		else if(BeliarWeapCurrentLvL == 2)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_02);
		}
		else if(BeliarWeapCurrentLvL == 3)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_03);
		}
		else if(BeliarWeapCurrentLvL == 4)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_04);
		}
		else if(BeliarWeapCurrentLvL == 5)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_05);
		}
		else if(BeliarWeapCurrentLvL == 6)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_06);
		}
		else if(BeliarWeapCurrentLvL == 7)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_07);
		}
		else if(BeliarWeapCurrentLvL == 8)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_08);
		}
		else if(BeliarWeapCurrentLvL == 9)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_09);
		}
		else if(BeliarWeapCurrentLvL == 10)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_10);
		}
		else if(BeliarWeapCurrentLvL == 11)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_11);
		}
		else if(BeliarWeapCurrentLvL == 12)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_12);
		}
		else if(BeliarWeapCurrentLvL == 13)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_13);
		}
		else if(BeliarWeapCurrentLvL == 14)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_14);
		}
		else if(BeliarWeapCurrentLvL == 15)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_15);
		}
		else if(BeliarWeapCurrentLvL == 16)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_16);
		}
		else if(BeliarWeapCurrentLvL == 17)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_17);
		}
		else if(BeliarWeapCurrentLvL == 18)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_18);
		}
		else if(BeliarWeapCurrentLvL == 19)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_19);
		}
		else if(BeliarWeapCurrentLvL == 20)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_1H_20);
		};
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
	}
	else
	{
		if(BeliarWeapCurrentLvL <= 1)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_01);
		}
		else if(BeliarWeapCurrentLvL == 2)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_02);
		}
		else if(BeliarWeapCurrentLvL == 3)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_03);
		}
		else if(BeliarWeapCurrentLvL == 4)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_04);
		}
		else if(BeliarWeapCurrentLvL == 5)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_05);
		}
		else if(BeliarWeapCurrentLvL == 6)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_06);
		}
		else if(BeliarWeapCurrentLvL == 7)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_07);
		}
		else if(BeliarWeapCurrentLvL == 8)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_08);
		}
		else if(BeliarWeapCurrentLvL == 9)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_09);
		}
		else if(BeliarWeapCurrentLvL == 10)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_10);
		}
		else if(BeliarWeapCurrentLvL == 11)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_11);
		}
		else if(BeliarWeapCurrentLvL == 12)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_12);
		}
		else if(BeliarWeapCurrentLvL == 13)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_13);
		}
		else if(BeliarWeapCurrentLvL == 14)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_14);
		}
		else if(BeliarWeapCurrentLvL == 15)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_15);
		}
		else if(BeliarWeapCurrentLvL == 16)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_16);
		}
		else if(BeliarWeapCurrentLvL == 17)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_17);
		}
		else if(BeliarWeapCurrentLvL == 18)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_18);
		}
		else if(BeliarWeapCurrentLvL == 19)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_19);
		}
		else if(BeliarWeapCurrentLvL == 20)
		{
			CreateInvItem(hero,ItMw_BeliarWeapon_2H_20);
		};
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
	};
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_GreenTentacle()
{
	CreateInvItem(hero,ItRu_GreenTentacle);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_SuckEnergy()
{
	CreateInvItem(hero,ItRu_SuckEnergy);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_NAME_SPL_SummonGuardian()
{
	CreateInvItem(hero,ItRu_SummonGuardian);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_BeliarsRage()
{
	CreateInvItem(hero,ItRu_BeliarsRage);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_Swarm()
{
	CreateInvItem(hero,ItRu_Swarm);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_summonZombie()
{
	CreateInvItem(hero,ItRu_SummonZombie);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_SPL_Skull()
{
	CreateInvItem(hero,ItRu_Skull);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_ScreenSmall,2);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

