
/*instance ItSe_Addon_Sack(C_Item)
{
	name = NAME_Bag;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Bag.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Sack;
	description = name;
	text[0] = "����� �������� ����� �������!";
};


func void Use_Sack()
{
	Snd_Play("Geldbeutel");
	Print("������� ����� ������� ������ ������!");
	B_GiveAllAddonWeapons(self);
};


instance ItFo_TestTrigger(C_Item)
{
	name = "������� ���� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemeName = "FOODHUGE";
	on_state[0] = Use_TestTrigger;
	description = name;
};


func void Use_TestTrigger()
{
	Enter_AddonWorld_FirstTime_Trigger_Func();
};*/


instance CH(Npc_Default)
{
	name[0] = "�������� �� ���������";
	guild = GIL_NONE;
	id = 0;
	voice = 15;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_0;
};


func void Rtn_Start_0()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,8,0,"XXX");
};

func void B_SetHeroExp(var int levels)
{
	hero.level = 0;
	hero.lp = 0;
	hero.exp_next = XP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = START_ATR_HITPOINTS_MAX;
	hero.attribute[ATR_HITPOINTS] = START_ATR_HITPOINTS_MAX;
	ATR_Training[ATR_HITPOINTS_MAX] = START_ATR_HITPOINTS_MAX;
	if(levels > 0)
	{
		B_LevelUp(levels);
	};
	hero.exp = B_GetCurrentLevelExp(hero);
	PrintScreen(ConcatStrings("����. ��������: ",IntToString(hero.attribute[ATR_HITPOINTS_MAX])),-1,55,FONT_Screen,2);
	PrintScreen(ConcatStrings("���� ��������: ",IntToString(hero.lp)),-1,60,FONT_Screen,2);
};

func void B_SetKDFRunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		if(!Npc_HasItems(hero,ItRu_Light))
		{
			CreateInvItem(hero,ItRu_Light);
		};
		if(!Npc_HasItems(hero,ItRu_FireBolt))
		{
			CreateInvItem(hero,ItRu_FireBolt);
		};
		if(!Npc_HasItems(hero,ItRu_LightHeal))
		{
			CreateInvItem(hero,ItRu_LightHeal);
		};
		if(!Npc_HasItems(hero,ItRu_SumGobSkel))
		{
			CreateInvItem(hero,ItRu_SumGobSkel);
		};
		if(!Npc_HasItems(hero,ItRu_Zap))
		{
			CreateInvItem(hero,ItRu_Zap);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		if(!Npc_HasItems(hero,ItRu_InstantFireball))
		{
			CreateInvItem(hero,ItRu_InstantFireball);
		};
		if(!Npc_HasItems(hero,ItRu_Icebolt))
		{
			CreateInvItem(hero,ItRu_Icebolt);
		};
		if(!Npc_HasItems(hero,ItRu_SumWolf))
		{
			CreateInvItem(hero,ItRu_SumWolf);
		};
		if(!Npc_HasItems(hero,ItRu_Windfist))
		{
			CreateInvItem(hero,ItRu_Windfist);
		};
		if(!Npc_HasItems(hero,ItRu_Sleep))
		{
			CreateInvItem(hero,ItRu_Sleep);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		if(!Npc_HasItems(hero,ItRu_MediumHeal))
		{
			CreateInvItem(hero,ItRu_MediumHeal);
		};
		if(!Npc_HasItems(hero,ItRu_Firestorm))
		{
			CreateInvItem(hero,ItRu_Firestorm);
		};
		if(!Npc_HasItems(hero,ItRu_ThunderBall))
		{
			CreateInvItem(hero,ItRu_ThunderBall);
		};
		if(!Npc_HasItems(hero,ItRu_SumSkel))
		{
			CreateInvItem(hero,ItRu_SumSkel);
		};
		if(!Npc_HasItems(hero,ItRu_Fear))
		{
			CreateInvItem(hero,ItRu_Fear);
		};
		if(!Npc_HasItems(hero,ItRu_IceCube))
		{
			CreateInvItem(hero,ItRu_IceCube);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		if(!Npc_HasItems(hero,ItRu_SumGol))
		{
			CreateInvItem(hero,ItRu_SumGol);
		};
		if(!Npc_HasItems(hero,ItRu_HarmUndead))
		{
			CreateInvItem(hero,ItRu_HarmUndead);
		};
		if(!Npc_HasItems(hero,ItRu_LightningFlash))
		{
			CreateInvItem(hero,ItRu_LightningFlash);
		};
		if(!Npc_HasItems(hero,ItRu_ChargeFireball))
		{
			CreateInvItem(hero,ItRu_ChargeFireball);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(!Npc_HasItems(hero,ItRu_Pyrokinesis))
		{
			CreateInvItem(hero,ItRu_Pyrokinesis);
		};
		if(!Npc_HasItems(hero,ItRu_IceWave))
		{
			CreateInvItem(hero,ItRu_IceWave);
		};
		if(!Npc_HasItems(hero,ItRu_SumDemon))
		{
			CreateInvItem(hero,ItRu_SumDemon);
		};
		if(!Npc_HasItems(hero,ItRu_FullHeal))
		{
			CreateInvItem(hero,ItRu_FullHeal);
		};
		if(!Npc_HasItems(hero,ItRu_Shrink))
		{
			CreateInvItem(hero,ItRu_Shrink);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		if(!Npc_HasItems(hero,ItRu_Firerain))
		{
			CreateInvItem(hero,ItRu_Firerain);
		};
		if(!Npc_HasItems(hero,ItRu_BreathOfDeath))
		{
			CreateInvItem(hero,ItRu_BreathOfDeath);
		};
		if(!Npc_HasItems(hero,ItRu_MassDeath))
		{
			CreateInvItem(hero,ItRu_MassDeath);
		};
		if(!Npc_HasItems(hero,ItRu_ArmyOfDarkness))
		{
			CreateInvItem(hero,ItRu_ArmyOfDarkness);
		};
	};
};

func void B_SetKDWRunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		if(!Npc_HasItems(hero,ItRu_Icelance))
		{
			CreateInvItem(hero,ItRu_Icelance);
		};
		if(!Npc_HasItems(hero,ItRu_Whirlwind))
		{
			CreateInvItem(hero,ItRu_Whirlwind);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		if(!Npc_HasItems(hero,ItRu_Thunderstorm))
		{
			CreateInvItem(hero,ItRu_Thunderstorm);
		};
		if(!Npc_HasItems(hero,ItRu_Geyser))
		{
			CreateInvItem(hero,ItRu_Geyser);
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		if(!Npc_HasItems(hero,ItRu_Waterfist))
		{
			CreateInvItem(hero,ItRu_Waterfist);
		};
	};
};

func void B_SetPaladinEquipment()
{
	if(!Npc_HasItems(hero,ItRu_PalLight))
	{
		CreateInvItem(hero,ItRu_PalLight);
	};
	if(!Npc_HasItems(hero,ItRu_PalHeal_01))
	{
		CreateInvItem(hero,ItRu_PalHeal_01);
	};
	if(!Npc_HasItems(hero,ItRu_PalHolyBolt))
	{
		CreateInvItem(hero,ItRu_PalHolyBolt);
	};
	if(!Npc_HasItems(hero,ItRu_PalHeal_02))
	{
		CreateInvItem(hero,ItRu_PalHeal_02);
	};
	if(!Npc_HasItems(hero,ItRu_PalRepelEvil))
	{
		CreateInvItem(hero,ItRu_PalRepelEvil);
	};
	if(!Npc_HasItems(hero,ItRu_PalHeal_03))
	{
		CreateInvItem(hero,ItRu_PalHeal_03);
	};
	if(!Npc_HasItems(hero,ItRu_PalDestroyEvil))
	{
		CreateInvItem(hero,ItRu_PalDestroyEvil);
	};
	if(!Npc_HasItems(hero,ItRu_PalTeleportSecret))
	{
		CreateInvItem(hero,ItRu_PalTeleportSecret);
	};
};

func void B_UnEquipAllTempBonusItems()
{
	B_UnEquipHeroItem(ItBe_Addon_STR_5);
	B_UnEquipHeroItem(ItBe_Addon_STR_10);
	B_UnEquipHeroItem(ItBe_Addon_DEX_5);
	B_UnEquipHeroItem(ItBe_Addon_DEX_10);
	B_UnEquipHeroItem(ItAm_Dex_01);
	B_UnEquipHeroItem(ItAm_Strg_01);
	B_UnEquipHeroItem(ItAm_Hp_01);
	B_UnEquipHeroItem(ItAm_Mana_01);
	B_UnEquipHeroItem(ItAm_Dex_Strg_01);
	B_UnEquipHeroItem(ItAm_Hp_Mana_01);
	B_UnEquipHeroItem(ItAm_Addon_Franco);
	B_UnEquipHeroItem(ItAm_Addon_Health);
	B_UnEquipHeroItem(ItAm_Addon_STR);
	B_UnEquipHeroItem(ItRi_Dex_01);
	B_UnEquipHeroItem(ItRi_Dex_02);
	B_UnEquipHeroItem(ItRi_HP_01);
	B_UnEquipHeroItem(ItRi_HP_02);
	B_UnEquipHeroItem(ItRi_Str_01);
	B_UnEquipHeroItem(ItRi_Str_02);
	B_UnEquipHeroItem(ItRi_Mana_01);
	B_UnEquipHeroItem(ItRi_Mana_02);
	B_UnEquipHeroItem(ItRi_Dex_Strg_01);
	B_UnEquipHeroItem(ItRi_Hp_Mana_01);
	B_UnEquipHeroItem(ItRi_Addon_Health_01);
	B_UnEquipHeroItem(ItRi_Addon_Health_02);
	B_UnEquipHeroItem(ItRi_Addon_STR_01);
	B_UnEquipHeroItem(ItRi_Addon_STR_02);
	B_UnEquipHeroItem(ItRi_HP_01_Tengron);
	B_UnEquipHeroItem(ItRi_OrcEliteRing);
	B_UnEquipHeroItem(ItRi_Addon_MorgansRing_Mission);
	B_UnEquipHeroItem(ItAm_Mana_Angar_MIS);
	B_UnEquipHeroItem(ItAm_Hp_Regen);
	B_UnEquipHeroItem(ItAm_Mana_Regen);
	//������� ��� ����������� �������� ������������� ����� � ������� ������
	if(MA_Amulett_Equipped == TRUE)
	{
		B_RemoveEveryInvItem(hero,ItAm_Addon_MANA);
		CreateInvItem(hero,ItAm_Addon_MANA);
	};
	if(MA_Ring_1_Equipped == TRUE)
	{
		B_RemoveEveryInvItem(hero,ItRi_Addon_MANA_01);
		CreateInvItem(hero,ItRi_Addon_MANA_01);
	};
	if(MA_Ring_2_Equipped == TRUE)
	{
		B_RemoveEveryInvItem(hero,ItRi_Addon_MANA_02);
		CreateInvItem(hero,ItRi_Addon_MANA_02);
	};
};

func void B_ClearHeroOverlays()
{
	Mdl_RemoveOverlayMDS(hero,"Humans_Arrogance.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Babe.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Mage.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Relaxed.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Tired.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Drunken.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Sprint.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Flee.mds");
};

func void B_ResetHeroSkin()
{
	G1BodySkin = FALSE;
	G2BodySkin = FALSE;
	SequelBodySkin = FALSE;
	TattoosBodySkin = FALSE;
	NakedBodySkin = FALSE;
};

instance CH_Exit(C_Info)
{
	npc = ch;
	nr = 999;
	condition = CH_Exit_Condition;
	information = CH_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int CH_Exit_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance CH_RESET(C_Info)
{
	npc = ch;
	nr = 998;
	condition = CH_RESET_Condition;
	information = CH_RESET_Info;
	permanent = TRUE;
	description = "������ �����";
};


func int CH_RESET_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_RESET_Info()
{
	B_UnEquipHeroItem(ItSc_ThunderBall);
	B_UnEquipHeroItem(ItSc_Windfist);
	B_UnEquipHeroItem(ItSc_ChargeFireBall);
	B_UnEquipHeroItem(ItSc_Pyrokinesis);
	B_UnEquipAllCircleRunes();
	AI_UnequipWeapons(hero);
	Info_ClearChoices(CH_RESET);
	Info_AddChoice(CH_RESET,Dialog_Back,CH_RESET_Back);
	Info_AddChoice(CH_RESET,"����������",CH_RESET_Ok);
};

func void CH_RESET_Back()
{
	Info_ClearChoices(CH_RESET);
};

func void CH_RESET_Ok()
{
	if(C_ScHasMeleeBeliarsWeapon() || C_SCHasBeliarsRune())
	{
		B_ClearBeliarsItems();
		CreateInvItem(hero,ItMw_BeliarWeapon_Raven);
	};
	B_UnEquipAllTempBonusItems();
	AI_UnequipArmor(hero);
	B_SetGuild(hero,GIL_NONE);
	hero.lp = 0;
	hero.level = 0;
	hero.exp = 0;
	hero.exp_next = XP_PER_LEVEL;
	hero.attribute[ATR_STRENGTH] = START_ATR_STRENGTH;
	hero.attribute[ATR_DEXTERITY] = START_ATR_DEXTERITY;
	hero.attribute[ATR_MANA_MAX] = START_ATR_MANA_MAX;
	hero.attribute[ATR_MANA] = START_ATR_MANA_MAX;
	hero.attribute[ATR_HITPOINTS_MAX] = START_ATR_HITPOINTS_MAX;
	hero.attribute[ATR_HITPOINTS] = START_ATR_HITPOINTS_MAX;
	hero.HitChance[NPC_TALENT_1H] = START_TALENT_1H;
	hero.HitChance[NPC_TALENT_2H] = START_TALENT_2H;
	hero.HitChance[NPC_TALENT_BOW] = START_TALENT_BOW;
	hero.HitChance[NPC_TALENT_CROSSBOW] = START_TALENT_CROSSBOW;
	Npc_SetTalentSkill(hero,NPC_TALENT_PICKLOCK,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_TAKEANIMALFUR,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_FOREIGNLANGUAGE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_WISPDETECTOR,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_TAKEANIMALTROPHY,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,0);
	hero.attribute[ATR_REGENERATEHP] = 0;
	hero.attribute[ATR_REGENERATEMANA] = 0;
	Hero_HackChance = 10;
	B_ResetHeroSkin();
	G2BodySkin = TRUE;
	B_SetHeroSkin();
	B_ClearHeroOverlays();
	B_ResetTalentSystem();
	B_ResetAttributeSystem();
	PLAYER_TALENT_SMITH[WEAPON_Common] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = FALSE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalLight] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalLightHeal] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = FALSE;
	PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Light] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Firebolt] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Icebolt] = FALSE;
	PLAYER_TALENT_RUNES[SPL_LightHeal] = FALSE;
	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = FALSE;
	PLAYER_TALENT_RUNES[SPL_InstantFireball] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Zap] = FALSE;
	PLAYER_TALENT_RUNES[SPL_SummonWolf] = FALSE;
	PLAYER_TALENT_RUNES[SPL_WindFist] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Sleep] = FALSE;
	PLAYER_TALENT_RUNES[SPL_MediumHeal] = FALSE;
	PLAYER_TALENT_RUNES[SPL_LightningFlash] = FALSE;
	PLAYER_TALENT_RUNES[SPL_ChargeFireball] = FALSE;
	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Fear] = FALSE;
	PLAYER_TALENT_RUNES[SPL_IceCube] = FALSE;
	PLAYER_TALENT_RUNES[SPL_ChargeZap] = FALSE;
	PLAYER_TALENT_RUNES[SPL_SummonGolem] = FALSE;
	PLAYER_TALENT_RUNES[SPL_DestroyUndead] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Firestorm] = FALSE;
	PLAYER_TALENT_RUNES[SPL_IceWave] = FALSE;
	PLAYER_TALENT_RUNES[SPL_SummonDemon] = FALSE;
	PLAYER_TALENT_RUNES[SPL_FullHeal] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Firerain] = FALSE;
	PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = FALSE;
	PLAYER_TALENT_RUNES[SPL_MassDeath] = FALSE;
	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Shrink] = FALSE;
	PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Thunderstorm] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Whirlwind] = FALSE;
	PLAYER_TALENT_RUNES[SPL_WaterFist] = FALSE;
	PLAYER_TALENT_RUNES[SPL_IceLance] = FALSE;
	PLAYER_TALENT_RUNES[SPL_Geyser] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_01] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_02] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_03] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_04] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Speed] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = FALSE;
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = FALSE;
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = FALSE;
	Knows_LousHammer = FALSE;
	Knows_Schlafhammer = FALSE;
	Knows_SchnellerHering = FALSE;
	Knows_MCELIXIER = FALSE;
	Knows_MushroomMana = FALSE;
	Knows_AppleSTR = FALSE;
	Knows_Bloodfly = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = FALSE;
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = FALSE;
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = FALSE;
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] = FALSE;
	PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] = FALSE;
	PrintScreen("������������ �������� PC_Hero",-1,-1,FONT_Screen,2);
	Info_ClearChoices(CH_RESET);
};

