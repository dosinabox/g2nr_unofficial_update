
/*func int makerune_cond()
{
	if(Npc_IsPlayer(self))
	{
		if(!Npc_HasItems(self,ItMi_Pliers))
		{
			AI_PlayAni(self,"T_DONTKNOW");
			AI_PrintScreen("Требуются щипцы!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			return FALSE;
		};
	};
	return TRUE;
};*/

func void makerune_s1()
{
	if(C_NpcIsHero(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MakeRune;
		AI_ProcessInfos(self);
	};
};

func void B_CreateRune(var int rune)
{
	CreateInvItem(self,rune);
	TotalRunesCreated += 1;
	AI_PrintScreen(PRINT_RuneSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
};

func void B_RuneProdItemsMissing()
{
	CreateInvItem(self,ItMi_RuneBlank);
	AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
};

instance PC_MakeRune_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_MakeRune_End_Condition;
	information = PC_MakeRune_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_MakeRune_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune)
	{
		return TRUE;
	};
};

func void PC_MakeRune_End_Info()
{
	CreateInvItem(self,ItMi_RuneBlank);
	B_EndProductionDialog();
};


instance PC_Circle_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_Circle_01_Condition;
	information = PC_Circle_01_Info;
	permanent = TRUE;
	description = "Создать руну 1-го круга";
};


func int PC_Circle_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_Light] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE) || (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)))
	{
		return TRUE;
	};
};

func void PC_Circle_01_Info()
{
	Info_ClearChoices(PC_Circle_01);
	Info_AddChoice(PC_Circle_01,Dialog_Back,PC_Circle_01_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Light] == TRUE)
	{
		Info_AddChoice(PC_Circle_01,NAME_SPL_LIGHT,PC_ItRu_Light_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	{
		Info_AddChoice(PC_Circle_01,NAME_SPL_Firebolt,PC_ItRu_Firebolt_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	{
		Info_AddChoice(PC_Circle_01,NAME_SPL_Zap,PC_ItRu_Zap_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	{
		Info_AddChoice(PC_Circle_01,NAME_SPL_LightHeal,PC_ItRu_LightHeal_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	{
		Info_AddChoice(PC_Circle_01,NAME_SPL_SummonGoblinSkeleton,PC_ItRu_SumGobSkel_Info);
	};
};

func void PC_Circle_01_BACK()
{
	Info_ClearChoices(PC_Circle_01);
};


instance PC_Circle_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_Circle_02_Condition;
	information = PC_Circle_02_Info;
	permanent = TRUE;
	description = "Создать руну 2-го круга";
};


func int PC_Circle_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE) || (PLAYER_TALENT_RUNES[SPL_WindFist] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE) || (PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)))
	{
		return TRUE;
	};
};

func void PC_Circle_02_Info()
{
	Info_ClearChoices(PC_Circle_02);
	Info_AddChoice(PC_Circle_02,Dialog_Back,PC_Circle_02_BACK);
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_InstantFireball,PC_ItRu_InstFireball_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_Icebolt,PC_ItRu_Icebolt_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_SummonWolf,PC_ItRu_SumWolf_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_WINDFIST,PC_ItRu_Windfist_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_Sleep,PC_ItRu_Sleep_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_Whirlwind,PC_ItRu_Whirlwind_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)
	{
		Info_AddChoice(PC_Circle_02,NAME_SPL_IceLance,PC_ItRu_Icelance_Info);
	};
};

func void PC_Circle_02_BACK()
{
	Info_ClearChoices(PC_Circle_02);
};


instance PC_Circle_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_Circle_03_Condition;
	information = PC_Circle_03_Info;
	permanent = TRUE;
	description = "Создать руну 3-го круга";
};


func int PC_Circle_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Fear] == TRUE) || (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)))
	{
		return TRUE;
	};
};

func void PC_Circle_03_Info()
{
	Info_ClearChoices(PC_Circle_03);
	Info_AddChoice(PC_Circle_03,Dialog_Back,PC_Circle_03_BACK);
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_MediumHeal,PC_ItRu_MediumHeal_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_SummonSkeleton,PC_ItRu_SumSkel_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_Fear,PC_ItRu_Fear_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_IceCube,PC_ItRu_IceCube_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_ChargeZap,PC_ItRu_ThunderBall_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_Firestorm,PC_ItRu_Firestorm_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_Geyser,PC_ItRu_Geyser_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	{
		Info_AddChoice(PC_Circle_03,NAME_SPL_Thunderstorm,PC_ItRu_Thunderstorm_Info);
	};
};

