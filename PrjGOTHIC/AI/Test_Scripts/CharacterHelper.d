
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
	text[0] = "Мешок наполнен новым оружием!";
};


func void Use_Sack()
{
	Snd_Play("Geldbeutel");
	Print("Найдено много разного нового оружия!");
	CreateInvItems(self,ItMW_Addon_Knife01,1);
	CreateInvItems(self,ItMW_Addon_Stab01,1);
	CreateInvItems(self,ItMW_Addon_Stab02,1);
	CreateInvItems(self,ItMW_Addon_Stab03,1);
	CreateInvItems(self,ItMW_Addon_Stab04,1);
	CreateInvItems(self,ItMW_Addon_Stab05,1);
	CreateInvItems(self,ItMW_Addon_Hacker_1h_01,1);
	CreateInvItems(self,ItMW_Addon_Hacker_2h_01,1);
	CreateInvItems(self,ItMW_Addon_Hacker_2h_02,1);
	CreateInvItems(self,ItMW_Addon_Hacker_1h_02,1);
	CreateInvItems(self,ItMW_Addon_Keule_1h_01,1);
	CreateInvItems(self,ItMW_Addon_Keule_2h_01,1);
};


instance ItFo_TestTrigger(C_Item)
{
	name = "Триггер мира аддона";
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
	enter_addonworld_firsttime_trigger_func();
};*/


instance CH(Npc_Default)
{
	name[0] = "Помощник по персонажу";
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
	hero.exp_next = XP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = 40;
	hero.attribute[ATR_HITPOINTS] = 40;
	hero.lp = 0;
	if(levels > 0)
	{
		B_LevelUp(levels);
	};
	hero.exp = B_GetCurrentLevelExp(hero);
	PrintScreen(ConcatStrings("Макс. здоровье: ",IntToString(hero.attribute[ATR_HITPOINTS_MAX])),-1,55,FONT_Screen,2);
	PrintScreen(ConcatStrings("Очки обучения: ",IntToString(hero.lp)),-1,60,FONT_Screen,2);
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
	if(!Npc_HasItems(hero,ItRu_PalLightHeal))
	{
		CreateInvItem(hero,ItRu_PalLightHeal);
	};
	if(!Npc_HasItems(hero,ItRu_PalHolyBolt))
	{
		CreateInvItem(hero,ItRu_PalHolyBolt);
	};
	if(!Npc_HasItems(hero,ItRu_PalMediumHeal))
	{
		CreateInvItem(hero,ItRu_PalMediumHeal);
	};
	if(!Npc_HasItems(hero,ItRu_PalRepelEvil))
	{
		CreateInvItem(hero,ItRu_PalRepelEvil);
	};
	if(!Npc_HasItems(hero,ItRu_PalFullHeal))
	{
		CreateInvItem(hero,ItRu_PalFullHeal);
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

func void B_ClearHeroOverlays()
{
	Mdl_RemoveOverlayMDS(hero,"Humans_Arrogance.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Babe.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Mage.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Relaxed.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Tired.mds");
	Mdl_RemoveOverlayMDS(hero,"Humans_Drunken.mds");
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
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Полный сброс";
};


func int CH_RESET_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_RESET_Info()
{
	AI_UnequipWeapons(hero);
	Info_ClearChoices(CH_RESET);
	Info_AddChoice(CH_RESET,Dialog_Back,CH_RESET_Back);
	Info_AddChoice(CH_RESET,"Продолжить",CH_RESET_Ok);
};

func void CH_RESET_Back()
{
	Info_ClearChoices(CH_RESET);
};

func void CH_RESET_Ok()
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
	B_UnEquipHeroItem(ItAm_Addon_MANA);
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
	B_UnEquipHeroItem(ItRi_Addon_MANA_01);
	B_UnEquipHeroItem(ItRi_Addon_MANA_02);
	B_UnEquipHeroItem(ItRi_Addon_STR_01);
	B_UnEquipHeroItem(ItRi_Addon_STR_02);
	B_UnEquipHeroItem(ItRi_HP_01_Tengron);
	B_UnEquipHeroItem(ItRi_OrcEliteRing);
	B_UnEquipHeroItem(ItAm_Mana_Angar_MIS);
	AI_UnequipArmor(hero);
	B_SetGuild(hero,GIL_NONE);
	hero.lp = 0;
	hero.level = 0;
	hero.exp = 0;
	hero.exp_next = XP_PER_LEVEL;
	hero.attribute[ATR_STRENGTH] = 10;
	hero.aivar[REAL_STRENGTH] = 10;
	hero.attribute[ATR_DEXTERITY] = 10;
	hero.aivar[REAL_DEXTERITY] = 10;
	hero.attribute[ATR_MANA_MAX] = 10;
	hero.attribute[ATR_MANA] = 10;
	hero.aivar[REAL_MANA_MAX] = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 40;
	hero.attribute[ATR_HITPOINTS] = 40;
	hero.HitChance[NPC_TALENT_1H] = 10;
	hero.HitChance[NPC_TALENT_2H] = 10;
	hero.HitChance[NPC_TALENT_BOW] = 10;
	hero.HitChance[NPC_TALENT_CROSSBOW] = 10;
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
	G1BodySkin = FALSE;
	SequelBodySkin = FALSE;
	TattoosBodySkin = FALSE;
	NakedBodySkin = FALSE;
	B_SetHeroSkin();
	B_ClearHeroOverlays();
	B_ResetTalentSystem();
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
	PrintScreen("Восстановлен исходный PC_Hero",-1,-1,FONT_Screen,2);
	Info_ClearChoices(CH_RESET);
//	Npc_SetTalentSkill(hero,NPC_TALENT_1H,0);
//	hero.aivar[REAL_TALENT_1H] = 10;
//	Npc_SetTalentSkill(hero,NPC_TALENT_2H,0);
//	hero.aivar[REAL_TALENT_2H] = 10;
//	Npc_SetTalentSkill(hero,NPC_TALENT_BOW,0);
//	hero.aivar[REAL_TALENT_BOW] = 10;
//	Npc_SetTalentSkill(hero,NPC_TALENT_CROSSBOW,0);
//	hero.aivar[REAL_TALENT_CROSSBOW] = 10;
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,0);
//	Npc_SetTalentSkill(hero,NPC_TALENT_D,0);
//	Npc_SetTalentSkill(hero,NPC_TALENT_E,0);
};