var int GuildStart;

instance CH_Guild_Start(C_Info)
{
	npc = ch;
	nr = 1;
	condition = CH_Guild_Start_Condition;
	information = CH_Guild_Start_Info;
	description = "������� � �������";
	permanent = TRUE;
};


func int CH_Guild_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Guild_Start_Info()
{
	GuildStart = TRUE;
};


instance CH_Guild_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = CH_Guild_Stopper_Condition;
	information = CH_Guild_Stopper_Info;
	description = Dialog_Back;
	permanent = TRUE;
};


func int CH_Guild_Stopper_Condition()
{
	if(GuildStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Guild_Stopper_Info()
{
	Info_ClearChoices(CH_Guild_Stopper);
	GuildStart = FALSE;
};

instance CH_Guild(C_Info)
{
	npc = ch;
	nr = 7;
	condition = CH_Guild_Condition;
	information = CH_Guild_Info;
	important = FALSE;
	permanent = TRUE;
	description = "����� �������";
};


func int CH_Guild_Condition()
{
	if(GuildStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Guild_Info()
{
	Info_ClearChoices(CH_Guild);
	Info_AddChoice(CH_Guild,Dialog_Back,CH_Guild_BACK);
	Info_AddChoice(CH_Guild,"��� �������",CH_Guild_NONE);
	Info_AddChoice(CH_Guild,"�����������",CH_Guild_PIR);
	Info_AddChoice(CH_Guild,"������������",CH_Guild_BDT);
	Info_AddChoice(CH_Guild,"������� �� ��������",CH_Guild_DJG);
	Info_AddChoice(CH_Guild,"�������",CH_Guild_SLD);
	Info_AddChoice(CH_Guild,"�������",CH_Guild_PAL);
	Info_AddChoice(CH_Guild,"���������",CH_Guild_MIL);
	Info_AddChoice(CH_Guild,"��� ����",CH_Guild_KDF);
	Info_AddChoice(CH_Guild,"���������",CH_Guild_NOV);
};

func void CH_Guild_BACK()
{
	Info_ClearChoices(CH_Guild);
};

func void CH_Guild_PIR()
{
	Info_ClearChoices(CH_Guild);
	if(!Npc_HasItems(hero,ITAR_PIR_L_Addon))
	{
		CreateInvItem(hero,ITAR_PIR_L_Addon);
	};
	if(!ArmorEquipped(hero,ITAR_PIR_L_Addon))
	{
		AI_EquipArmor(hero,ITAR_PIR_L_Addon);
	};
};

func void CH_Guild_BDT()
{
	Info_ClearChoices(CH_Guild);
	if(!Npc_HasItems(hero,ITAR_BDT_M))
	{
		CreateInvItem(hero,ITAR_BDT_M);
	};
	if(!ArmorEquipped(hero,ITAR_BDT_M))
	{
		AI_EquipArmor(hero,ITAR_BDT_M);
	};
};

func void CH_Guild_NOV()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_NOV);
	if(!Npc_HasItems(hero,ITAR_NOV_L))
	{
		CreateInvItem(hero,ITAR_NOV_L);
	};
	if(!ArmorEquipped(hero,ITAR_NOV_L))
	{
		AI_EquipArmor(hero,ITAR_NOV_L);
	};
};

func void CH_Guild_KDF()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_KDF);
	if(!Npc_HasItems(hero,ITAR_KDF_L))
	{
		CreateInvItem(hero,ITAR_KDF_L);
	};
	if(!ArmorEquipped(hero,ITAR_KDF_L))
	{
		AI_EquipArmor(hero,ITAR_KDF_L);
	};
};

func void CH_Guild_SLD()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_SLD);
	if(!Npc_HasItems(hero,ITAR_SLD_M))
	{
		CreateInvItem(hero,ITAR_SLD_M);
	};
	if(!ArmorEquipped(hero,ITAR_SLD_M))
	{
		AI_EquipArmor(hero,ITAR_SLD_M);
	};
};

func void CH_Guild_DJG()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_DJG);
	if(Helmets_Enabled == TRUE)
	{
		if(!Npc_HasItems(hero,ITHE_DJG_M))
		{
			CreateInvItem(hero,ITHE_DJG_M);
		};
		if(DJGMHelmet_Equipped == FALSE)
		{
			AI_EquipArmor(hero,ITHE_DJG_M);
		};
		if(!Npc_HasItems(hero,ITAR_DJGN_M))
		{
			CreateInvItem(hero,ITAR_DJGN_M);
		};
		if(!ArmorEquipped(hero,ITAR_DJGN_M))
		{
			AI_EquipArmor(hero,ITAR_DJGN_M);
		};
	}
	else
	{
		if(!Npc_HasItems(hero,ITAR_DJG_M))
		{
			CreateInvItem(hero,ITAR_DJG_M);
		};
		if(!ArmorEquipped(hero,ITAR_DJG_M))
		{
			AI_EquipArmor(hero,ITAR_DJG_M);
		};
	};
};

