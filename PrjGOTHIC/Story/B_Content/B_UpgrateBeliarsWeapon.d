
func int C_SCHasBeliarsRune()
{
	if(Npc_HasItems(hero,ItRu_BeliarsRage))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRu_SuckEnergy))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRu_GreenTentacle))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRu_Swarm))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRu_Skull))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRu_SummonZombie))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItRu_SummonGuardian))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHas1HBeliarsWeapon()
{
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHas2HBeliarsWeapon()
{
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19))
	{
		return TRUE;
	};
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasMeleeBeliarsWeapon()
{
	if(C_ScHas1HBeliarsWeapon())
	{
		return TRUE;
	};
	if(C_ScHas2HBeliarsWeapon())
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItem1HBeliarsWeapon(var C_Item weapon)
{
	if(weapon.id == ITEM_BELIAR_1H)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItem2HBeliarsWeapon(var C_Item weapon)
{
	if(weapon.id == ITEM_BELIAR_2H)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_IsItemMeleeBeliarsWeapon(var C_Item weapon)
{
	if(C_IsItem1HBeliarsWeapon(weapon))
	{
		return TRUE;
	};
	if(C_IsItem2HBeliarsWeapon(weapon))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_ScHasReadiedBeliarsWeapon()
{
	var C_Item ReadyWeap;
	if(Npc_HasReadiedMeleeWeapon(hero))
	{
		ReadyWeap = Npc_GetReadiedWeapon(hero);
		if(C_IsItemMeleeBeliarsWeapon(ReadyWeap))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_ScHasEquippedBeliarsWeapon()
{
	var C_Item EquipWeap;
	if(Npc_HasEquippedMeleeWeapon(hero))
	{
		EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
		if(C_IsItemMeleeBeliarsWeapon(EquipWeap))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void B_ClearBeliarsRune()
{
	B_RemoveEveryInvItem(hero,ItRu_BeliarsRage);
	B_RemoveEveryInvItem(hero,ItRu_SuckEnergy);
	B_RemoveEveryInvItem(hero,ItRu_GreenTentacle);
	B_RemoveEveryInvItem(hero,ItRu_Swarm);
	B_RemoveEveryInvItem(hero,ItRu_Skull);
	B_RemoveEveryInvItem(hero,ItRu_SummonZombie);
	B_RemoveEveryInvItem(hero,ItRu_SummonGuardian);
};

func void B_ClearBeliarsWeapon()
{
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_Raven);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_01);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_02);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_03);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_04);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_05);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_06);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_07);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_08);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_09);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_10);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_11);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_12);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_13);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_14);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_15);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_16);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_17);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_18);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_19);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_1H_20);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_01);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_02);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_03);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_04);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_05);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_06);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_07);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_08);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_09);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_10);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_11);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_12);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_13);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_14);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_15);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_16);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_17);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_18);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_19);
	B_RemoveEveryInvItem(hero,ItMw_BeliarWeapon_2H_20);
};

func void B_ClearBeliarsItems()
{
	B_ClearBeliarsRune();
	B_ClearBeliarsWeapon();
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
	return FALSE;
};

func void B_UpgrateBeliarsWeapon()
{
	var int BeliarsTribute;
	var string concatText;
	BeliarsTribute = (BeliarWeapNextLvL - BeliarWeapCurrentLvL) * 5;
	if(BeliarsTribute > 0)
	{
		concatText = ConcatStrings(PRINT_Beliarshitpoints_MAX,IntToString(BeliarsTribute));
		PrintScreen(concatText,-1,-1,FONT_Screen,4);
		Stats_Beliar_ClawMaxHp += BeliarsTribute;
		ATR_Training[ATR_HITPOINTS_MAX] -= BeliarsTribute;
		Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-BeliarsTribute);
		if(hero.attribute[ATR_HITPOINTS] > (BeliarsTribute + 2))
		{
			hero.attribute[ATR_HITPOINTS] -= BeliarsTribute;
		}
		else
		{
			hero.attribute[ATR_HITPOINTS] = 2;
		};
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
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_SummonGuardian,PC_PrayShrine_UPGRATEBELIARSWEAPON_SummonGuardian);
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_BeliarsRage,PC_PrayShrine_UPGRATEBELIARSWEAPON_BeliarsRage);
		};
		if(BeliarWeapCurrentLvL >= 4)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_Swarm,PC_PrayShrine_UPGRATEBELIARSWEAPON_Swarm);
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_SummonZombie,PC_PrayShrine_UPGRATEBELIARSWEAPON_SummonZombie);
		};
		if(BeliarWeapCurrentLvL >= 5)
		{
			Info_AddChoice(PC_PrayShrine_UPGRATEBELIARSWEAPON,NAME_SPL_Skull,PC_PrayShrine_UPGRATEBELIARSWEAPON_Skull);
		};
	}
	else
	{
		if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
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
		};
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
	};
};

func void B_CreateBeliarsRune(var int rune)
{
	CreateInvItem(self,rune);
	PrintScreen(PRINT_Addon_RuneGiven,-1,45,FONT_Screen,2);
	Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
	Snd_Play("CS_Prayer_WaveOfInsanity");
	BeliarsWeaponUpgrated = TRUE;
	Info_ClearChoices(PC_PrayShrine_UPGRATEBELIARSWEAPON);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_GreenTentacle()
{
	B_CreateBeliarsRune(ItRu_GreenTentacle);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_SuckEnergy()
{
	B_CreateBeliarsRune(ItRu_SuckEnergy);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_SummonGuardian()
{
	B_CreateBeliarsRune(ItRu_SummonGuardian);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_BeliarsRage()
{
	B_CreateBeliarsRune(ItRu_BeliarsRage);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_Swarm()
{
	B_CreateBeliarsRune(ItRu_Swarm);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_SummonZombie()
{
	B_CreateBeliarsRune(ItRu_SummonZombie);
};

func void PC_PrayShrine_UPGRATEBELIARSWEAPON_Skull()
{
	B_CreateBeliarsRune(ItRu_Skull);
};