var int GuildStart;

instance CH_Guild_Start(C_Info)
{
	npc = ch;
	condition = CH_Guild_Start_Condition;
	information = CH_Guild_Start_Info;
	description = "Гильдия и ремесло";
	permanent = TRUE;
};


func int CH_Guild_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Выбор гильдии";
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
	Info_AddChoice(CH_Guild,"Нет гильдии",ch_none);
	Info_AddChoice(CH_Guild,"Псевдопират",ch_pir);
	Info_AddChoice(CH_Guild,"Псевдобандит",ch_bdt);
	Info_AddChoice(CH_Guild,"Охотник на драконов",ch_djg);
	Info_AddChoice(CH_Guild,"Наемник",ch_sld);
	Info_AddChoice(CH_Guild,"Паладин",ch_pal);
	Info_AddChoice(CH_Guild,"Ополченец",ch_mil);
	Info_AddChoice(CH_Guild,"Маг Огня",ch_kdf);
	Info_AddChoice(CH_Guild,"Послушник",ch_nov);
};

func void CH_Guild_BACK()
{
	Info_ClearChoices(CH_Guild);
};

func void ch_pir()
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

func void ch_bdt()
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

func void ch_nov()
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

func void ch_kdf()
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

func void ch_sld()
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

func void ch_djg()
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

func void ch_mil()
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

func void ch_pal()
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

func void ch_none()
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
	description = "Выбор ремесла";
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
		Info_AddChoice(CH_Apprentice,"Сброс",ch_apprentice_none);
	};
	if(Player_IsApprentice == APP_Bosper)
	{
		Info_AddChoice(CH_Apprentice,ConcatStrings(NAME_TROPHY_Fur,": Боспер (используется)"),ch_apprentice_bosper);
	}
	else
	{
		Info_AddChoice(CH_Apprentice,ConcatStrings(NAME_TROPHY_Fur,": Боспер"),ch_apprentice_bosper);
	};
	if(Player_IsApprentice == APP_Harad)
	{
		Info_AddChoice(CH_Apprentice,ConcatStrings(NAME_Skill_Smith,": Гарад (используется)"),ch_apprentice_harad);
	}
	else
	{
		Info_AddChoice(CH_Apprentice,ConcatStrings(NAME_Skill_Smith,": Гарад"),ch_apprentice_harad);
	};
	if(Player_IsApprentice == APP_Constantino)
	{
		Info_AddChoice(CH_Apprentice,ConcatStrings(NAME_Skill_Alchemy,": Константино (используется)"),ch_apprentice_constantino);
	}
	else
	{
		Info_AddChoice(CH_Apprentice,ConcatStrings(NAME_Skill_Alchemy,": Константино"),ch_apprentice_constantino);
	};
};

func void CH_Apprentice_BACK()
{
	Info_ClearChoices(CH_Apprentice);
};

func void ch_apprentice_bosper()
{
	Player_IsApprentice = APP_Bosper;
	PrintScreen("Мастер: Боспер",-1,-1,FONT_Screen,3);
	MIS_Apprentice = LOG_SUCCESS;
	B_CheckLog();
	CH_Apprentice_Info();
};

func void ch_apprentice_harad()
{
	Player_IsApprentice = APP_Harad;
	PrintScreen("Мастер: Гарад",-1,-1,FONT_Screen,3);
	MIS_Apprentice = LOG_SUCCESS;
	B_CheckLog();
	CH_Apprentice_Info();
};

func void ch_apprentice_constantino()
{
	Player_IsApprentice = APP_Constantino;
	PrintScreen("Мастер: Константино",-1,-1,FONT_Screen,3);
	MIS_Apprentice = LOG_SUCCESS;
	B_CheckLog();
	CH_Apprentice_Info();
};

func void ch_apprentice_none()
{
	Player_IsApprentice = APP_NONE;
	PrintScreen("Мастер сброшен",-1,-1,FONT_Screen,3);
	CH_Apprentice_Info();
};


var int LevelStart;