func void CH_Guild_MIL()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_MIL);
	if(!Npc_HasItems(hero,ITAR_MIL_L))
	{
		CreateInvItem(hero,ITAR_MIL_L);
	};
	if(!ArmorEquipped(hero,ITAR_MIL_L))
	{
		AI_EquipArmor(hero,ITAR_MIL_L);
	};
};

func void CH_Guild_PAL()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_PAL);
	if(Helmets_Enabled == TRUE)
	{
		if(!Npc_HasItems(hero,ITHE_PAL_M))
		{
			CreateInvItem(hero,ITHE_PAL_M);
		};
		if(PALMHelmet_Equipped == FALSE)
		{
			AI_EquipArmor(hero,ITHE_PAL_M);
		};
		if(!Npc_HasItems(hero,ITAR_PALN_M))
		{
			CreateInvItem(hero,ITAR_PALN_M);
		};
		if(!ArmorEquipped(hero,ITAR_PALN_M))
		{
			AI_EquipArmor(hero,ITAR_PALN_M);
		};
	}
	else
	{
		if(!Npc_HasItems(hero,ITAR_PAL_M))
		{
			CreateInvItem(hero,ITAR_PAL_M);
		};
		if(!ArmorEquipped(hero,ITAR_PAL_M))
		{
			AI_EquipArmor(hero,ITAR_PAL_M);
		};
	};
	B_SetPaladinEquipment();
};

func void CH_Guild_NONE()
{
	Info_ClearChoices(CH_Guild);
	B_SetGuild(hero,GIL_NONE);
	AI_UnequipArmor(hero);
};


instance CH_Apprentice(C_Info)
{
	npc = ch;
	nr = 8;
	condition = CH_Apprentice_Condition;
	information = CH_Apprentice_Info;
	important = FALSE;
	permanent = TRUE;
	description = "����� �������";
};


func int CH_Apprentice_Condition()
{
	if(GuildStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Apprentice_Info()
{
	Info_ClearChoices(CH_Apprentice);
	Info_AddChoice(CH_Apprentice,Dialog_Back,CH_Apprentice_BACK);
	if(Player_IsApprentice != APP_NONE)
	{
		Info_AddChoice(CH_Apprentice,"�����",CH_Apprentice_None);
	};
	Info_AddChoice(CH_Apprentice,B_BuildOptionString(ConcatStrings(NAME_TROPHY_Fur,": ������"),Player_IsApprentice,APP_Bosper),CH_Apprentice_Bosper);
	Info_AddChoice(CH_Apprentice,B_BuildOptionString(ConcatStrings(NAME_Skill_Smith,": �����"),Player_IsApprentice,APP_Harad),CH_Apprentice_Harad);
	Info_AddChoice(CH_Apprentice,B_BuildOptionString(ConcatStrings(NAME_Skill_Alchemy,": �����������"),Player_IsApprentice,APP_Constantino),CH_Apprentice_Constantino);
};

func void CH_Apprentice_BACK()
{
	Info_ClearChoices(CH_Apprentice);
};

func void CH_Apprentice_Bosper()
{
	Player_IsApprentice = APP_Bosper;
	PrintScreen("������: ������",-1,-1,FONT_Screen,3);
	MIS_Apprentice = LOG_SUCCESS;
	B_CheckLog();
	CH_Apprentice_Info();
};

func void CH_Apprentice_Harad()
{
	Player_IsApprentice = APP_Harad;
	PrintScreen("������: �����",-1,-1,FONT_Screen,3);
	MIS_Apprentice = LOG_SUCCESS;
	B_CheckLog();
	CH_Apprentice_Info();
};

func void CH_Apprentice_Constantino()
{
	Player_IsApprentice = APP_Constantino;
	PrintScreen("������: �����������",-1,-1,FONT_Screen,3);
	MIS_Apprentice = LOG_SUCCESS;
	B_CheckLog();
	CH_Apprentice_Info();
};

func void CH_Apprentice_None()
{
	Player_IsApprentice = APP_NONE;
	PrintScreen("������ �������",-1,-1,FONT_Screen,3);
	CH_Apprentice_Info();
};


var int LevelStart;

instance CH_Level_Start(C_Info)
{
	npc = ch;
	nr = 2;
	condition = CH_Level_Start_Condition;
	information = CH_Level_Start_Info;
	description = "������� � ���� ��������";
	permanent = TRUE;
};


func int CH_Level_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Level_Start_Info()
{
	LevelStart = TRUE;
};


instance CH_Level_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = CH_Level_Stopper_Condition;
	information = CH_Level_Stopper_Info;
	description = Dialog_Back;
	permanent = TRUE;
};


func int CH_Level_Stopper_Condition()
{
	if(LevelStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Level_Stopper_Info()
{
	Info_ClearChoices(CH_Level_Stopper);
	LevelStart = FALSE;
};


instance CH_Lernpunkte(C_Info)
{
	npc = ch;
	nr = 5;
	condition = CH_Lernpunkte_Condition;
	information = CH_Lernpunkte_Info;
	description = "���� ��������";
	permanent = TRUE;
};


func int CH_Lernpunkte_Condition()
{
	if(LevelStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Lernpunkte_Info()
{
	Info_ClearChoices(CH_Lernpunkte);
	Info_AddChoice(CH_Lernpunkte,Dialog_Back,CH_Lernpunkte_BACK);
	if(hero.lp > 0)
	{
		Info_AddChoice(CH_Lernpunkte,"��������",CH_Lernpunkte_0);
	};
	Info_AddChoice(CH_Lernpunkte,"���� �������� + 50",CH_Lernpunkte_50);
	Info_AddChoice(CH_Lernpunkte,"���� �������� + 25",CH_Lernpunkte_25);
	Info_AddChoice(CH_Lernpunkte,"���� �������� + 10",CH_Lernpunkte_10);
	Info_AddChoice(CH_Lernpunkte,"���� �������� + 5",CH_Lernpunkte_5);
};

func void CH_Lernpunkte_BACK()
{
	Info_ClearChoices(CH_Lernpunkte);
};

func void CH_Lernpunkte_0()
{
	hero.lp = 0;
	PrintScreen("���� �������� ��������",-1,-1,FONT_Screen,3);
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_50()
{
	B_GivePlayerLP(50);
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_25()
{
	B_GivePlayerLP(25);
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_10()
{
	B_GivePlayerLP(10);
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_5()
{
	B_GivePlayerLP(5);
	CH_Lernpunkte_Info();
};


instance CH_Level_niedrig(C_Info)
{
	npc = ch;
	nr = 2;
	condition = CH_Level_niedrig_Condition;
	information = CH_Level_niedrig_Info;
	description = "����� ������ 0 - 25";
	permanent = TRUE;
};


func int CH_Level_niedrig_Condition()
{
	if(LevelStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Level_niedrig_Info()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"������� 21 - 25",CH_Level21);
	Info_AddChoice(CH_Level_niedrig,"������� 16 - 20",CH_Level16);
	Info_AddChoice(CH_Level_niedrig,"������� 11 - 15",CH_Level11);
	Info_AddChoice(CH_Level_niedrig,"�������  6 - 10",CH_Level6);
	Info_AddChoice(CH_Level_niedrig,"�������  0 -  5",CH_Level1);
};


instance CH_Level_hoch(C_Info)
{
	npc = ch;
	nr = 3;
	condition = CH_Level_hoch_Condition;
	information = CH_Level_hoch_Info;
	description = "����� ������ 26 - 50";
	permanent = TRUE;
};


func int CH_Level_hoch_Condition()
{
	if(LevelStart == TRUE)
	{
		return TRUE;
	};
};

func void CH_Level_hoch_Info()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"������� 46 - 50",CH_Level46);
	Info_AddChoice(CH_Level_hoch,"������� 41 - 45",CH_Level41);
	Info_AddChoice(CH_Level_hoch,"������� 36 - 40",CH_Level36);
	Info_AddChoice(CH_Level_hoch,"������� 31 - 35",CH_Level31);
	Info_AddChoice(CH_Level_hoch,"������� 26 - 30",CH_Level26);
};

func void CH_Level46()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"������� 50",CH_Level_50);
	Info_AddChoice(CH_Level_hoch,"������� 49",CH_Level_49);
	Info_AddChoice(CH_Level_hoch,"������� 48",CH_Level_48);
	Info_AddChoice(CH_Level_hoch,"������� 47",CH_Level_47);
	Info_AddChoice(CH_Level_hoch,"������� 46",CH_Level_46);
};

func void CH_Level41()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"������� 45",CH_Level_45);
	Info_AddChoice(CH_Level_hoch,"������� 44",CH_Level_44);
	Info_AddChoice(CH_Level_hoch,"������� 43",CH_Level_43);
	Info_AddChoice(CH_Level_hoch,"������� 42",CH_Level_42);
	Info_AddChoice(CH_Level_hoch,"������� 41",CH_Level_41);
};

func void CH_Level36()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"������� 40",CH_Level_40);
	Info_AddChoice(CH_Level_hoch,"������� 39",CH_Level_39);
	Info_AddChoice(CH_Level_hoch,"������� 38",CH_Level_38);
	Info_AddChoice(CH_Level_hoch,"������� 37",CH_Level_37);
	Info_AddChoice(CH_Level_hoch,"������� 36",CH_Level_36);
};

func void CH_Level31()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"������� 35",CH_Level_35);
	Info_AddChoice(CH_Level_hoch,"������� 34",CH_Level_34);
	Info_AddChoice(CH_Level_hoch,"������� 33",CH_Level_33);
	Info_AddChoice(CH_Level_hoch,"������� 32",CH_Level_32);
	Info_AddChoice(CH_Level_hoch,"������� 31",CH_Level_31);
};

func void CH_Level26()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"������� 30",CH_Level_30);
	Info_AddChoice(CH_Level_hoch,"������� 29",CH_Level_29);
	Info_AddChoice(CH_Level_hoch,"������� 28",CH_Level_28);
	Info_AddChoice(CH_Level_hoch,"������� 27",CH_Level_27);
	Info_AddChoice(CH_Level_hoch,"������� 26",CH_Level_26);
};

func void CH_Level21()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"������� 25",CH_Level_25);
	Info_AddChoice(CH_Level_niedrig,"������� 24",CH_Level_24);
	Info_AddChoice(CH_Level_niedrig,"������� 23",CH_Level_23);
	Info_AddChoice(CH_Level_niedrig,"������� 22",CH_Level_22);
	Info_AddChoice(CH_Level_niedrig,"������� 21",CH_Level_21);
};

func void CH_Level16()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"������� 20",CH_Level_20);
	Info_AddChoice(CH_Level_niedrig,"������� 19",CH_Level_19);
	Info_AddChoice(CH_Level_niedrig,"������� 18",CH_Level_18);
	Info_AddChoice(CH_Level_niedrig,"������� 17",CH_Level_17);
	Info_AddChoice(CH_Level_niedrig,"������� 16",CH_Level_16);
};

