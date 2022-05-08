
func int B_GetLearnCostTalent(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	if(talent == NPC_TALENT_MAGE)
	{
		if((skill >= 1) && (skill <= 6))
		{
			kosten = 5;
		};
	};
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		kosten = B_GetTalentTrainCost(oth,talent,skill);
	};
	if((talent == NPC_TALENT_SNEAK) || (talent == NPC_TALENT_ACROBAT))
	{
		kosten = 5;
	};
	if((talent == NPC_TALENT_PICKLOCK) || (talent == NPC_TALENT_PICKPOCKET))
	{
		kosten = 10;
	};
	if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_Common)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_1H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_2H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Special_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_2H_Special_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_Special_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_2H_Special_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Special_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_2H_Special_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_1H_Harad_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Harad_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_Harad_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Harad_04)
		{
			kosten = 10;
		};
	};
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_Health_01)
		{
			if(ClassicAlchemy == FALSE)
			{
				kosten = 1;
			}
			else
			{
				kosten = 2;
			};
		}
		else if(skill == POTION_Health_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Health_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Health_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Mana_01)
		{
			if(ClassicAlchemy == FALSE)
			{
				kosten = 1;
			}
			else
			{
				kosten = 2;
			};
		}
		else if(skill == POTION_Mana_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Mana_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Mana_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Speed)
		{
			kosten = 5;
		}
		else if(skill == POTION_Perm_STR)
		{
			if(ClassicAlchemy == FALSE)
			{
				kosten = 20;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(skill == POTION_Perm_DEX)
		{
			if(ClassicAlchemy == FALSE)
			{
				kosten = 20;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(skill == POTION_Perm_Mana)
		{
			kosten = 10;
		}
		else if(skill == POTION_Perm_Health)
		{
			kosten = 10;
		}
		else if(skill == POTION_MegaDrink)
		{
			kosten = 20;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALFUR)
	{
		if(skill == TROPHY_Fur)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_ReptileSkin)
		{
			kosten = 3;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_Teeth)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Claws)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Heart)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_ShadowHorn)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_FireTongue)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFWing)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFSting)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_Mandibles)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_CrawlerPlate)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DrgSnapperHorn)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_DragonScale)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DragonBlood)
		{
			kosten = 3;
		};
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == LANGUAGE_1)
		{
			kosten = 5;
		}
		else if(skill == LANGUAGE_2)
		{
			kosten = 10;
		}
		else if(skill == LANGUAGE_3)
		{
			kosten = 15;
		};
	};
	if(talent == NPC_TALENT_WISPDETECTOR)
	{
		if(skill == WISPSKILL_NF)
		{
			kosten = 0;
		}
		else if(skill == WISPSKILL_FF)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_NONE)
		{
//			kosten = 2;
			kosten = 1;
		}
		else if(skill == WISPSKILL_RUNE)
		{
//			kosten = 3;
			kosten = 1;
		}
		else if(skill == WISPSKILL_MAGIC)
		{
//			kosten = 4;
			kosten = 1;
		}
		else if(skill == WISPSKILL_FOOD)
		{
//			kosten = 5;
			kosten = 1;
		}
		else if(skill == WISPSKILL_POTIONS)
		{
//			kosten = 5;
			kosten = 1;
		};
	};
	if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PalLight)
		{
			kosten = 1;
		}
		else if(skill == SPL_PalLightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalHolyBolt)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalMediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalRepelEvil)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalFullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalDestroyEvil)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalTeleportSecret)
		{
			kosten = 5;
		}
		else if(skill == SPL_Light)
		{
			kosten = 1;
		}
		else if(skill == SPL_Firebolt)
		{
			kosten = 5;
		}
		else if(skill == SPL_LightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_SummonGoblinSkeleton)
		{
			kosten = 3;
		}
		else if(skill == SPL_Zap)
		{
			kosten = 3;
		}
		else if(skill == SPL_Icebolt)
		{
			kosten = 5;
		}
		else if(skill == SPL_InstantFireball)
		{
//			kosten = 10;
			kosten = 5;
		}
		else if(skill == SPL_SummonWolf)
		{
			kosten = 5;
		}
		else if(skill == SPL_WindFist)
		{
			kosten = 5;
		}
		else if(skill == SPL_Sleep)
		{
			kosten = 5;
		}
		else if(skill == SPL_Charm)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceLance)
		{
			kosten = 5;
		}
		else if(skill == SPL_Whirlwind)
		{
			kosten = 5;
		}
		else if(skill == SPL_MediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_LightningFlash)
		{
			kosten = 5;
		}
		else if(skill == SPL_ChargeFireball)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonSkeleton)
		{
			kosten = 10;
		}
		else if(skill == SPL_Fear)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceCube)
		{
			kosten = 10;
		}
		else if(skill == SPL_Thunderstorm)
		{
			kosten = 5;
		}
		else if(skill == SPL_Geyser)
		{
			kosten = 10;
		}
		else if(skill == SPL_ChargeZap)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonGolem)
		{
			kosten = 15;
		}
		else if(skill == SPL_DestroyUndead)
		{
			kosten = 10;
		}
		else if(skill == SPL_Pyrokinesis)
		{
//			kosten = 10;
			kosten = 15;
		}
		else if(skill == SPL_WaterFist)
		{
			kosten = 10;
		}
		else if(skill == SPL_Firestorm)
		{
//			kosten = 15;
			kosten = 10;
		}
		else if(skill == SPL_IceWave)
		{
			kosten = 20;
		}
		else if(skill == SPL_SummonDemon)
		{
			kosten = 20;
		}
		else if(skill == SPL_FullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_MasterOfDisaster)
		{
			kosten = 15;
		}
		else if(skill == SPL_Firerain)
		{
			kosten = 20;
		}
		else if(skill == SPL_BreathOfDeath)
		{
			kosten = 20;
		}
		else if(skill == SPL_MassDeath)
		{
			kosten = 20;
		}
		else if(skill == SPL_ArmyOfDarkness)
		{
			kosten = 20;
		}
		else if(skill == SPL_Shrink)
		{
//			kosten = 20;
			kosten = 10;
		}
		else
		{
			kosten = 5;
		};
	};
	return kosten;
};

func int C_ShowAlchemySTRDEXDialog()
{
	if(ClassicAlchemy == FALSE)
	{
		return TRUE;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	{
		return TRUE;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