instance CH_Level_Start(C_Info)
{
	npc = ch;
	condition = CH_Level_Start_Condition;
	information = CH_Level_Start_Info;
	description = "Уровень и очки обучения";
	permanent = TRUE;
};


func int CH_Level_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Очки обучения";
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
		Info_AddChoice(CH_Lernpunkte,"Обнулить",CH_Lernpunkte_0);
	};
	Info_AddChoice(CH_Lernpunkte,"Очки обучения + 50",CH_Lernpunkte_50);
	Info_AddChoice(CH_Lernpunkte,"Очки обучения + 25",CH_Lernpunkte_25);
	Info_AddChoice(CH_Lernpunkte,"Очки обучения + 10",CH_Lernpunkte_10);
	Info_AddChoice(CH_Lernpunkte,"Очки обучения + 5",CH_Lernpunkte_5);
};

func void CH_Lernpunkte_BACK()
{
	Info_ClearChoices(CH_Lernpunkte);
};

func void CH_Lernpunkte_0()
{
	hero.lp = 0;
	PrintScreen("Очки обучения обнулены",-1,-1,FONT_Screen,3);
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_50()
{
	hero.lp += 50;
	PrintScreen(ConcatStrings(PRINT_LearnLP,"50"),-1,-1,FONT_Screen,3);
	Snd_Play("LEVELUP");
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_25()
{
	hero.lp += 25;
	PrintScreen(ConcatStrings(PRINT_LearnLP,"25"),-1,-1,FONT_Screen,3);
	Snd_Play("LEVELUP");
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_10()
{
	hero.lp += 10;
	PrintScreen(ConcatStrings(PRINT_LearnLP,"10"),-1,-1,FONT_Screen,3);
	Snd_Play("LEVELUP");
	CH_Lernpunkte_Info();
};

func void CH_Lernpunkte_5()
{
	hero.lp += 5;
	PrintScreen(ConcatStrings(PRINT_LearnLP,"5"),-1,-1,FONT_Screen,3);
	Snd_Play("LEVELUP");
	CH_Lernpunkte_Info();
};


instance CH_Level_niedrig(C_Info)
{
	npc = ch;
	nr = 2;
	condition = CH_Level_niedrig_Condition;
	information = CH_Level_niedrig_Info;
	description = "Выбор уровня 0 - 25";
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
	Info_AddChoice(CH_Level_niedrig,"Уровень 21 - 25",CH_Level21);
	Info_AddChoice(CH_Level_niedrig,"Уровень 16 - 20",CH_Level16);
	Info_AddChoice(CH_Level_niedrig,"Уровень 11 - 15",CH_Level11);
	Info_AddChoice(CH_Level_niedrig,"Уровень  6 - 10",CH_Level6);
	Info_AddChoice(CH_Level_niedrig,"Уровень  0 -  5",CH_Level1);
};


instance CH_Level_hoch(C_Info)
{
	npc = ch;
	nr = 3;
	condition = CH_Level_hoch_Condition;
	information = CH_Level_hoch_Info;
	description = "Выбор уровня 26 - 50";
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
	Info_AddChoice(CH_Level_hoch,"Уровень 46 - 50",CH_Level46);
	Info_AddChoice(CH_Level_hoch,"Уровень 41 - 45",CH_Level41);
	Info_AddChoice(CH_Level_hoch,"Уровень 36 - 40",CH_Level36);
	Info_AddChoice(CH_Level_hoch,"Уровень 31 - 35",CH_Level31);
	Info_AddChoice(CH_Level_hoch,"Уровень 26 - 30",CH_Level26);
};

func void CH_Level46()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"Уровень 50",CH_Level_50);
	Info_AddChoice(CH_Level_hoch,"Уровень 49",CH_Level_49);
	Info_AddChoice(CH_Level_hoch,"Уровень 48",CH_Level_48);
	Info_AddChoice(CH_Level_hoch,"Уровень 47",CH_Level_47);
	Info_AddChoice(CH_Level_hoch,"Уровень 46",CH_Level_46);
};

func void CH_Level41()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"Уровень 45",CH_Level_45);
	Info_AddChoice(CH_Level_hoch,"Уровень 44",CH_Level_44);
	Info_AddChoice(CH_Level_hoch,"Уровень 43",CH_Level_43);
	Info_AddChoice(CH_Level_hoch,"Уровень 42",CH_Level_42);
	Info_AddChoice(CH_Level_hoch,"Уровень 41",CH_Level_41);
};

func void CH_Level36()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"Уровень 40",CH_Level_40);
	Info_AddChoice(CH_Level_hoch,"Уровень 39",CH_Level_39);
	Info_AddChoice(CH_Level_hoch,"Уровень 38",CH_Level_38);
	Info_AddChoice(CH_Level_hoch,"Уровень 37",CH_Level_37);
	Info_AddChoice(CH_Level_hoch,"Уровень 36",CH_Level_36);
};

func void CH_Level31()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"Уровень 35",CH_Level_35);
	Info_AddChoice(CH_Level_hoch,"Уровень 34",CH_Level_34);
	Info_AddChoice(CH_Level_hoch,"Уровень 33",CH_Level_33);
	Info_AddChoice(CH_Level_hoch,"Уровень 32",CH_Level_32);
	Info_AddChoice(CH_Level_hoch,"Уровень 31",CH_Level_31);
};