func void CH_Level11()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"������� 15",CH_Level_15);
	Info_AddChoice(CH_Level_niedrig,"������� 14",CH_Level_14);
	Info_AddChoice(CH_Level_niedrig,"������� 13",CH_Level_13);
	Info_AddChoice(CH_Level_niedrig,"������� 12",CH_Level_12);
	Info_AddChoice(CH_Level_niedrig,"������� 11",CH_Level_11);
};

func void CH_Level6()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"������� 10",CH_Level_10);
	Info_AddChoice(CH_Level_niedrig,"������� 9",CH_Level_9);
	Info_AddChoice(CH_Level_niedrig,"������� 8",CH_Level_8);
	Info_AddChoice(CH_Level_niedrig,"������� 7",CH_Level_7);
	Info_AddChoice(CH_Level_niedrig,"������� 6",CH_Level_6);
};

func void CH_Level1()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"������� 5",CH_Level_5);
	Info_AddChoice(CH_Level_niedrig,"������� 4",CH_Level_4);
	Info_AddChoice(CH_Level_niedrig,"������� 3",CH_Level_3);
	Info_AddChoice(CH_Level_niedrig,"������� 2",CH_Level_2);
	Info_AddChoice(CH_Level_niedrig,"������� 1",CH_Level_1);
	Info_AddChoice(CH_Level_niedrig,"������� 0",CH_Level_0);
};

func void CH_Level_niedrig_BACK()
{
	Info_ClearChoices(CH_Level_niedrig);
};

func void CH_Level_hoch_BACK()
{
	Info_ClearChoices(CH_Level_hoch);
};

func void CH_Level_0()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(0);
};

func void CH_Level_1()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(1);
};

func void CH_Level_2()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(2);
};

func void CH_Level_3()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(3);
};

func void CH_Level_4()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(4);
};

func void CH_Level_5()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(5);
};

func void CH_Level_6()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(6);
};

func void CH_Level_7()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(7);
};

func void CH_Level_8()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(8);
};

func void CH_Level_9()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(9);
};

func void CH_Level_10()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(10);
};

func void CH_Level_11()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(11);
};

func void CH_Level_12()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(12);
};

func void CH_Level_13()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(13);
};

func void CH_Level_14()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(14);
};

func void CH_Level_15()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(15);
};

func void CH_Level_16()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(16);
};

func void CH_Level_17()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(17);
};

func void CH_Level_18()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(18);
};

func void CH_Level_19()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(19);
};

func void CH_Level_20()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(20);
};

func void CH_Level_21()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(21);
};

func void CH_Level_22()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(22);
};

func void CH_Level_23()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(23);
};

func void CH_Level_24()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(24);
};

func void CH_Level_25()
{
	Info_ClearChoices(CH_Level_niedrig);
	B_SetHeroExp(25);
};

func void CH_Level_26()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(26);
};

func void CH_Level_27()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(27);
};

func void CH_Level_28()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(28);
};

func void CH_Level_29()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(29);
};

func void CH_Level_30()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(30);
};

func void CH_Level_31()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(31);
};

func void CH_Level_32()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(32);
};

func void CH_Level_33()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(33);
};

func void CH_Level_34()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(34);
};

func void CH_Level_35()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(35);
};

func void CH_Level_36()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(36);
};

func void CH_Level_37()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(37);
};

func void CH_Level_38()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(38);
};

func void CH_Level_39()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(39);
};

func void CH_Level_40()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(40);
};

func void CH_Level_41()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(41);
};

func void CH_Level_42()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(42);
};

func void CH_Level_43()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(43);
};

func void CH_Level_44()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(44);
};

func void CH_Level_45()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(45);
};

func void CH_Level_46()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(46);
};

func void CH_Level_47()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(47);
};

func void CH_Level_48()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(48);
};

func void CH_Level_49()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(49);
};

func void CH_Level_50()
{
	Info_ClearChoices(CH_Level_hoch);
	B_SetHeroExp(50);
};


var int AttributeStart;

instance DIA_CH_Attribute_Start(C_Info)
{
	npc = ch;
	nr = 3;
	condition = DIA_CH_Attribute_Start_Condition;
	information = DIA_CH_Attribute_Start_Info;
	permanent = TRUE;
	description = "�������������� (����, ��������, ����, ��������)";
};


func int DIA_CH_Attribute_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Attribute_Start_Info()
{
	AttributeStart = TRUE;
};


instance DIA_CH_Attribute_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_Attribute_Stopper_Condition;
	information = DIA_CH_Attribute_Stopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_Attribute_Stopper_Condition()
{
	if(AttributeStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Attribute_Stopper_Info()
{
	AttributeStart = FALSE;
};


instance DIA_CH_Strength(C_Info)
{
	npc = ch;
	nr = 2;
	condition = DIA_CH_Strength_Condition;
	information = DIA_CH_Strength_Info;
	permanent = TRUE;
	description = "�������� ����";
};


func int DIA_CH_Strength_Condition()
{
	if(AttributeStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Strength_Info()
{
	Info_ClearChoices(DIA_CH_Strength);
	Info_AddChoice(DIA_CH_Strength,Dialog_Back,DIA_CH_Strength_BACK);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnAttributeString(ATR_STRENGTH,20),DIA_CH_Strength_20);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnAttributeString(ATR_STRENGTH,10),DIA_CH_Strength_10);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnAttributeString(ATR_STRENGTH,5),DIA_CH_Strength_5);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnAttributeString(ATR_STRENGTH,1),DIA_CH_Strength_1);
};

func void DIA_CH_Strength_BACK()
{
	Info_ClearChoices(DIA_CH_Strength);
};

func void DIA_CH_Strength_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	DIA_CH_Strength_Info();
};

func void DIA_CH_Strength_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	DIA_CH_Strength_Info();
};

func void DIA_CH_Strength_10()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,10,T_MEGA);
	DIA_CH_Strength_Info();
};

func void DIA_CH_Strength_20()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,20,T_MEGA);
	DIA_CH_Strength_Info();
};


instance DIA_CH_Dex(C_Info)
{
	npc = ch;
	nr = 3;
	condition = DIA_CH_Dex_Condition;
	information = DIA_CH_Dex_Info;
	permanent = TRUE;
	description = "�������� ��������";
};


func int DIA_CH_Dex_Condition()
{
	if(AttributeStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Dex_Info()
{
	Info_ClearChoices(DIA_CH_Dex);
	Info_AddChoice(DIA_CH_Dex,Dialog_Back,DIA_CH_Dex_BACK);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnAttributeString(ATR_DEXTERITY,20),DIA_CH_Dex_20);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnAttributeString(ATR_DEXTERITY,10),DIA_CH_Dex_10);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_CH_Dex_5);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_CH_Dex_1);
};

func void DIA_CH_Dex_BACK()
{
	Info_ClearChoices(DIA_CH_Dex);
};

func void DIA_CH_Dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	DIA_CH_Dex_Info();
};

func void DIA_CH_Dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	DIA_CH_Dex_Info();
};

func void DIA_CH_Dex_10()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,10,T_MEGA);
	DIA_CH_Dex_Info();
};

func void DIA_CH_Dex_20()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,20,T_MEGA);
	DIA_CH_Dex_Info();
};


instance DIA_CH_Mana(C_Info)
{
	npc = ch;
	nr = 4;
	condition = DIA_CH_Mana_Condition;
	information = DIA_CH_Mana_Info;
	permanent = TRUE;
	description = "�������� ����. ����";
};


func int DIA_CH_Mana_Condition()
{
	if(AttributeStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Mana_Info()
{
	Info_ClearChoices(DIA_CH_Mana);
	Info_AddChoice(DIA_CH_Mana,Dialog_Back,DIA_CH_Mana_BACK);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnAttributeString(ATR_MANA_MAX,20),DIA_CH_Mana_20);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnAttributeString(ATR_MANA_MAX,10),DIA_CH_Mana_10);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnAttributeString(ATR_MANA_MAX,5),DIA_CH_Mana_5);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnAttributeString(ATR_MANA_MAX,1),DIA_CH_Mana_1);
};

func void DIA_CH_Mana_BACK()
{
	Info_ClearChoices(DIA_CH_Mana);
};

func void DIA_CH_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	DIA_CH_Mana_Info();
};

func void DIA_CH_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	DIA_CH_Mana_Info();
};

func void DIA_CH_Mana_10()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,10,T_MEGA);
	DIA_CH_Mana_Info();
};

func void DIA_CH_Mana_20()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,20,T_MEGA);
	DIA_CH_Mana_Info();
};


instance DIA_CH_HP(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_HP_Condition;
	information = DIA_CH_HP_Info;
	permanent = TRUE;
	description = "�������� ����. ��������";
};


func int DIA_CH_HP_Condition()
{
	if(AttributeStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_HP_Info()
{
	Info_ClearChoices(DIA_CH_HP);
	Info_AddChoice(DIA_CH_HP,Dialog_Back,DIA_CH_HP_BACK);
	Info_AddChoice(DIA_CH_HP,B_BuildLearnAttributeString(ATR_HITPOINTS_MAX,20),DIA_CH_HP_20);
	Info_AddChoice(DIA_CH_HP,B_BuildLearnAttributeString(ATR_HITPOINTS_MAX,10),DIA_CH_HP_10);
	Info_AddChoice(DIA_CH_HP,B_BuildLearnAttributeString(ATR_HITPOINTS_MAX,5),DIA_CH_HP_5);
	Info_AddChoice(DIA_CH_HP,B_BuildLearnAttributeString(ATR_HITPOINTS_MAX,1),DIA_CH_HP_1);
};

func void DIA_CH_HP_BACK()
{
	Info_ClearChoices(DIA_CH_HP);
};

func void DIA_CH_HP_1()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,1,T_MEGA);
	DIA_CH_HP_Info();
};

func void DIA_CH_HP_5()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,5,T_MEGA);
	DIA_CH_HP_Info();
};

func void DIA_CH_HP_10()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,10,T_MEGA);
	DIA_CH_HP_Info();
};

func void DIA_CH_HP_20()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,20,T_MEGA);
	DIA_CH_HP_Info();
};


var int MagieStart;

instance DIA_CH_MAGIE(C_Info)
{
	npc = ch;
	nr = 4;
	condition = DIA_CH_MAGIE_Condition;
	information = DIA_CH_MAGIE_Info;
	permanent = TRUE;
	description = "����� (�����, �������� ���, ����� ���������)";
};


func int DIA_CH_MAGIE_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_MAGIE_Info()
{
	MagieStart = TRUE;
};


