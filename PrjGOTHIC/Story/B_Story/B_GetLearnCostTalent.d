
func int B_GetLearnCostTalent(var C_Npc oth,var int talent,var int skill)
{
	if(talent == NPC_TALENT_MAGE)
	{
		return 5;
	};
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return B_GetTalentTrainCost(oth,talent,skill);
	};
	if((talent == NPC_TALENT_SNEAK) || (talent == NPC_TALENT_ACROBAT))
	{
		return 5;
	};
	if((talent == NPC_TALENT_PICKLOCK) || (talent == NPC_TALENT_PICKPOCKET))
	{
		return 10;
	};
	if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_Common)
		{
			return 2;
		};
		if(skill == WEAPON_1H_Special_01)
		{
			return 4;
		};
		if(skill == WEAPON_2H_Special_01)
		{
			return 4;
		};
		if(skill == WEAPON_1H_Special_02)
		{
			return 6;
		};
		if(skill == WEAPON_2H_Special_02)
		{
			return 6;
		};
		if(skill == WEAPON_1H_Special_03)
		{
			return 8;
		};
		if(skill == WEAPON_2H_Special_03)
		{
			return 8;
		};
		if(skill == WEAPON_1H_Special_04)
		{
			return 10;
		};
		if(skill == WEAPON_2H_Special_04)
		{
			return 10;
		};
		if(skill == WEAPON_1H_Harad_01)
		{
			return 4;
		};
		if(skill == WEAPON_1H_Harad_02)
		{
			return 6;
		};
		if(skill == WEAPON_1H_Harad_03)
		{
			return 8;
		};
		if(skill == WEAPON_1H_Harad_04)
		{
			return 10;
		};
	};
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_Health_01)
		{
			if(ClassicAlchemy == FALSE)
			{
				return 1;
			};
			return 2;
		};
		if(skill == POTION_Health_02)
		{
			return 3;
		};
		if(skill == POTION_Health_03)
		{
			return 5;
		};
		if(skill == POTION_Health_04)
		{
			return 8;
		};
		if(skill == POTION_Mana_01)
		{
			if(ClassicAlchemy == FALSE)
			{
				return 1;
			};
			return 2;
		};
		if(skill == POTION_Mana_02)
		{
			return 3;
		};
		if(skill == POTION_Mana_03)
		{
			return 5;
		};
		if(skill == POTION_Mana_04)
		{
			return 8;
		};
		if(skill == POTION_Speed)
		{
			return 5;
		};
		if(skill == POTION_Perm_STR)
		{
			if(ClassicAlchemy == FALSE)
			{
				return 20;
			};
			return 10;
		};
		if(skill == POTION_Perm_DEX)
		{
			if(ClassicAlchemy == FALSE)
			{
				return 20;
			};
			return 10;
		};
		if(skill == POTION_Perm_Mana)
		{
			return 10;
		};
		if(skill == POTION_Perm_Health)
		{
			return 10;
		};
		if(skill == POTION_MegaDrink)
		{
			return 20;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALFUR)
	{
		if(skill == TROPHY_Fur)
		{
			return 5;
		};
		if(skill == TROPHY_ReptileSkin)
		{
			return 3;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_Teeth)
		{
			return 3;
		};
		if(skill == TROPHY_Claws)
		{
			return 3;
		};
		if(skill == TROPHY_Heart)
		{
			return 3;
		};
		if(skill == TROPHY_ShadowHorn)
		{
			return 3;
		};
		if(skill == TROPHY_FireTongue)
		{
			return 1;
		};
		if(skill == TROPHY_BFWing)
		{
			return 1;
		};
		if(skill == TROPHY_BFSting)
		{
			return 1;
		};
		if(skill == TROPHY_Mandibles)
		{
			return 1;
		};
		if(skill == TROPHY_CrawlerPlate)
		{
			return 3;
		};
		if(skill == TROPHY_DrgSnapperHorn)
		{
			return 1;
		};
		if(skill == TROPHY_DragonScale)
		{
			return 3;
		};
		if(skill == TROPHY_DragonBlood)
		{
			return 3;
		};
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == LANGUAGE_1)
		{
			return 5;
		};
		if(skill == LANGUAGE_2)
		{
			return 10;
		};
		if(skill == LANGUAGE_3)
		{
			return 15;
		};
	};
	if(talent == NPC_TALENT_WISPDETECTOR)
	{
		return 1;
	};
	if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PalLight)
		{
			return 1;
		};
		if(skill == SPL_PalLightHeal)
		{
			return 3;
		};
		if(skill == SPL_PalHolyBolt)
		{
			return 3;
		};
		if(skill == SPL_PalMediumHeal)
		{
			return 5;
		};
		if(skill == SPL_PalRepelEvil)
		{
			return 5;
		};
		if(skill == SPL_PalFullHeal)
		{
			return 10;
		};
		if(skill == SPL_PalDestroyEvil)
		{
			return 10;
		};
		if(skill == SPL_PalTeleportSecret)
		{
			return 5;
		};
		if(skill == SPL_Light)
		{
			return 1;
		};
		if(skill == SPL_Firebolt)
		{
			return 5;
		};
		if(skill == SPL_LightHeal)
		{
			return 3;
		};
		if(skill == SPL_SummonGoblinSkeleton)
		{
			return 3;
		};
		if(skill == SPL_Zap)
		{
			return 3;
		};
		if(skill == SPL_Icebolt)
		{
			return 5;
		};
		if(skill == SPL_InstantFireball)
		{
			return 5;
		};
		if(skill == SPL_SummonWolf)
		{
			return 5;
		};
		if(skill == SPL_WindFist)
		{
			return 5;
		};
		if(skill == SPL_Sleep)
		{
			return 5;
		};
		if(skill == SPL_Charm)
		{
			return 5;
		};
		if(skill == SPL_IceLance)
		{
			return 5;
		};
		if(skill == SPL_Whirlwind)
		{
			return 5;
		};
		if(skill == SPL_MediumHeal)
		{
			return 5;
		};
		if(skill == SPL_LightningFlash)
		{
			return 5;
		};
		if(skill == SPL_ChargeFireball)
		{
			return 10;
		};
		if(skill == SPL_SummonSkeleton)
		{
			return 10;
		};
		if(skill == SPL_Fear)
		{
			return 5;
		};
		if(skill == SPL_IceCube)
		{
			return 10;
		};
		if(skill == SPL_Thunderstorm)
		{
			return 5;
		};
		if(skill == SPL_Geyser)
		{
			return 10;
		};
		if(skill == SPL_ChargeZap)
		{
			return 10;
		};
		if(skill == SPL_SummonGolem)
		{
			return 15;
		};
		if(skill == SPL_DestroyUndead)
		{
			return 10;
		};
		if(skill == SPL_Pyrokinesis)
		{
			return 15;
		};
		if(skill == SPL_WaterFist)
		{
			return 10;
		};
		if(skill == SPL_Firestorm)
		{
			return 10;
		};
		if(skill == SPL_IceWave)
		{
			return 20;
		};
		if(skill == SPL_SummonDemon)
		{
			return 20;
		};
		if(skill == SPL_FullHeal)
		{
			return 10;
		};
		if(skill == SPL_MasterOfDisaster)
		{
			return 15;
		};
		if(skill == SPL_Firerain)
		{
			return 20;
		};
		if(skill == SPL_BreathOfDeath)
		{
			return 20;
		};
		if(skill == SPL_MassDeath)
		{
			return 20;
		};
		if(skill == SPL_ArmyOfDarkness)
		{
			return 20;
		};
		if(skill == SPL_Shrink)
		{
			return 10;
		};
		return 5;
	};
	return FALSE;
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