func void CH_Level26()
{
	Info_ClearChoices(CH_Level_hoch);
	Info_AddChoice(CH_Level_hoch,Dialog_Back,CH_Level_hoch_BACK);
	Info_AddChoice(CH_Level_hoch,"Уровень 30",CH_Level_30);
	Info_AddChoice(CH_Level_hoch,"Уровень 29",CH_Level_29);
	Info_AddChoice(CH_Level_hoch,"Уровень 28",CH_Level_28);
	Info_AddChoice(CH_Level_hoch,"Уровень 27",CH_Level_27);
	Info_AddChoice(CH_Level_hoch,"Уровень 26",CH_Level_26);
};

func void CH_Level21()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"Уровень 25",CH_Level_25);
	Info_AddChoice(CH_Level_niedrig,"Уровень 24",CH_Level_24);
	Info_AddChoice(CH_Level_niedrig,"Уровень 23",CH_Level_23);
	Info_AddChoice(CH_Level_niedrig,"Уровень 22",CH_Level_22);
	Info_AddChoice(CH_Level_niedrig,"Уровень 21",CH_Level_21);
};

func void CH_Level16()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"Уровень 20",CH_Level_20);
	Info_AddChoice(CH_Level_niedrig,"Уровень 19",CH_Level_19);
	Info_AddChoice(CH_Level_niedrig,"Уровень 18",CH_Level_18);
	Info_AddChoice(CH_Level_niedrig,"Уровень 17",CH_Level_17);
	Info_AddChoice(CH_Level_niedrig,"Уровень 16",CH_Level_16);
};

func void CH_Level11()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"Уровень 15",CH_Level_15);
	Info_AddChoice(CH_Level_niedrig,"Уровень 14",CH_Level_14);
	Info_AddChoice(CH_Level_niedrig,"Уровень 13",CH_Level_13);
	Info_AddChoice(CH_Level_niedrig,"Уровень 12",CH_Level_12);
	Info_AddChoice(CH_Level_niedrig,"Уровень 11",CH_Level_11);
};

func void CH_Level6()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"Уровень 10",CH_Level_10);
	Info_AddChoice(CH_Level_niedrig,"Уровень 9",CH_Level_9);
	Info_AddChoice(CH_Level_niedrig,"Уровень 8",CH_Level_8);
	Info_AddChoice(CH_Level_niedrig,"Уровень 7",CH_Level_7);
	Info_AddChoice(CH_Level_niedrig,"Уровень 6",CH_Level_6);
};

func void CH_Level1()
{
	Info_ClearChoices(CH_Level_niedrig);
	Info_AddChoice(CH_Level_niedrig,Dialog_Back,CH_Level_niedrig_BACK);
	Info_AddChoice(CH_Level_niedrig,"Уровень 5",CH_Level_5);
	Info_AddChoice(CH_Level_niedrig,"Уровень 4",CH_Level_4);
	Info_AddChoice(CH_Level_niedrig,"Уровень 3",CH_Level_3);
	Info_AddChoice(CH_Level_niedrig,"Уровень 2",CH_Level_2);
	Info_AddChoice(CH_Level_niedrig,"Уровень 1",CH_Level_1);
	Info_AddChoice(CH_Level_niedrig,"Уровень 0",CH_Level_0);
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
	description = "Сила и ловкость";
};


func int DIA_CH_Attribute_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Повысить силу";
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
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnString("Сила + 20",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 20),DIA_CH_Strength_20);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnString("Сила + 10",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 10),DIA_CH_Strength_10);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnString("Сила + 5",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_CH_Strength_5);
	Info_AddChoice(DIA_CH_Strength,B_BuildLearnString("Сила + 1",B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_CH_Strength_1);
};

func void DIA_CH_Strength_BACK()
{
	Info_ClearChoices(DIA_CH_Strength);
};

func void DIA_CH_Strength_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	DIA_CH_Strength_Info();
};

func void DIA_CH_Strength_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	DIA_CH_Strength_Info();
};

func void DIA_CH_Strength_10()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,10,T_MAX);
	DIA_CH_Strength_Info();
};

func void DIA_CH_Strength_20()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,20,T_MAX);
	DIA_CH_Strength_Info();
};


instance DIA_CH_Dex(C_Info)
{
	npc = ch;
	nr = 3;
	condition = DIA_CH_Dex_Condition;
	information = DIA_CH_Dex_Info;
	permanent = TRUE;
	description = "Повысить ловкость";
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
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnString("Ловкость + 20",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnString("Ловкость + 10",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnString("Ловкость + 5",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(DIA_CH_Dex,B_BuildLearnString("Ловкость + 1",B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
};

func void DIA_CH_Dex_BACK()
{
	Info_ClearChoices(DIA_CH_Dex);
};

func void dia_ch_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	DIA_CH_Dex_Info();
};

func void dia_ch_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	DIA_CH_Dex_Info();
};

func void dia_ch_dex_10()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,10,T_MAX);
	DIA_CH_Dex_Info();
};

func void dia_ch_dex_20()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,20,T_MAX);
	DIA_CH_Dex_Info();
};