instance DIA_CH_MAGIE_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_MAGIE_Stopper_Condition;
	information = DIA_CH_MAGIE_Stopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_MAGIE_Stopper_Condition()
{
	if(MagieStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_MAGIE_Stopper_Info()
{
	MagieStart = FALSE;
};


instance DIA_CH_KREISE(C_Info)
{
	npc = ch;
	nr = 4;
	condition = DIA_CH_KREISE_Condition;
	information = DIA_CH_KREISE_Info;
	permanent = TRUE;
	description = NAME_Skill_MagicCircles;
};


func int DIA_CH_KREISE_Condition()
{
	if(MagieStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_KREISE_Info()
{
	Info_ClearChoices(DIA_CH_KREISE);
	Info_AddChoice(DIA_CH_KREISE,Dialog_Back,DIA_CH_KREISE_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice(DIA_CH_KREISE,B_BuildLearnString(NAME_Circle_1,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1)),DIA_CH_KREISE_1);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(DIA_CH_KREISE,B_BuildLearnString(NAME_Circle_2,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2)),DIA_CH_KREISE_2);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(DIA_CH_KREISE,B_BuildLearnString(NAME_Circle_3,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3)),DIA_CH_KREISE_3);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(DIA_CH_KREISE,B_BuildLearnString(NAME_Circle_4,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),DIA_CH_KREISE_4);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_CH_KREISE,B_BuildLearnString(NAME_Circle_5,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),DIA_CH_KREISE_5);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_CH_KREISE,B_BuildLearnString(NAME_Circle_6,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),DIA_CH_KREISE_6);
	};
};

func void DIA_CH_KREISE_BACK()
{
	Info_ClearChoices(DIA_CH_KREISE);
};

func void DIA_CH_KREISE_1()
{
	B_TeachMagicCircle(self,other,1);
	B_SetKDFRunes();
	DIA_CH_KREISE_Info();
};

func void DIA_CH_KREISE_2()
{
	B_TeachMagicCircle(self,other,2);
	B_SetKDFRunes();
	B_SetKDWRunes();
	DIA_CH_KREISE_Info();
};

func void DIA_CH_KREISE_3()
{
	B_TeachMagicCircle(self,other,3);
	B_SetKDFRunes();
	B_SetKDWRunes();
	DIA_CH_KREISE_Info();
};

func void DIA_CH_KREISE_4()
{
	B_TeachMagicCircle(self,other,4);
	B_SetKDFRunes();
	B_SetKDWRunes();
	DIA_CH_KREISE_Info();
};

func void DIA_CH_KREISE_5()
{
	B_TeachMagicCircle(self,other,5);
	B_SetKDFRunes();
	DIA_CH_KREISE_Info();
};

func void DIA_CH_KREISE_6()
{
	B_TeachMagicCircle(self,other,6);
	B_SetKDFRunes();
	DIA_CH_KREISE_Info();
};


instance DIA_CH_Runen(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_Runen_Condition;
	information = DIA_CH_Runen_Info;
	permanent = TRUE;
	description = NAME_Skill_Runes;
};


func int DIA_CH_Runen_Condition()
{
	if(MagieStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Runen_Info()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_CH_Runen,NAME_Circle_6,DIA_CH_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_CH_Runen,NAME_Circle_5,DIA_CH_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_CH_Runen,NAME_Circle_4,DIA_CH_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_CH_Runen,NAME_Circle_3,DIA_CH_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_CH_Runen,NAME_Circle_2,DIA_CH_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_CH_Runen,NAME_Circle_1,DIA_CH_Runen_1);
	};
};

func void DIA_CH_Runen_BACK()
{
	Info_ClearChoices(DIA_CH_Runen);
};

func void DIA_CH_Runen_1()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_Info);
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),CH_Training_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),CH_Training_Runen_Circle_1_SPL_LightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Zap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Zap)),CH_Training_Runen_Circle_1_SPL_Zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt)),CH_Training_Runen_Circle_1_SPL_Firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),CH_Training_Runen_Circle_1_SPL_LIGHT);
	};
};

func void CH_Training_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void CH_Training_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firebolt);
};

func void CH_Training_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void CH_Training_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void CH_Training_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void DIA_CH_Runen_2()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_Info);
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),CH_Training_Runen_Circle_2_SPL_InstantFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),CH_Training_Runen_Circle_2_SPL_Icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),CH_Training_Runen_Circle_2_SPL_SummonWolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),CH_Training_Runen_Circle_2_SPL_WINDFIST);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),CH_Training_Runen_Circle_2_SPL_Sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),CH_Training_Runen_Circle_2_SPL_Whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),CH_Training_Runen_Circle_2_SPL_ICELANCE);
	};
};

func void CH_Training_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void CH_Training_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void CH_Training_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void CH_Training_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void CH_Training_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void CH_Training_Runen_Circle_2_SPL_Whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void CH_Training_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void DIA_CH_Runen_3()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_Info);
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),CH_Training_Runen_Circle_3_SPL_MediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),CH_Training_Runen_Circle_3_SPL_ThunderBall);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),CH_Training_Runen_Circle_3_SPL_Firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),CH_Training_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),CH_Training_Runen_Circle_3_SPL_Fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),CH_Training_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),CH_Training_Runen_Circle_3_SPL_Thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),CH_Training_Runen_Circle_3_SPL_Geyser);
	};
};

func void CH_Training_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void CH_Training_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void CH_Training_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void CH_Training_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void CH_Training_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void CH_Training_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void CH_Training_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

func void CH_Training_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void DIA_CH_Runen_4()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_Info);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),CH_Training_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),CH_Training_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),CH_Training_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),CH_Training_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),CH_Training_Runen_Circle_4_SPL_Waterfist);
	};
};

func void CH_Training_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void CH_Training_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void CH_Training_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void CH_Training_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void CH_Training_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void DIA_CH_Runen_5()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_Info);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),CH_Training_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),CH_Training_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),CH_Training_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),CH_Training_Runen_Circle_5_SPL_Pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),CH_Training_Runen_Circle_5_SPL_Shrink);
	};
};

func void CH_Training_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void CH_Training_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void CH_Training_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void CH_Training_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_CH_Runen_6()
{
	Info_ClearChoices(DIA_CH_Runen);
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_Info);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),CH_Training_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),CH_Training_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),CH_Training_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),CH_Training_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	/*if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_CH_Runen,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),CH_Training_Runen_Circle_6_SPL_Shrink);
	};*/
};

func void CH_Training_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void CH_Training_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void CH_Training_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void CH_Training_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void CH_Training_Runen_Circle_5_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};


instance DIA_CH_Misc_PaladinStart(C_Info)
{
	npc = ch;
	nr = 7;
	condition = DIA_CH_Misc_PaladinStart_Condition;
	information = DIA_CH_Misc_PaladinStart_Info;
	permanent = TRUE;
	description = NAME_Skill_PalRunes;
};


func int DIA_CH_Misc_PaladinStart_Condition()
{
	if(MagieStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_PaladinStart_Info()
{
	Info_ClearChoices(DIA_CH_Misc_PaladinStart);
	Info_AddChoice(DIA_CH_Misc_PaladinStart,Dialog_Back,DIA_CH_Misc_PaladinStart_BACK);
	Info_AddChoice(DIA_CH_Misc_PaladinStart,"������ ����������",DIA_CH_Misc_PalKampf);
	Info_AddChoice(DIA_CH_Misc_PaladinStart,"���������� ����� � ���������",DIA_CH_Misc_PalHeal);
};


func void DIA_CH_Misc_PaladinStart_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_PaladinStart);
};

func void DIA_CH_Misc_PalHeal()
{
	Info_ClearChoices(DIA_CH_Misc_PaladinStart);
	Info_AddChoice(DIA_CH_Misc_PaladinStart,Dialog_Back,DIA_CH_Misc_PaladinStart_Info);
	if(PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalFullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalFullHeal)),CH_Training_Runen_Paladin_SPL_PalFullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalMediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalMediumHeal)),CH_Training_Runen_Paladin_SPL_PalMediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalLightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLightHeal)),CH_Training_Runen_Paladin_SPL_PalLightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalLight,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLight)),CH_Training_Runen_Paladin_SPL_PalLight);
	};
};

func void CH_Training_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalLight);
};

func void CH_Training_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalLightHeal);
};

func void CH_Training_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalMediumHeal);
};

func void CH_Training_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalFullHeal);
};

func void DIA_CH_Misc_PalKampf()
{
	Info_ClearChoices(DIA_CH_Misc_PaladinStart);
	Info_AddChoice(DIA_CH_Misc_PaladinStart,Dialog_Back,DIA_CH_Misc_PaladinStart_Info);
	if(PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalDestroyEvil,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalDestroyEvil)),CH_Training_Runen_Paladin_SPL_PalDestroyEvil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalRepelEvil,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalRepelEvil)),CH_Training_Runen_Paladin_SPL_PalRepelEvil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_PaladinStart,B_BuildLearnString(NAME_SPL_PalHolyBolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalHolyBolt)),CH_Training_Runen_Paladin_SPL_PalHolyBolt);
	};
};

func void CH_Training_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalHolyBolt);
};

func void CH_Training_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalRepelEvil);
};

func void CH_Training_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalDestroyEvil);
};


var int KampfStart;

instance DIA_CH_Kampf_Start(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_Kampf_Start_Condition;
	information = DIA_CH_Kampf_Start_Info;
	permanent = TRUE;
	description = "������ ������ (������� � ������� ���)";
};


func int DIA_CH_Kampf_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Kampf_Start_Info()
{
	KampfStart = TRUE;
};


instance DIA_CH_Kampf_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_Kampf_Stopper_Condition;
	information = DIA_CH_Kampf_Stopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_Kampf_Stopper_Condition()
{
	if(KampfStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Kampf_Stopper_Info()
{
	KampfStart = FALSE;
};


instance DIA_CH_Kampf_Einhand(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Kampf_Einhand_Condition;
	information = DIA_CH_Kampf_Einhand_Info;
	permanent = TRUE;
	description = NAME_OneHanded;
};


func int DIA_CH_Kampf_Einhand_Condition()
{
	if(KampfStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Kampf_Einhand_Info()
{
	Info_ClearChoices(DIA_CH_Kampf_Einhand);
	Info_AddChoice(DIA_CH_Kampf_Einhand,Dialog_Back,DIA_CH_Kampf_Einhand_BACK);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnTalentString(other,NPC_TALENT_1H,20),CH_Training_Combat_1H_20);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnTalentString(other,NPC_TALENT_1H,10),CH_Training_Combat_1H_10);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),CH_Training_Combat_1H_5);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),CH_Training_Combat_1H_1);
};

func void DIA_CH_Kampf_Einhand_BACK()
{
	Info_ClearChoices(DIA_CH_Kampf_Einhand);
};

func void CH_Training_Combat_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	DIA_CH_Kampf_Einhand_Info();
};

func void CH_Training_Combat_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	DIA_CH_Kampf_Einhand_Info();
};

func void CH_Training_Combat_1H_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,10,100);
	DIA_CH_Kampf_Einhand_Info();
};

func void CH_Training_Combat_1H_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,20,100);
	DIA_CH_Kampf_Einhand_Info();
};


instance DIA_CH_Kampf_Zweihand(C_Info)
{
	npc = ch;
	nr = 7;
	condition = DIA_CH_Kampf_Zweihand_Condition;
	information = DIA_CH_Kampf_Zweihand_Info;
	permanent = TRUE;
	description = NAME_TwoHanded;
};