func void PC_Circle_03_BACK()
{
	Info_ClearChoices(PC_Circle_03);
};


instance PC_Circle_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_Circle_04_Condition;
	information = PC_Circle_04_Info;
	permanent = TRUE;
	description = "Создать руну 4-го круга";
};


func int PC_Circle_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE) || (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE) || (PLAYER_TALENT_RUNES[SPL_WaterFist] == TRUE)))
	{
		return TRUE;
	};
};

func void PC_Circle_04_Info()
{
	Info_ClearChoices(PC_Circle_04);
	Info_AddChoice(PC_Circle_04,Dialog_Back,PC_Circle_04_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	{
		Info_AddChoice(PC_Circle_04,NAME_SPL_SummonGolem,PC_ItRu_SumGol_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	{
		Info_AddChoice(PC_Circle_04,NAME_SPL_DestroyUndead,PC_ItRu_HarmUndead_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	{
		Info_AddChoice(PC_Circle_04,NAME_SPL_ChargeFireball,PC_ItRu_ChargeFireball_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	{
		Info_AddChoice(PC_Circle_04,NAME_SPL_LightningFlash,PC_ItRu_LightningFlash_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == TRUE)
	{
		Info_AddChoice(PC_Circle_04,NAME_SPL_WaterFist,PC_ItRu_Waterfist_Info);
	};
};

func void PC_Circle_04_BACK()
{
	Info_ClearChoices(PC_Circle_04);
};


instance PC_Circle_05(C_Info)
{
	npc = PC_Hero;
	condition = PC_Circle_05_Condition;
	information = PC_Circle_05_Info;
	permanent = TRUE;
	description = "Создать руну 5-го круга";
};


func int PC_Circle_05_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)))
	{
		return TRUE;
	};
};

func void PC_Circle_05_Info()
{
	Info_ClearChoices(PC_Circle_05);
	Info_AddChoice(PC_Circle_05,Dialog_Back,PC_Circle_05_BACK);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	{
		Info_AddChoice(PC_Circle_05,NAME_SPL_IceWave,PC_ItRu_IceWave_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE)
	{
		Info_AddChoice(PC_Circle_05,NAME_SPL_SummonDemon,PC_ItRu_SumDemon_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	{
		Info_AddChoice(PC_Circle_05,NAME_SPL_FullHeal,PC_ItRu_FullHeal_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	{
		Info_AddChoice(PC_Circle_05,NAME_SPL_Pyrokinesis,PC_ItRu_Pyrokinesis_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	{
		Info_AddChoice(PC_Circle_05,NAME_SPL_Shrink,PC_ItRu_Shrink_Info);
	};
};

func void PC_Circle_05_BACK()
{
	Info_ClearChoices(PC_Circle_05);
};


instance PC_Circle_06(C_Info)
{
	npc = PC_Hero;
	condition = PC_Circle_06_Condition;
	information = PC_Circle_06_Info;
	permanent = TRUE;
	description = "Создать руну 6-го круга";
};


func int PC_Circle_06_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE) || (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE) || (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)))
	{
		return TRUE;
	};
};

func void PC_Circle_06_Info()
{
	Info_ClearChoices(PC_Circle_06);
	Info_AddChoice(PC_Circle_06,Dialog_Back,PC_Circle_06_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	{
		Info_AddChoice(PC_Circle_06,NAME_SPL_Firerain,PC_ItRu_Firerain_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	{
		Info_AddChoice(PC_Circle_06,NAME_SPL_BreathOfDeath,PC_ItRu_BreathOfDeath_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE)
	{
		Info_AddChoice(PC_Circle_06,NAME_SPL_MassDeath,PC_ItRu_MassDeath_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)
	{
		Info_AddChoice(PC_Circle_06,NAME_SPL_ArmyOfDarkness,PC_ItRu_ArmyOfDarkness_Info);
	};
/*	if(PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	{
		Info_AddChoice(PC_Circle_06,NAME_SPL_Shrink,PC_ItRu_Shrink_Info);
	};*/
};

func void PC_Circle_06_BACK()
{
	Info_ClearChoices(PC_Circle_06);
};


instance PC_SPL_MasterOfDisaster(C_Info)
{
	npc = PC_Hero;
	condition = PC_SPL_MasterOfDisaster_Condition;
	information = PC_SPL_MasterOfDisaster_Info;
	permanent = TRUE;
	description = "Секрет библиотеки!";
};


func int PC_SPL_MasterOfDisaster_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE))
	{
		return TRUE;
	};
};

func void PC_SPL_MasterOfDisaster_Info()
{
	Info_ClearChoices(PC_SPL_MasterOfDisaster);
	Info_AddChoice(PC_SPL_MasterOfDisaster,Dialog_Back,PC_SPL_MasterOfDisaster_BACK);
	if(PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE)
	{
		Info_AddChoice(PC_SPL_MasterOfDisaster,NAME_SPL_MasterOfDisaster,PC_SPL_MasterOfDisaster_Create);
	};
};

func void PC_SPL_MasterOfDisaster_BACK()
{
	Info_ClearChoices(PC_SPL_MasterOfDisaster);
};

func void PC_SPL_MasterOfDisaster_Create()
{
	if(Npc_HasItems(self,ItMi_HolyWater))
	{
		Npc_RemoveInvItems(self,ItMi_HolyWater,1);
		B_CreateRune(ItRu_MasterOfDisaster);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};


instance PC_SPL_PalTeleportSecret(C_Info)
{
	npc = PC_Hero;
	condition = PC_SPL_PalTeleportSecret_Condition;
	information = PC_SPL_PalTeleportSecret_Info;
	permanent = TRUE;
	description = "Секрет библиотеки!";
};


func int PC_SPL_PalTeleportSecret_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE))
	{
		return TRUE;
	};
};

func void PC_SPL_PalTeleportSecret_Info()
{
	Info_ClearChoices(PC_SPL_PalTeleportSecret);
	Info_AddChoice(PC_SPL_PalTeleportSecret,Dialog_Back,PC_SPL_PalTeleportSecret_BACK);
	if(PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE)
	{
		Info_AddChoice(PC_SPL_PalTeleportSecret,NAME_SPL_PalTeleportSecret,PC_SPL_PalTeleportSecret_Create);
	};
};

func void PC_SPL_PalTeleportSecret_BACK()
{
	Info_ClearChoices(PC_SPL_PalTeleportSecret);
};

func void PC_SPL_PalTeleportSecret_Create()
{
	if(Npc_HasItems(self,ItMi_HolyWater))
	{
		Npc_RemoveInvItems(self,ItMi_HolyWater,1);
		B_CreateRune(ItRu_PalTeleportSecret);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Light_Info()
{
	if(Npc_HasItems(self,ItSc_Light) && Npc_HasItems(self,ItMi_Gold))
	{
		Npc_RemoveInvItems(self,ItSc_Light,1);
		Npc_RemoveInvItems(self,ItMi_Gold,1);
		B_CreateRune(ItRu_Light);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Firebolt_Info()
{
	if(Npc_HasItems(self,ItSc_Firebolt) && Npc_HasItems(self,ItMi_Sulfur))
	{
		Npc_RemoveInvItems(self,ItSc_Firebolt,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		B_CreateRune(ItRu_FireBolt);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_LightHeal_Info()
{
	if(Npc_HasItems(self,ItSc_LightHeal) && Npc_HasItems(self,ItPl_Health_Herb_01))
	{
		Npc_RemoveInvItems(self,ItSc_LightHeal,1);
		Npc_RemoveInvItems(self,ItPl_Health_Herb_01,1);
		B_CreateRune(ItRu_LightHeal);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_SumGobSkel_Info()
{
	if(Npc_HasItems(self,ItSc_SumGobSkel) && Npc_HasItems(self,ItAt_GoblinBone))
	{
		Npc_RemoveInvItems(self,ItSc_SumGobSkel,1);
		Npc_RemoveInvItems(self,ItAt_GoblinBone,1);
		B_CreateRune(ItRu_SumGobSkel);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Zap_Info()
{
	if(Npc_HasItems(self,ItSc_Zap) && Npc_HasItems(self,ItMi_Rockcrystal))
	{
		Npc_RemoveInvItems(self,ItSc_Zap,1);
		Npc_RemoveInvItems(self,ItMi_Rockcrystal,1);
		B_CreateRune(ItRu_Zap);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_InstFireball_Info()
{
	if(Npc_HasItems(self,ItSc_InstantFireball) && Npc_HasItems(self,ItMi_Pitch))
	{
		Npc_RemoveInvItems(self,ItSc_InstantFireball,1);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		B_CreateRune(ItRu_InstantFireball);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Icebolt_Info()
{
	if(Npc_HasItems(self,ItSc_Icebolt) && Npc_HasItems(self,ItMi_Quartz))
	{
		Npc_RemoveInvItems(self,ItSc_Icebolt,1);
		Npc_RemoveInvItems(self,ItMi_Quartz,1);
		B_CreateRune(ItRu_Icebolt);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_SumWolf_Info()
{
	if(Npc_HasItems(self,ItSc_SumWolf) && Npc_HasItems(self,ItAt_WolfFur))
	{
		Npc_RemoveInvItems(self,ItSc_SumWolf,1);
		Npc_RemoveInvItems(self,ItAt_WolfFur,1);
		B_CreateRune(ItRu_SumWolf);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Windfist_Info()
{
	if(Npc_HasItems(self,ItSc_Windfist) && Npc_HasItems(self,ItMi_Coal))
	{
		Npc_RemoveInvItems(self,ItSc_Windfist,1);
		Npc_RemoveInvItems(self,ItMi_Coal,1);
		B_CreateRune(ItRu_Windfist);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Sleep_Info()
{
	if(Npc_HasItems(self,ItSc_Sleep) && Npc_HasItems(self,ItPl_SwampHerb))
	{
		Npc_RemoveInvItems(self,ItSc_Sleep,1);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		B_CreateRune(ItRu_Sleep);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_MediumHeal_Info()
{
	if(Npc_HasItems(self,ItSc_MediumHeal) && Npc_HasItems(self,ItPl_Health_Herb_02))
	{
		Npc_RemoveInvItems(self,ItSc_MediumHeal,1);
		Npc_RemoveInvItems(self,ItPl_Health_Herb_02,1);
		B_CreateRune(ItRu_MediumHeal);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_LightningFlash_Info()
{
	if(Npc_HasItems(self,ItSc_LightningFlash) && Npc_HasItems(self,ItMi_Rockcrystal) && Npc_HasItems(self,ItMi_Quartz))
	{
		Npc_RemoveInvItems(self,ItSc_LightningFlash,1);
		Npc_RemoveInvItems(self,ItMi_Rockcrystal,1);
		Npc_RemoveInvItems(self,ItMi_Quartz,1);
		B_CreateRune(ItRu_LightningFlash);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_ChargeFireball_Info()
{
	if(Npc_HasItems(self,ItSc_ChargeFireBall) && Npc_HasItems(self,ItMi_Sulfur) && Npc_HasItems(self,ItMi_Pitch))
	{
		Npc_RemoveInvItems(self,ItSc_ChargeFireBall,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		B_CreateRune(ItRu_ChargeFireball);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_SumSkel_Info()
{
	if(Npc_HasItems(self,ItSc_SumSkel) && Npc_HasItems(self,ItAt_SkeletonBone))
	{
		Npc_RemoveInvItems(self,ItSc_SumSkel,1);
		Npc_RemoveInvItems(self,ItAt_SkeletonBone,1);
		B_CreateRune(ItRu_SumSkel);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Fear_Info()
{
	if(Npc_HasItems(self,ItSc_Fear) && Npc_HasItems(self,ItMi_DarkPearl))
	{
		Npc_RemoveInvItems(self,ItSc_Fear,1);
		Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
		B_CreateRune(ItRu_Fear);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_IceCube_Info()
{
	if(Npc_HasItems(self,ItSc_IceCube) && Npc_HasItems(self,ItMi_Quartz) && Npc_HasItems(self,ItMi_Aquamarine))
	{
		Npc_RemoveInvItems(self,ItSc_IceCube,1);
		Npc_RemoveInvItems(self,ItMi_Quartz,1);
		Npc_RemoveInvItems(self,ItMi_Aquamarine,1);
		B_CreateRune(ItRu_IceCube);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_ThunderBall_Info()
{
	if(Npc_HasItems(self,ItSc_ThunderBall) && Npc_HasItems(self,ItMi_Rockcrystal) && Npc_HasItems(self,ItMi_Sulfur))
	{
		Npc_RemoveInvItems(self,ItSc_ThunderBall,1);
		Npc_RemoveInvItems(self,ItMi_Rockcrystal,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		B_CreateRune(ItRu_ThunderBall);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_SumGol_Info()
{
	if(Npc_HasItems(self,ItSc_SumGol) && Npc_HasItems(self,ItAt_StoneGolemHeart))
	{
		Npc_RemoveInvItems(self,ItSc_SumGol,1);
		Npc_RemoveInvItems(self,ItAt_StoneGolemHeart,1);
		B_CreateRune(ItRu_SumGol);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_HarmUndead_Info()
{
	if(Npc_HasItems(self,ItSc_HarmUndead) && Npc_HasItems(self,ItMi_HolyWater))
	{
		Npc_RemoveInvItems(self,ItSc_HarmUndead,1);
		Npc_RemoveInvItems(self,ItMi_HolyWater,1);
		B_CreateRune(ItRu_HarmUndead);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Pyrokinesis_Info()
{
	if(Npc_HasItems(self,ItSc_Pyrokinesis) && Npc_HasItems(self,ItMi_Sulfur) && Npc_HasItems(self,ItAt_WaranFiretongue))
	{
		Npc_RemoveInvItems(self,ItSc_Pyrokinesis,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		Npc_RemoveInvItems(self,ItAt_WaranFiretongue,1);
		B_CreateRune(ItRu_Pyrokinesis);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Firestorm_Info()
{
	if(Npc_HasItems(self,ItSc_Firestorm) && Npc_HasItems(self,ItMi_Pitch) && Npc_HasItems(self,ItMi_Sulfur))
	{
		Npc_RemoveInvItems(self,ItSc_Firestorm,1);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		B_CreateRune(ItRu_Firestorm);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_IceWave_Info()
{
	if(Npc_HasItems(self,ItSc_IceWave) && Npc_HasItems(self,ItMi_Quartz) && Npc_HasItems(self,ItMi_Aquamarine))
	{
		Npc_RemoveInvItems(self,ItSc_IceWave,1);
		Npc_RemoveInvItems(self,ItMi_Quartz,1);
		Npc_RemoveInvItems(self,ItMi_Aquamarine,1);
		B_CreateRune(ItRu_IceWave);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_SumDemon_Info()
{
	if(Npc_HasItems(self,ItSc_SumDemon) && Npc_HasItems(self,ItAt_DemonHeart))
	{
		Npc_RemoveInvItems(self,ItSc_SumDemon,1);
		Npc_RemoveInvItems(self,ItAt_DemonHeart,1);
		B_CreateRune(ItRu_SumDemon);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_FullHeal_Info()
{
	if(Npc_HasItems(self,ItSc_FullHeal) && Npc_HasItems(self,ItPl_Health_Herb_03))
	{
		Npc_RemoveInvItems(self,ItSc_FullHeal,1);
		Npc_RemoveInvItems(self,ItPl_Health_Herb_03,1);
		B_CreateRune(ItRu_FullHeal);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Firerain_Info()
{
	if(Npc_HasItems(self,ItSc_Firerain) && Npc_HasItems(self,ItMi_Pitch) && Npc_HasItems(self,ItMi_Sulfur) && Npc_HasItems(self,ItAt_WaranFiretongue))
	{
		Npc_RemoveInvItems(self,ItSc_Firerain,1);
		Npc_RemoveInvItems(self,ItMi_Pitch,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		Npc_RemoveInvItems(self,ItAt_WaranFiretongue,1);
		B_CreateRune(ItRu_Firerain);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_BreathOfDeath_Info()
{
	if(Npc_HasItems(self,ItSc_BreathOfDeath) && Npc_HasItems(self,ItMi_Coal) && Npc_HasItems(self,ItMi_DarkPearl))
	{
		Npc_RemoveInvItems(self,ItSc_BreathOfDeath,1);
		Npc_RemoveInvItems(self,ItMi_Coal,1);
		Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
		B_CreateRune(ItRu_BreathOfDeath);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_MassDeath_Info()
{
	if(Npc_HasItems(self,ItSc_MassDeath) && Npc_HasItems(self,ItAt_SkeletonBone) && Npc_HasItems(self,ItMi_DarkPearl))
	{
		Npc_RemoveInvItems(self,ItSc_MassDeath,1);
		Npc_RemoveInvItems(self,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
		B_CreateRune(ItRu_MassDeath);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_ArmyOfDarkness_Info()
{
	if(Npc_HasItems(self,ItSc_ArmyOfDarkness) && Npc_HasItems(self,ItAt_SkeletonBone) && Npc_HasItems(self,ItMi_DarkPearl) && Npc_HasItems(self,ItAt_StoneGolemHeart) && Npc_HasItems(self,ItAt_DemonHeart))
	{
		Npc_RemoveInvItems(self,ItSc_ArmyOfDarkness,1);
		Npc_RemoveInvItems(self,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(self,ItAt_StoneGolemHeart,1);
		Npc_RemoveInvItems(self,ItAt_DemonHeart,1);
		B_CreateRune(ItRu_ArmyOfDarkness);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Shrink_Info()
{
	if(Npc_HasItems(self,ItSc_Shrink) && Npc_HasItems(self,ItAt_GoblinBone) && Npc_HasItems(self,ItAt_TrollTooth))
	{
		Npc_RemoveInvItems(self,ItSc_Shrink,1);
		Npc_RemoveInvItems(self,ItAt_GoblinBone,1);
		Npc_RemoveInvItems(self,ItAt_TrollTooth,1);
		B_CreateRune(ItRu_Shrink);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Whirlwind_Info()
{
	if(Npc_HasItems(self,ItSc_Whirlwind) && Npc_HasItems(self,ItAt_Wing))
	{
		Npc_RemoveInvItems(self,ItSc_Whirlwind,1);
		Npc_RemoveInvItems(self,ItAt_Wing,1);
		B_CreateRune(ItRu_Whirlwind);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Icelance_Info()
{
	if(Npc_HasItems(self,ItSc_Icelance) && Npc_HasItems(self,ItMi_Quartz))
	{
		Npc_RemoveInvItems(self,ItSc_Icelance,1);
		Npc_RemoveInvItems(self,ItMi_Quartz,1);
		B_CreateRune(ItRu_Icelance);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Thunderstorm_Info()
{
	if(Npc_HasItems(self,ItSc_Thunderstorm) && Npc_HasItems(self,ItMi_Quartz) && Npc_HasItems(self,ItAt_Wing))
	{
		Npc_RemoveInvItems(self,ItSc_Thunderstorm,1);
		Npc_RemoveInvItems(self,ItMi_Quartz,1);
		Npc_RemoveInvItems(self,ItAt_Wing,1);
		B_CreateRune(ItRu_Thunderstorm);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Geyser_Info()
{
	if(Npc_HasItems(self,ItSc_Geyser) && Npc_HasItems(self,ItMi_Aquamarine))
	{
		Npc_RemoveInvItems(self,ItSc_Geyser,1);
		Npc_RemoveInvItems(self,ItMi_Aquamarine,1);
		B_CreateRune(ItRu_Geyser);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

func void PC_ItRu_Waterfist_Info()
{
	if(Npc_HasItems(self,ItSc_Waterfist) && Npc_HasItems(self,ItMi_Aquamarine) && Npc_HasItems(self,ItMi_Rockcrystal))
	{
		Npc_RemoveInvItems(self,ItSc_Waterfist,1);
		Npc_RemoveInvItems(self,ItMi_Aquamarine,1);
		Npc_RemoveInvItems(self,ItMi_Rockcrystal,1);
		B_CreateRune(ItRu_Waterfist);
	}
	else
	{
		B_RuneProdItemsMissing();
	};
	B_EndProductionDialog();
};