var int MagieStart;

instance DIA_CH_MAGIE(C_Info)
{
	npc = ch;
	nr = 3;
	condition = DIA_CH_MAGIE_Condition;
	information = DIA_CH_MAGIE_Info;
	permanent = TRUE;
	description = "Магия: мана, руны, круги";
};


func int DIA_CH_MAGIE_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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


instance DIA_CH_Mana(C_Info)
{
	npc = ch;
	nr = 3;
	condition = DIA_CH_Mana_Condition;
	information = DIA_CH_Mana_Info;
	permanent = TRUE;
	description = "Повысить ману";
};


func int DIA_CH_Mana_Condition()
{
	if(MagieStart == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CH_Mana_Info()
{
	Info_ClearChoices(DIA_CH_Mana);
	Info_AddChoice(DIA_CH_Mana,Dialog_Back,DIA_CH_Mana_BACK);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnString("Макс. мана + 20",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnString("Макс. мана + 10",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnString("Макс. мана + 5",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(DIA_CH_Mana,B_BuildLearnString("Макс. мана + 1",B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
};

func void DIA_CH_Mana_BACK()
{
	Info_ClearChoices(DIA_CH_Mana);
};

func void dia_ch_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX);
	DIA_CH_Mana_Info();
};

func void dia_ch_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX);
	DIA_CH_Mana_Info();
};

func void dia_ch_mana_10()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,10,T_MAX);
	DIA_CH_Mana_Info();
};

func void dia_ch_mana_20()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,20,T_MAX);
	DIA_CH_Mana_Info();
};


instance DIA_CH_KREISE(C_Info)
{
	npc = ch;
	nr = 4;
	condition = DIA_CH_KREISE_Condition;
	information = DIA_CH_KREISE_Info;
	permanent = TRUE;
	description = "Круги магии";
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
	Info_ClearChoices(dia_ch_kreise);
	Info_AddChoice(dia_ch_kreise,Dialog_Back,ch_kreise_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_ch_kreise,B_BuildLearnString(NAME_Circle_1,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1)),ch_kreise_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_ch_kreise,B_BuildLearnString(NAME_Circle_2,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2)),ch_kreise_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_ch_kreise,B_BuildLearnString(NAME_Circle_3,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3)),ch_kreise_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_ch_kreise,B_BuildLearnString(NAME_Circle_4,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),ch_kreise_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_ch_kreise,B_BuildLearnString(NAME_Circle_5,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),ch_kreise_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_ch_kreise,B_BuildLearnString(NAME_Circle_6,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),ch_kreise_6);
	};
};

func void ch_kreise_back()
{
	Info_ClearChoices(dia_ch_kreise);
};

func void ch_kreise_1()
{
	Info_ClearChoices(dia_ch_kreise);
	B_TeachMagicCircle(self,other,1);
	B_SetKDFRunes();
};

func void ch_kreise_2()
{
	Info_ClearChoices(dia_ch_kreise);
	B_TeachMagicCircle(self,other,2);
	B_SetKDFRunes();
	B_SetKDWRunes();
};

func void ch_kreise_3()
{
	Info_ClearChoices(dia_ch_kreise);
	B_TeachMagicCircle(self,other,3);
	B_SetKDFRunes();
	B_SetKDWRunes();
};

func void ch_kreise_4()
{
	Info_ClearChoices(dia_ch_kreise);
	B_TeachMagicCircle(self,other,4);
	B_SetKDFRunes();
	B_SetKDWRunes();
};

func void ch_kreise_5()
{
	Info_ClearChoices(dia_ch_kreise);
	B_TeachMagicCircle(self,other,5);
	B_SetKDFRunes();
};

func void ch_kreise_6()
{
	Info_ClearChoices(dia_ch_kreise);
	B_TeachMagicCircle(self,other,6);
	B_SetKDFRunes();
};


instance DIA_CH_Runen(C_Info)
{
	npc = ch;
	nr = 5;
	condition = DIA_CH_Runen_Condition;
	information = DIA_CH_Runen_Info;
	permanent = TRUE;
	description = "Создание рун";
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
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
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
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
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
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
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
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
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
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
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
	Info_AddChoice(DIA_CH_Runen,Dialog_Back,DIA_CH_Runen_BACK);
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
	description = "Руны паладинов";
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
	Info_AddChoice(DIA_CH_Misc_PaladinStart,"Боевые заклинания",DIA_CH_Misc_PalKampf);
	Info_AddChoice(DIA_CH_Misc_PaladinStart,"Заклинания света и исцеления",DIA_CH_Misc_PalHeal);
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
	nr = 6;
	condition = DIA_CH_Kampf_Start_Condition;
	information = DIA_CH_Kampf_Start_Info;
	permanent = TRUE;
	description = "Боевые навыки (ближний и дальний бой)";
};