func int DIA_CH_Kampf_Zweihand_Condition()
{
	if(KampfStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Kampf_Zweihand_Info()
{
	Info_ClearChoices(DIA_CH_Kampf_Zweihand);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,Dialog_Back,DIA_CH_Kampf_Zweihand_BACK);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnTalentString(other,NPC_TALENT_2H,20),CH_Training_Combat_2H_20);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnTalentString(other,NPC_TALENT_2H,10),CH_Training_Combat_2H_10);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),CH_Training_Combat_2H_5);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),CH_Training_Combat_2H_1);
};

func void DIA_CH_Kampf_Zweihand_BACK()
{
	Info_ClearChoices(DIA_CH_Kampf_Zweihand);
};

func void CH_Training_Combat_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	DIA_CH_Kampf_Zweihand_Info();
};

func void CH_Training_Combat_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	DIA_CH_Kampf_Zweihand_Info();
};

func void CH_Training_Combat_2H_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,10,100);
	DIA_CH_Kampf_Zweihand_Info();
};

func void CH_Training_Combat_2H_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,20,100);
	DIA_CH_Kampf_Zweihand_Info();
};


instance DIA_CH_Kampf_Bogen(C_Info)
{
	npc = ch;
	nr = 8;
	condition = DIA_CH_Kampf_Bogen_Condition;
	information = DIA_CH_Kampf_Bogen_Info;
	permanent = TRUE;
	description = NAME_Bow;
};


func int DIA_CH_Kampf_Bogen_Condition()
{
	if(KampfStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Kampf_Bogen_Info()
{
	Info_ClearChoices(DIA_CH_Kampf_Bogen);
	Info_AddChoice(DIA_CH_Kampf_Bogen,Dialog_Back,DIA_CH_Kampf_Bogen_BACK);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnTalentString(other,NPC_TALENT_BOW,20),CH_Training_Combat_BOW_20);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnTalentString(other,NPC_TALENT_BOW,10),CH_Training_Combat_BOW_10);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnTalentString(other,NPC_TALENT_BOW,5),CH_Training_Combat_BOW_5);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnTalentString(other,NPC_TALENT_BOW,1),CH_Training_Combat_BOW_1);
};

func void DIA_CH_Kampf_Bogen_BACK()
{
	Info_ClearChoices(DIA_CH_Kampf_Bogen);
};

func void CH_Training_Combat_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100);
	DIA_CH_Kampf_Bogen_Info();
};

func void CH_Training_Combat_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100);
	DIA_CH_Kampf_Bogen_Info();
};

func void CH_Training_Combat_BOW_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,10,100);
	DIA_CH_Kampf_Bogen_Info();
};

func void CH_Training_Combat_BOW_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,20,100);
	DIA_CH_Kampf_Bogen_Info();
};


instance DIA_CH_Kampf_Armbrust(C_Info)
{
	npc = ch;
	nr = 8;
	condition = DIA_CH_Kampf_Armbrust_Condition;
	information = DIA_CH_Kampf_Armbrust_Info;
	permanent = TRUE;
	description = NAME_CrossBow;
};


func int DIA_CH_Kampf_Armbrust_Condition()
{
	if(KampfStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Kampf_Armbrust_Info()
{
	Info_ClearChoices(DIA_CH_Kampf_Armbrust);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,Dialog_Back,DIA_CH_Kampf_Armbrust_BACK);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,20),CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,1),CH_Training_Combat_CROSSBOW_1);
};

func void DIA_CH_Kampf_Armbrust_BACK()
{
	Info_ClearChoices(DIA_CH_Kampf_Armbrust);
};

func void CH_Training_Combat_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	DIA_CH_Kampf_Armbrust_Info();
};

func void CH_Training_Combat_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	DIA_CH_Kampf_Armbrust_Info();
};

func void CH_Training_Combat_CROSSBOW_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,10,100);
	DIA_CH_Kampf_Armbrust_Info();
};

func void CH_Training_Combat_CROSSBOW_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,20,100);
	DIA_CH_Kampf_Armbrust_Info();
};


instance DIA_CH_Dieb_Start(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Dieb_Start_Condition;
	information = DIA_CH_Dieb_Start_Info;
	permanent = TRUE;
	description = "��������� ������";
};


func int DIA_CH_Dieb_Start_Condition()
{
	if((GuildStart == FALSE) && (KampfStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (LevelStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Dieb_Start_Info()
{
	Info_ClearChoices(DIA_CH_Dieb_Start);
	Info_AddChoice(DIA_CH_Dieb_Start,Dialog_Back,DIA_CH_Dieb_Start_BACK);
	if(!Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET))
	{
		Info_AddChoice(DIA_CH_Dieb_Start,B_BuildLearnString(NAME_Skill_PickPocket,B_GetLearnCostTalent(other,NPC_TALENT_PICKPOCKET,1)),CH_Training_Thief_Pickpocket);
	};
	if(!Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		Info_AddChoice(DIA_CH_Dieb_Start,B_BuildLearnString(NAME_Skill_PickLock,B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1)),CH_Training_Thief_Picklock);
	};
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		Info_AddChoice(DIA_CH_Dieb_Start,B_BuildLearnString(NAME_Skill_Sneak,B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),CH_Training_Thief_Sneak);
	};
	if(!Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT))
	{
		Info_AddChoice(DIA_CH_Dieb_Start,B_BuildLearnString(NAME_Skill_Acrobat,B_GetLearnCostTalent(other,NPC_TALENT_ACROBAT,1)),CH_Training_Thief_Acrobat);
	};
};

func void DIA_CH_Dieb_Start_BACK()
{
	Info_ClearChoices(DIA_CH_Dieb_Start);
};

func void CH_Training_Thief_Pickpocket()
{
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET);
};

func void CH_Training_Thief_Picklock()
{
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK);
};

func void CH_Training_Thief_Sneak()
{
	B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK);
};

func void CH_Training_Thief_Acrobat()
{
	B_TeachThiefTalent(self,other,NPC_TALENT_ACROBAT);
};


var int MiscStart;

instance DIA_CH_Misc_Start(C_Info)
{
	npc = ch;
	nr = 20;
	condition = DIA_CH_Misc_Start_Condition;
	information = DIA_CH_Misc_Start_Info;
	permanent = TRUE;
	description = "������ ������";
};


func int DIA_CH_Misc_Start_Condition()
{
	if((GuildStart == FALSE) && (KampfStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (LevelStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Start_Info()
{
	MiscStart = TRUE;
};


instance DIA_CH_Misc_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_Misc_Stopper_Condition;
	information = DIA_CH_Misc_Stopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_Misc_Stopper_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Stopper_Info()
{
	MiscStart = FALSE;
};


var int AlchemyStart;

instance DIA_CH_Misc_Alchemie(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_Misc_Alchemie_Condition;
	information = DIA_CH_Misc_Alchemie_Info;
	permanent = TRUE;
	description = NAME_Skill_Alchemy;
};


func int DIA_CH_Misc_Alchemie_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Alchemie_Info()
{
	AlchemyStart = TRUE;
};


instance DIA_CH_Misc_Alchemie_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_Misc_Alchemie_Stopper_Condition;
	information = DIA_CH_Misc_Alchemie_Stopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_Misc_Alchemie_Stopper_Condition()
{
	if(AlchemyStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Alchemie_Stopper_Info()
{
	AlchemyStart = FALSE;
};


instance DIA_CH_Misc_Health(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_Misc_Health_Condition;
	information = DIA_CH_Misc_Health_Info;
	permanent = TRUE;
	description = "�������� �����";
};


func int DIA_CH_Misc_Health_Condition()
{
	if(AlchemyStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Health_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Health);
	Info_AddChoice(DIA_CH_Misc_Health,Dialog_Back,DIA_CH_Misc_Health_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_04] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Health,B_BuildLearnString(NAME_HP_Full,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_04)),CH_Training_Alchemy_POTION_Health_04);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Health,B_BuildLearnString(NAME_HP_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),CH_Training_Alchemy_POTION_Health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Health,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),CH_Training_Alchemy_POTION_Health_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Health,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),CH_Training_Alchemy_POTION_Health_01);
	};
};

func void DIA_CH_Misc_Health_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Health);
};

func void CH_Training_Alchemy_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void CH_Training_Alchemy_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void CH_Training_Alchemy_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void CH_Training_Alchemy_POTION_Health_04()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_04);
};


instance DIA_CH_Misc_Mana(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Misc_Mana_Condition;
	information = DIA_CH_Misc_Mana_Info;
	permanent = TRUE;
	description = "����� ����";
};


func int DIA_CH_Misc_Mana_Condition()
{
	if(AlchemyStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Mana_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Mana);
	Info_AddChoice(DIA_CH_Misc_Mana,Dialog_Back,DIA_CH_Misc_Mana_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Mana,B_BuildLearnString(NAME_Mana_Full,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_04)),CH_Training_Alchemy_POTION_Mana_04);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Mana,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),CH_Training_Alchemy_POTION_Mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Mana,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),CH_Training_Alchemy_POTION_Mana_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Mana,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),CH_Training_Alchemy_POTION_Mana_01);
	};
};

func void DIA_CH_Misc_Mana_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Mana);
};

func void CH_Training_Alchemy_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void CH_Training_Alchemy_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void CH_Training_Alchemy_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void CH_Training_Alchemy_POTION_Mana_04()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_04);
};


instance DIA_CH_Misc_Special(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Misc_Special_Condition;
	information = DIA_CH_Misc_Special_Info;
	permanent = TRUE;
	description = "������ �����";
};


func int DIA_CH_Misc_Special_Condition()
{
	if(AlchemyStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Special_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Special);
	Info_AddChoice(DIA_CH_Misc_Special,Dialog_Back,DIA_CH_Misc_Special_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Special,B_BuildLearnString(NAME_MegaDrink,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_MegaDrink)),CH_Training_Alchemy_POTION_MegaDrink);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Special,B_BuildLearnString(NAME_Speed_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),CH_Training_Alchemy_POTION_Speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Special,B_BuildLearnString(NAME_STR_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),CH_Training_Alchemy_POTION_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Special,B_BuildLearnString(NAME_DEX_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),CH_Training_Alchemy_POTION_Perm_DEX);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Special,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),CH_Training_Alchemy_POTION_Perm_Mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Special,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),CH_Training_Alchemy_POTION_Perm_Health);
	};
};

func void DIA_CH_Misc_Special_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Special);
};

func void CH_Training_Alchemy_POTION_MegaDrink()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_MegaDrink);
};

func void CH_Training_Alchemy_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void CH_Training_Alchemy_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void CH_Training_Alchemy_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void CH_Training_Alchemy_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void CH_Training_Alchemy_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};


var int SmithStart;

instance DIA_CH_Misc_SmithStart(C_Info)
{
	npc = ch;
	nr = 10;
	condition = DIA_CH_Misc_SmithStart_Condition;
	information = DIA_CH_Misc_SmithStart_Info;
	permanent = TRUE;
	description = NAME_Skill_Smith;
};


func int DIA_CH_Misc_SmithStart_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_SmithStart_Info()
{
	SmithStart = TRUE;
};