func int DIA_CH_Kampf_Start_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Одноручное оружие";
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
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnString("Одноручное оружие + 20",B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 20),CH_Training_Combat_1H_20);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnString("Одноручное оружие + 10",B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 10),CH_Training_Combat_1H_10);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnString("Одноручное оружие + 5",B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),CH_Training_Combat_1H_5);
	Info_AddChoice(DIA_CH_Kampf_Einhand,B_BuildLearnString("Одноручное оружие + 1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),CH_Training_Combat_1H_1);
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
	description = "Двуручное оружие";
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
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnString("Двуручное оружие + 20",B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 20),CH_Training_Combat_2H_20);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnString("Двуручное оружие + 10",B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 10),CH_Training_Combat_2H_10);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnString("Двуручное оружие + 5",B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),CH_Training_Combat_2H_5);
	Info_AddChoice(DIA_CH_Kampf_Zweihand,B_BuildLearnString("Двуручное оружие + 1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),CH_Training_Combat_2H_1);
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
	description = "Лук";
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
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnString("Лук + 20",B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 20),CH_Training_Combat_BOW_20);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnString("Лук + 10",B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 10),CH_Training_Combat_BOW_10);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnString("Лук + 5",B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),CH_Training_Combat_BOW_5);
	Info_AddChoice(DIA_CH_Kampf_Bogen,B_BuildLearnString("Лук + 1",B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),CH_Training_Combat_BOW_1);
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
	description = "Арбалет";
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
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnString("Арбалет + 20",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 20),CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnString("Арбалет + 10",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnString("Арбалет + 5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(DIA_CH_Kampf_Armbrust,B_BuildLearnString("Арбалет + 1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),CH_Training_Combat_CROSSBOW_1);
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


var int DiebStart;

instance DIA_CH_Dieb_Start(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Dieb_Start_Condition;
	information = DIA_CH_Dieb_Start_Info;
	permanent = TRUE;
	description = "Воровские навыки";
};


func int DIA_CH_Dieb_Start_Condition()
{
	if((GuildStart == FALSE) && (KampfStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (LevelStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Прочие навыки";
};


func int DIA_CH_Misc_Start_Condition()
{
	if((GuildStart == FALSE) && (KampfStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (LevelStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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
	description = "Различные лечебные зелья";
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
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Health,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),CH_Training_Alchemy_POTION_Perm_Health);
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

func void CH_Training_Alchemy_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};


instance DIA_CH_Misc_Mana(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Misc_Mana_Condition;
	information = DIA_CH_Misc_Mana_Info;
	permanent = TRUE;
	description = "Различные зелья маны";
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
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	{
		Info_AddChoice(DIA_CH_Misc_Mana,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),CH_Training_Alchemy_POTION_Perm_Mana);
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

func void CH_Training_Alchemy_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};


instance DIA_CH_Misc_Special(C_Info)
{
	npc = ch;
	nr = 6;
	condition = DIA_CH_Misc_Special_Condition;
	information = DIA_CH_Misc_Special_Info;
	permanent = TRUE;
	description = "Особые зелья";
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
};

func void DIA_CH_Misc_Special_BACK()
{
	Info_ClearChoices(DIA_CH_Misc_Special);
};

func void CH_Training_Alchemy_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
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
	description = "Обычное оружие";
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
	description = "Рудное оружие";
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
	description = "Трофеи животных";
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
	description = "Зубы, шкура, кожа, когти, сердце";
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
	description = "Крылья, жало, мандибулы, панцирь";
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
	description = "Кровь, чешуя, рога, язык";
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
	description = "Языки зодчих";
};


func int CH_Language_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Language_Info()
{
	Info_ClearChoices(CH_Language);
	Info_AddChoice(CH_Language,Dialog_Back,CH_Language_BACK);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		Info_AddChoice(CH_Language,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),CH_Language_Priest);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		Info_AddChoice(CH_Language,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),CH_Language_Warrior);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(CH_Language,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),CH_Language_Peasant);
	};
};

func void CH_Language_BACK()
{
	Info_ClearChoices(CH_Language);
};

func void CH_Language_Peasant()
{
	B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1);
};

func void CH_Language_Warrior()
{
	B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2);
};

func void CH_Language_Priest()
{
	B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3);
};

instance DIA_CH_Misc_InnosEye(C_Info)
{
	npc = ch;
	nr = 40;
	condition = DIA_CH_Misc_InnosEye_Condition;
	information = DIA_CH_Misc_InnosEye_Info;
	permanent = TRUE;
	description = "Перезарядка Глаза Инноса";
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
	description = "Добыча золота";
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
		Info_AddChoice(DIA_CH_Misc_Gold,"Навык добычи + 20",DIA_CH_Misc_Gold_20);
	};
	if(Hero_HackChance <= 90)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"Навык добычи + 10",DIA_CH_Misc_Gold_10);
	};
	if(Hero_HackChance <= 95)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"Навык добычи + 5",DIA_CH_Misc_Gold_5);
	};
	if(Hero_HackChance < 100)
	{
		Info_AddChoice(DIA_CH_Misc_Gold,"Навык добычи + 1",DIA_CH_Misc_Gold_1);
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
	description = "Способности ищущего огонька";
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
	cost = B_GetLearnCostAttribute(other,stats);
	if(stats == ATR_REGENERATEMANA)
	{
		next = other.attribute[ATR_REGENERATEMANA] - 1;
		concatText = "Регенерация маны (1 ед. в ";
	}
	else if(stats == ATR_REGENERATEHP)
	{
		next = other.attribute[ATR_REGENERATEHP] - 1;
		concatText = "Регенерация здоровья (1 ед. в ";
	};
	if(next < 0)
	{
		next = 30;
	};
	concatText = ConcatStrings(concatText,IntToString(next));
	concatText = ConcatStrings(concatText," секунд, ");
	concatText = ConcatStrings(concatText,IntToString(cost));
	if(cost == 1)
	{
		concatText = ConcatStrings(concatText,PRINT_1LP);
	}
	else if((cost > 1) && (cost < 5))
	{
		concatText = ConcatStrings(concatText,PRINT_2LP);
	}
	else
	{
		concatText = ConcatStrings(concatText,PRINT_LP);
	};
	return concatText;
};

instance DIA_CH_Misc_Regenerate(C_Info)
{
	npc = ch;
	nr = 70;
	condition = DIA_CH_Misc_Regenerate_Condition;
	information = DIA_CH_Misc_Regenerate_Info;
	permanent = TRUE;
	description = "Регенерация";
};


func int DIA_CH_Misc_Regenerate_Condition()
{
	if((MiscStart == TRUE) && (AlchemyStart == FALSE) && (SmithStart == FALSE) && (AnimalStart == FALSE))
	{
		if(other.attribute[ATR_REGENERATEMANA] != 1)
		{
			return TRUE;
		};
		if(other.attribute[ATR_REGENERATEHP] != 1)
		{
			return TRUE;
		};
	};
};

func void DIA_CH_Misc_Regenerate_Info()
{
	Info_ClearChoices(DIA_CH_Misc_Regenerate);
	Info_AddChoice(DIA_CH_Misc_Regenerate,Dialog_Back,DIA_CH_Misc_Regenerate_BACK);
	if(other.attribute[ATR_REGENERATEMANA] != 1)
	{
		Info_AddChoice(DIA_CH_Misc_Regenerate,B_BuildCurrentRegenerateValue(ATR_REGENERATEMANA),DIA_CH_Misc_Regenerate_Mana);
	};
	if(other.attribute[ATR_REGENERATEHP] != 1)
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
	cost = B_GetLearnCostAttribute(other,ATR_REGENERATEMANA);
	if(other.lp >= cost)
	{
		other.lp -= cost;
		B_RaiseAttribute(other,ATR_REGENERATEMANA,1);
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
	cost = B_GetLearnCostAttribute(other,ATR_REGENERATEHP);
	if(other.lp >= cost)
	{
		other.lp -= cost;
		B_RaiseAttribute(other,ATR_REGENERATEHP,1);
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
	description = "Изменить походку";
};


func int CH_Overlay_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Overlay_Info()
{
	Info_ClearChoices(CH_Overlay);
	Info_AddChoice(CH_Overlay,Dialog_Back,CH_Overlay_BACK);
	Info_AddChoice(CH_Overlay,"Женщина",CH_Overlay_Babe);
	Info_AddChoice(CH_Overlay,"Маг",CH_Overlay_Mage);
	Info_AddChoice(CH_Overlay,"Солдат",CH_Overlay_Militia);
	Info_AddChoice(CH_Overlay,"Крутой",CH_Overlay_Arrogance);
	Info_AddChoice(CH_Overlay,"Спокойный",CH_Overlay_Relaxed);
	Info_AddChoice(CH_Overlay,"Уставший",CH_Overlay_Tired);
	Info_AddChoice(CH_Overlay,"Пьяный",CH_Overlay_Drunken);
	Info_AddChoice(CH_Overlay,"Спринтер",CH_Overlay_Sprint);
	Info_AddChoice(CH_Overlay,"Стандарт",CH_Overlay_Clear);
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
	description = "Изменить внешность";
};


func int CH_Skin_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Skin_Info()
{
	Info_ClearChoices(CH_Skin);
	Info_AddChoice(CH_Skin,Dialog_Back,CH_Skin_BACK);
	if(G1BodySkin == TRUE)
	{
		Info_AddChoice(CH_Skin,"Без одежды",CH_Skin_Naked);
		Info_AddChoice(CH_Skin,"Татуировки",CH_Skin_Tattoos);
		Info_AddChoice(CH_Skin,"Сиквел",CH_Skin_Sequel);
		Info_AddChoice(CH_Skin,"Готика 2",CH_Skin_G2);
		Info_AddChoice(CH_Skin,"Готика 1 (используется)",CH_Skin_G1);
	}
	else if(SequelBodySkin == TRUE)
	{
		Info_AddChoice(CH_Skin,"Без одежды",CH_Skin_Naked);
		Info_AddChoice(CH_Skin,"Татуировки",CH_Skin_Tattoos);
		Info_AddChoice(CH_Skin,"Сиквел (используется)",CH_Skin_Sequel);
		Info_AddChoice(CH_Skin,"Готика 2",CH_Skin_G2);
		Info_AddChoice(CH_Skin,"Готика 1",CH_Skin_G1);
	}
	else if(NakedBodySkin == TRUE)
	{
		Info_AddChoice(CH_Skin,"Без одежды (используется)",CH_Skin_Naked);
		Info_AddChoice(CH_Skin,"Татуировки",CH_Skin_Tattoos);
		Info_AddChoice(CH_Skin,"Сиквел",CH_Skin_Sequel);
		Info_AddChoice(CH_Skin,"Готика 2",CH_Skin_G2);
		Info_AddChoice(CH_Skin,"Готика 1",CH_Skin_G1);
	}
	else if(TattoosBodySkin == TRUE)
	{
		Info_AddChoice(CH_Skin,"Без одежды",CH_Skin_Naked);
		Info_AddChoice(CH_Skin,"Татуировки (используется)",CH_Skin_Tattoos);
		Info_AddChoice(CH_Skin,"Сиквел",CH_Skin_Sequel);
		Info_AddChoice(CH_Skin,"Готика 2",CH_Skin_G2);
		Info_AddChoice(CH_Skin,"Готика 1",CH_Skin_G1);
	}
	else
	{
		Info_AddChoice(CH_Skin,"Без одежды",CH_Skin_Naked);
		Info_AddChoice(CH_Skin,"Татуировки",CH_Skin_Tattoos);
		Info_AddChoice(CH_Skin,"Сиквел",CH_Skin_Sequel);
		Info_AddChoice(CH_Skin,"Готика 2 (используется)",CH_Skin_G2);
		Info_AddChoice(CH_Skin,"Готика 1",CH_Skin_G1);
	};
};

func void CH_Skin_BACK()
{
	Info_ClearChoices(CH_Skin);
};

func void CH_Skin_G1()
{
	G1BodySkin = TRUE;
	SequelBodySkin = FALSE;
	TattoosBodySkin = FALSE;
	NakedBodySkin = FALSE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_G2()
{
	G1BodySkin = FALSE;
	SequelBodySkin = FALSE;
	TattoosBodySkin = FALSE;
	NakedBodySkin = FALSE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_Sequel()
{
	G1BodySkin = FALSE;
	SequelBodySkin = TRUE;
	TattoosBodySkin = FALSE;
	NakedBodySkin = FALSE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_Tattoos()
{
	G1BodySkin = FALSE;
	SequelBodySkin = FALSE;
	TattoosBodySkin = TRUE;
	NakedBodySkin = FALSE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void CH_Skin_Naked()
{
	G1BodySkin = FALSE;
	SequelBodySkin = FALSE;
	TattoosBodySkin = FALSE;
	NakedBodySkin = TRUE;
	B_SetHeroSkin();
	CH_Skin_Info();
};

func void B_SetHeroEquipment()
{
	if(Npc_HasItems(hero,ItRw_Arrow) < 100)
	{
		Npc_RemoveInvItems(hero,ItRw_Arrow,Npc_HasItems(hero,ItRw_Arrow));
		CreateInvItems(hero,ItRw_Arrow,100);
	};
	if(Npc_HasItems(hero,ItRw_Bolt) < 100)
	{
		Npc_RemoveInvItems(hero,ItRw_Bolt,Npc_HasItems(hero,ItRw_Bolt));
		CreateInvItems(hero,ItRw_Bolt,100);
	};
	if(Npc_HasItems(hero,ItLsTorch) < 20)
	{
		Npc_RemoveInvItems(hero,ItLsTorch,Npc_HasItems(hero,ItLsTorch));
		CreateInvItems(hero,ItLsTorch,20);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < 500)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,Npc_HasItems(hero,ItMi_Gold));
		CreateInvItems(hero,ItMi_Gold,500);
	};
	if(Npc_HasItems(hero,ItPo_Health_03) < 10)
	{
		Npc_RemoveInvItems(hero,ItPo_Health_03,Npc_HasItems(hero,ItPo_Health_03));
		CreateInvItems(hero,ItPo_Health_03,10);
	};
	if(Npc_HasItems(hero,ItPo_Mana_03) < 10)
	{
		Npc_RemoveInvItems(hero,ItPo_Mana_03,Npc_HasItems(hero,ItPo_Mana_03));
		CreateInvItems(hero,ItPo_Mana_03,10);
	};
	if(Npc_HasItems(hero,ItKe_Lockpick) < 30)
	{
		Npc_RemoveInvItems(hero,ItKe_Lockpick,Npc_HasItems(hero,ItKe_Lockpick));
		CreateInvItems(hero,ItKe_Lockpick,30);
	};
};

instance CH_Equipment(C_Info)
{
	npc = ch;
	nr = 38;
	condition = CH_Equipment_Condition;
	information = CH_Equipment_Info;
	permanent = TRUE;
	description = "Получить снаряжение";
};


func int CH_Equipment_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
	{
		return TRUE;
	};
};

func void CH_Equipment_Info()
{
	B_SetHeroEquipment();
	PrintScreen("Снаряжение обновлено",-1,-1,FONT_Screen,3);
};


instance CH_StatsBook(C_Info)
{
	npc = ch;
	nr = 38;
	condition = CH_StatsBook_Condition;
	information = CH_StatsBook_Info;
	permanent = TRUE;
	description = "Получить книгу статистики";
};


func int CH_StatsBook_Condition()
{
	if((GuildStart == FALSE) && (LevelStart == FALSE) && (MagieStart == FALSE) && (AttributeStart == FALSE) && (KampfStart == FALSE) && (DiebStart == FALSE) && (MiscStart == FALSE))
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