instance DIA_CH_Misc_SmithStopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_Misc_SmithStopper_Condition;
	information = DIA_CH_Misc_SmithStopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_Misc_SmithStopper_Condition()
{
	if(SmithStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_SmithStopper_Info()
{
	SmithStart = FALSE;
};


instance DIA_CH_Misc_Smithniedrig(C_Info)
{
	npc = ch;
	nr = 8;
	condition = DIA_CH_Misc_Smithniedrig_Condition;
	information = DIA_CH_Misc_Smithniedrig_Info;
	permanent = TRUE;
	description = "������� ������";
};


func int DIA_CH_Misc_Smithniedrig_Condition()
{
	if(SmithStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Smithniedrig_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Smithniedrig);
	Info_AddChoice(DIA_CH_Misc_Smithniedrig,Dialog_Back,DIA_CH_Misc_Smithniedrig_BACK);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Smithniedrig,B_BuildLearnString(NAME_ItMw_1H_Common_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),CH_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Smithniedrig,B_BuildLearnString(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),CH_Training_Smith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Smithniedrig,B_BuildLearnString(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),CH_Training_Smith_Harad02);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Smithniedrig,B_BuildLearnString(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),CH_Training_Smith_Harad03);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Smithniedrig,B_BuildLearnString(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),CH_Training_Smith_Harad04);
	};
};


instance DIA_CH_Misc_SmithHoch(C_Info)
{
	npc = ch;
	nr = 9;
	condition = DIA_CH_Misc_SmithHoch_Condition;
	information = DIA_CH_Misc_SmithHoch_Info;
	permanent = TRUE;
	description = "������ ������";
};


func int DIA_CH_Misc_SmithHoch_Condition()
{
	if(SmithStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_SmithHoch_Info()
{
	Info_ClearChoices(DIA_CH_Misc_SmithHoch);
	Info_AddChoice(DIA_CH_Misc_SmithHoch,Dialog_Back,DIA_CH_Misc_SmithHoch_BACK);
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),CH_Training_Smith_1hSpecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),CH_Training_Smith_2hSpecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),CH_Training_Smith_1hSpecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),CH_Training_Smith_2hSpecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),CH_Training_Smith_1hSpecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),CH_Training_Smith_2hSpecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),CH_Training_Smith_1hSpecial4);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_SmithHoch,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),CH_Training_Smith_2hSpecial4);
	};
};


func void DIA_CH_Misc_Smithniedrig_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Smithniedrig);
};

func void DIA_CH_Misc_SmithHoch_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_SmithHoch);
};

func void CH_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void CH_Training_Smith_Harad01()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01);
};

func void CH_Training_Smith_Harad02()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02);
};

func void CH_Training_Smith_Harad03()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03);
};

func void CH_Training_Smith_Harad04()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04);
};

func void CH_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void CH_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void CH_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void CH_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void CH_Training_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void CH_Training_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void CH_Training_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void CH_Training_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


var int AnimalStart;

instance DIA_CH_Misc_Animal_Start(C_Info)
{
	npc = ch;
	nr = 20;
	condition = DIA_CH_Misc_Animal_Start_Condition;
	information = DIA_CH_Misc_Animal_Start_Info;
	permanent = TRUE;
	description = "������ ��������";
};


func int DIA_CH_Misc_Animal_Start_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Animal_Start_Info()
{
	AnimalStart = TRUE;
};


instance DIA_CH_Misc_Animal_Stopper(C_Info)
{
	npc = ch;
	nr = 99;
	condition = DIA_CH_Misc_Animal_Stopper_Condition;
	information = DIA_CH_Misc_Animal_Stopper_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_CH_Misc_Animal_Stopper_Condition()
{
	if(AnimalStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Animal_Stopper_Info()
{
	AnimalStart = FALSE;
};


instance DIA_CH_Misc_Animal_allg(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_Misc_Animal_allg_Condition;
	information = DIA_CH_Misc_Animal_allg_Info;
	permanent = TRUE;
	description = "����, �����, ����, �����, ������";
};


func int DIA_CH_Misc_Animal_allg_Condition()
{
	if(AnimalStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Animal_allg_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Animal_allg);
	Info_AddChoice(DIA_CH_Misc_Animal_allg,Dialog_Back,DIA_CH_Misc_Animal_allg_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_allg,B_BuildLearnString(NAME_TROPHY_Teeth,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),CH_Training_TROPHYS_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_allg,B_BuildLearnString(NAME_TROPHY_Claws,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),CH_Training_TROPHYS_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_allg,B_BuildLearnString(NAME_TROPHY_Fur,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_Fur)),CH_Training_TROPHYS_Fur);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_allg,B_BuildLearnString(NAME_TROPHY_ReptileSkin,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_ReptileSkin)),CH_Training_TROPHYS_ReptileSkin);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_allg,B_BuildLearnString(NAME_TROPHY_Heart,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),CH_Training_TROPHYS_Heart);
	};
};

func void DIA_CH_Misc_Animal_allg_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Animal_allg);
};

func void CH_Training_TROPHYS_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void CH_Training_TROPHYS_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void CH_Training_TROPHYS_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur);
};

func void CH_Training_TROPHYS_ReptileSkin()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin);
};

func void CH_Training_TROPHYS_Heart()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart);
};


instance DIA_CH_Misc_Animal_Speziell(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Misc_Animal_Speziell_Condition;
	information = DIA_CH_Misc_Animal_Speziell_Info;
	permanent = TRUE;
	description = "������, ����, ���������, �������";
};


func int DIA_CH_Misc_Animal_Speziell_Condition()
{
	if(AnimalStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Animal_Speziell_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Animal_Speziell);
	Info_AddChoice(DIA_CH_Misc_Animal_Speziell,Dialog_Back,DIA_CH_Misc_Animal_Speziell_BACK);
	if(Knows_Bloodfly == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_Speziell,B_BuildLearnString(NAME_TROPHY_BFPoison,1),CH_Training_TROPHYS_BFGift);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_Speziell,B_BuildLearnString(NAME_TROPHY_BFSting,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),CH_Training_TROPHYS_BFSting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_Speziell,B_BuildLearnString(NAME_TROPHY_BFWing,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),CH_Training_TROPHYS_BFWing);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_Speziell,B_BuildLearnString(NAME_TROPHY_Mandibles,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),CH_Training_TROPHYS_Mandibles);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_Speziell,B_BuildLearnString(NAME_TROPHY_CrawlerPlate,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),CH_Training_TROPHYS_CrawlerPlate);
	};
};

func void DIA_CH_Misc_Animal_Speziell_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Animal_Speziell);
};

func void CH_Training_TROPHYS_BFGift()
{
	if(other.lp >= 1)
	{
		other.lp -= 1;
		Knows_Bloodfly = TRUE;
		PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_Screen,2);
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,PRINT_KnowsBloodfly);
	}
	else
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
	};
};

func void CH_Training_TROPHYS_BFSting()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting);
};

func void CH_Training_TROPHYS_BFWing()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing);
};

func void CH_Training_TROPHYS_CrawlerPlate()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate);
};

func void CH_Training_TROPHYS_Mandibles()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles);
};


instance DIA_CH_Misc_Animal_other(C_Info)
{
	npc = ch;
	nr = 7;
	condition = DIA_CH_Misc_Animal_other_Condition;
	information = DIA_CH_Misc_Animal_other_Info;
	permanent = TRUE;
	description = "�����, �����, ����, ����";
};


func int DIA_CH_Misc_Animal_other_Condition()
{
	if(AnimalStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Animal_other_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Animal_other);
	Info_AddChoice(DIA_CH_Misc_Animal_other,Dialog_Back,DIA_CH_Misc_Animal_other_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_other,B_BuildLearnString(NAME_TROPHY_ShadowHorn,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),CH_Training_TROPHYS_ShadowHorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_other,B_BuildLearnString(NAME_TROPHY_FireTongue,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),CH_Training_TROPHYS_FireTongue);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_other,B_BuildLearnString(NAME_TROPHY_DrgSnapperHorn,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),CH_Training_TROPHYS_DrgSnapperHorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_other,B_BuildLearnString(NAME_TROPHY_DragonScale,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),CH_Training_TROPHYS_DragonScale);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Animal_other,B_BuildLearnString(NAME_TROPHY_DragonBlood,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),CH_Training_TROPHYS_DragonBlood);
	};
};

func void DIA_CH_Misc_Animal_other_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Animal_other);
};

func void CH_Training_TROPHYS_ShadowHorn()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn);
};

func void CH_Training_TROPHYS_FireTongue()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue);
};

func void CH_Training_TROPHYS_DrgSnapperHorn()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn);
};

func void CH_Training_TROPHYS_DragonScale()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale);
};

func void CH_Training_TROPHYS_DragonBlood()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood);
};


instance CH_Language(C_Info)
{
	npc = ch;
	nr = 30;
	condition = CH_Language_Condition;
	information = CH_Language_Info;
	important = FALSE;
	permanent = TRUE;
	description = "����� ������";
};


func int CH_Language_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
};

func void CH_Language_Info()
{
	Info_ClearChoices(CH_Language);
	Info_AddChoice(CH_Language,Dialog_Back,CH_Language_BACK);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(CH_Language,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),CH_Language_Peasant);
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		Info_AddChoice(CH_Language,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),CH_Language_Warrior);
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		Info_AddChoice(CH_Language,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),CH_Language_Priest);
	};
};

func void CH_Language_BACK()
{
	Info_ClearChoices(CH_Language);
};

func void CH_Language_Peasant()
{
	B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1);
	CH_Language_Info();
};

func void CH_Language_Warrior()
{
	B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2);
	CH_Language_Info();
};

func void CH_Language_Priest()
{
	B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3);
	CH_Language_Info();
};

instance DIA_CH_Misc_InnosEye(C_Info)
{
	npc = ch;
	nr = 40;
	condition = DIA_CH_Misc_InnosEye_Condition;
	information = DIA_CH_Misc_InnosEye_Info;
	permanent = TRUE;
	description = "����������� ����� ������";
};


func int DIA_CH_Misc_InnosEye_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE) && (PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_InnosEye_Info()
{
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
};


instance DIA_CH_Misc_Gold(C_Info)
{
	npc = ch;
	nr = 50;
	condition = DIA_CH_Misc_Gold_Condition;
	information = DIA_CH_Misc_Gold_Info;
	permanent = TRUE;
	description = "������ ������";
};


func int DIA_CH_Misc_Gold_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE) && (Hero_HackChance < 100))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Gold_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Gold);
	Info_AddChoice(DIA_CH_Misc_Gold,Dialog_Back,DIA_CH_Misc_Gold_BACK);
	if(Hero_HackChance <= 80)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"����� ������ + 20",DIA_CH_Misc_Gold_20);
	};
	if(Hero_HackChance <= 90)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"����� ������ + 10",DIA_CH_Misc_Gold_10);
	};
	if(Hero_HackChance <= 95)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"����� ������ + 5",DIA_CH_Misc_Gold_5);
	};
	if(Hero_HackChance < 100)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"����� ������ + 1",DIA_CH_Misc_Gold_1);
	};
};

func void DIA_CH_Misc_Gold_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Gold);
};

func void DIA_CH_Misc_Gold_20()
{
	B_Upgrade_Hero_HackChance(20);
	DIA_CH_Misc_Gold_Info();
};

func void DIA_CH_Misc_Gold_10()
{
	B_Upgrade_Hero_HackChance(10);
	DIA_CH_Misc_Gold_Info();
};

func void DIA_CH_Misc_Gold_5()
{
	B_Upgrade_Hero_HackChance(5);
	DIA_CH_Misc_Gold_Info();
};

func void DIA_CH_Misc_Gold_1()
{
	B_Upgrade_Hero_HackChance(1);
	DIA_CH_Misc_Gold_Info();
};

instance DIA_CH_Misc_Wisp(C_Info)
{
	npc = ch;
	nr = 60;
	condition = DIA_CH_Misc_Wisp_Condition;
	information = DIA_CH_Misc_Wisp_Info;
	permanent = TRUE;
	description = "����������� ������� �������";
};


func int DIA_CH_Misc_Wisp_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CH_Misc_Wisp_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Wisp);
	Info_AddChoice(DIA_CH_Misc_Wisp,Dialog_Back,DIA_CH_Misc_Wisp_BACK);
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Wisp,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_CH_Misc_Wisp_WISPSKILL_FF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Wisp,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_CH_Misc_Wisp_WISPSKILL_NONE);
	};
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
	{
		Info_AddChoice(DIA_CH_Misc_Wisp,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_CH_Misc_Wisp_WISPSKILL_RUNE);
	};
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
	{
		Info_AddChoice(DIA_CH_Misc_Wisp,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_CH_Misc_Wisp_WISPSKILL_MAGIC);
	};
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
	{
		Info_AddChoice(DIA_CH_Misc_Wisp,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_CH_Misc_Wisp_WISPSKILL_FOOD);
	};
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
	{
		Info_AddChoice(DIA_CH_Misc_Wisp,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_CH_Misc_Wisp_WISPSKILL_POTIONS);
	};
};

func void DIA_CH_Misc_Wisp_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Wisp);
};

func void DIA_CH_Misc_Wisp_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
	};
	DIA_CH_Misc_Wisp_Info();
};

func void DIA_CH_Misc_Wisp_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
	};
	DIA_CH_Misc_Wisp_Info();
};

func void DIA_CH_Misc_Wisp_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
	};
	DIA_CH_Misc_Wisp_Info();
};

func void DIA_CH_Misc_Wisp_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
	};
	DIA_CH_Misc_Wisp_Info();
};

func void DIA_CH_Misc_Wisp_WISPSKILL_FOOD()
{
	B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD);
	DIA_CH_Misc_Wisp_Info();
};

func void DIA_CH_Misc_Wisp_WISPSKILL_POTIONS()
{
	B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS);
	DIA_CH_Misc_Wisp_Info();
};

func string B_BuildCurrentRegenerateValue(var int stats)
{
	var string concatText;
	var int cost;
	var int next;
	cost = B_GetLearnCostAttribute(stats,1);
	if(stats == ATR_REGENERATEMANA)
	{
		next = ATR_Training[ATR_REGENERATEMANA] - 1;
		concatText = "����������� ���� (1 ��. � ";
	}
	else if(stats == ATR_REGENERATEHP)
	{
		next = ATR_Training[ATR_REGENERATEHP] - 1;
		concatText = "����������� �������� (1 ��. � ";
	};
	if(next < 0)
	{
		next = 30;
	};
	concatText = ConcatStrings(concatText,IntToString(next));
	concatText = ConcatStrings(concatText," ������, ");
	concatText = ConcatStrings(concatText,IntToString(cost));
	if(cost >= 5)
	{
		concatText = ConcatStrings(concatText,PRINT_LP);
	}
	else if(cost > 1)
	{
		concatText = ConcatStrings(concatText,PRINT_2LP);
	}
	else
	{
		concatText = ConcatStrings(concatText,PRINT_1LP);
	};
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

instance DIA_CH_Misc_Regenerate(C_Info)
{
	npc = ch;
	nr = 70;
	condition = DIA_CH_Misc_Regenerate_Condition;
	information = DIA_CH_Misc_Regenerate_Info;
	permanent = TRUE;
	description = "�����������";
};


func int DIA_CH_Misc_Regenerate_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		if(ATR_Training[ATR_REGENERATEMANA] != 1)
		{
			return TRUE;
		};
		if(ATR_Training[ATR_REGENERATEHP] != 1)
		{
			return TRUE;
		};
	};
};

func void DIA_CH_Misc_Regenerate_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Regenerate);
	Info_AddChoice(DIA_CH_Misc_Regenerate,Dialog_Back,DIA_CH_Misc_Regenerate_BACK);
	if(ATR_Training[ATR_REGENERATEMANA] != 1)
	{
		Info_AddChoice(DIA_CH_Misc_Regenerate,B_BuildCurrentRegenerateValue(ATR_REGENERATEMANA),DIA_CH_Misc_Regenerate_Mana);
	};
	if(ATR_Training[ATR_REGENERATEHP] != 1)
	{
		Info_AddChoice(DIA_CH_Misc_Regenerate,B_BuildCurrentRegenerateValue(ATR_REGENERATEHP),DIA_CH_Misc_Regenerate_HP);
	};
};

func void DIA_CH_Misc_Regenerate_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Regenerate);
};

func void DIA_CH_Misc_Regenerate_Mana()
{
	var int cost;
	cost = B_GetLearnCostAttribute(ATR_REGENERATEMANA,1);
	if(other.lp >= cost)
	{
		other.lp -= cost;
		B_RaiseAttributeByTraining(other,ATR_REGENERATEMANA,1);
	}
	else
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
	};
	DIA_CH_Misc_Regenerate_Info();
};

func void DIA_CH_Misc_Regenerate_HP()
{
	var int cost;
	cost = B_GetLearnCostAttribute(ATR_REGENERATEHP,1);
	if(other.lp >= cost)
	{
		other.lp -= cost;
		B_RaiseAttributeByTraining(other,ATR_REGENERATEHP,1);
	}
	else
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
	};
	DIA_CH_Misc_Regenerate_Info();
};

instance CH_Overlay(C_Info)
{
	npc = ch;
	nr = 36;
	condition = CH_Overlay_Condition;
	information = CH_Overlay_Info;
	permanent = TRUE;
	description = "�������� �������";
};


func int CH_Overlay_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Overlay_Info()
{
	Info_ClearChoices(CH_Overlay);
	Info_AddChoice(CH_Overlay,Dialog_Back,CH_Overlay_BACK);
	Info_AddChoice(CH_Overlay,"�������",CH_Overlay_Babe);
	Info_AddChoice(CH_Overlay,"���",CH_Overlay_Mage);
	Info_AddChoice(CH_Overlay,"������",CH_Overlay_Militia);
	Info_AddChoice(CH_Overlay,"����������",CH_Overlay_Flee);
	Info_AddChoice(CH_Overlay,"������",CH_Overlay_Arrogance);
	Info_AddChoice(CH_Overlay,"���������",CH_Overlay_Relaxed);
	Info_AddChoice(CH_Overlay,"��������",CH_Overlay_Tired);
	Info_AddChoice(CH_Overlay,"������",CH_Overlay_Drunken);
	Info_AddChoice(CH_Overlay,"��������",CH_Overlay_Sprint);
	Info_AddChoice(CH_Overlay,"��������",CH_Overlay_Clear);
};

func void CH_Overlay_BACK()
{
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Babe()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Babe.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Mage()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Mage.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Militia()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Militia.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Flee()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Flee.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Arrogance()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Arrogance.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Relaxed()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Relaxed.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Tired()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Tired.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Drunken()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Drunken.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Sprint()
{
	B_ClearHeroOverlays();
	Mdl_ApplyOverlayMds(other,"Humans_Sprint.mds");
	Info_ClearChoices(CH_Overlay);
};

func void CH_Overlay_Clear()
{
	B_ClearHeroOverlays();
	Info_ClearChoices(CH_Overlay);
};

instance CH_Skin(C_Info)
{
	npc = ch;
	nr = 37;
	condition = CH_Skin_Condition;
	information = CH_Skin_Info;
	permanent = TRUE;
	description = "�������� ���������";
};


func int CH_Skin_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Skin_Info()
{
	Info_ClearChoices(CH_Skin);
	Info_AddChoice(CH_Skin,Dialog_Back,CH_Skin_BACK);
	Info_AddChoice(CH_Skin,B_BuildOptionString("��� ������",NakedBodySkin,TRUE),CH_Skin_Naked);
	Info_AddChoice(CH_Skin,B_BuildOptionString("����������",TattoosBodySkin,TRUE),CH_Skin_Tattoos);
	Info_AddChoice(CH_Skin,B_BuildOptionString("������",SequelBodySkin,TRUE),CH_Skin_Sequel);
	Info_AddChoice(CH_Skin,B_BuildOptionString("������ 2",G2BodySkin,TRUE),CH_Skin_G2);
	Info_AddChoice(CH_Skin,B_BuildOptionString("������ 1",G1BodySkin,TRUE),CH_Skin_G1);
};

func void CH_Skin_BACK()
{
	Info_ClearChoices(CH_Skin);
};

func void CH_Skin_G1()
{
	B_ResetHeroSkin();
	G1BodySkin = TRUE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_G2()
{
	B_ResetHeroSkin();
	G2BodySkin = TRUE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_Sequel()
{
	B_ResetHeroSkin();
	SequelBodySkin = TRUE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_Tattoos()
{
	B_ResetHeroSkin();
	TattoosBodySkin = TRUE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_Naked()
{
	B_ResetHeroSkin();
	NakedBodySkin = TRUE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void B_SetHeroEquipment()
{
	B_RefreshInvItemToAmount(hero,ItRw_Arrow,100);
	B_RefreshInvItemToAmount(hero,ItRw_Bolt,100);
	B_RefreshInvItemToAmount(hero,ItLsTorch,20);
	B_RefreshInvItemToAmount(hero,ItMi_Gold,500);
	B_RefreshInvItemToAmount(hero,ItPo_Health_03,10);
	B_RefreshInvItemToAmount(hero,ItPo_Mana_03,10);
	B_RefreshInvItemToAmount(hero,ItKe_Lockpick,30);
};

instance CH_Equipment(C_Info)
{
	npc = ch;
	nr = 38;
	condition = CH_Equipment_Condition;
	information = CH_Equipment_Info;
	permanent = TRUE;
	description = "�������� ����������";
};


func int CH_Equipment_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Equipment_Info()
{
	B_SetHeroEquipment();
	PrintScreen("���������� ���������",-1,-1,FONT_Screen,3);
};


instance CH_StatsBook(C_Info)
{
	npc = ch;
	nr = 39;
	condition = CH_StatsBook_Condition;
	information = CH_StatsBook_Info;
	permanent = TRUE;
	description = "�������� ����� ����������";
};


func int CH_StatsBook_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (MiscStart == FALSE))
	{
		if(!Npc_HasItems(other,StatsBook))
		{
			return TRUE;
		};
	};
};

func void CH_StatsBook_Info()
{
	B_GiveInvItems(self,other,StatsBook,1);
};

