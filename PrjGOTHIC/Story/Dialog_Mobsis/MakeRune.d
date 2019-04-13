
func void makerune_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MakeRune;
		AI_ProcessInfos(her);
	};
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
	CreateInvItems(self,ItMi_RuneBlank,1);
	b_endproductiondialog();
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
		Info_AddChoice(PC_Circle_03,NAME_SPL_Thunderstorm,PC_ItRu_thunderstorm_Info);
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
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)))
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
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE) || (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE) || (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)))
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
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	{
		Info_AddChoice(PC_Circle_06,NAME_SPL_Shrink,PC_ItRu_Shrink_Info);
	};
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
		Info_AddChoice(PC_SPL_MasterOfDisaster,"Секрет библиотеки!",PC_SPL_MasterOfDisaster_Create);
	};
};

func void PC_SPL_MasterOfDisaster_BACK()
{
	Info_ClearChoices(PC_SPL_MasterOfDisaster);
};

func void PC_SPL_MasterOfDisaster_Create()
{
	if(Npc_HasItems(hero,ItMi_HolyWater) >= 1)
	{
		Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
		CreateInvItems(hero,ItRu_MasterOfDisaster,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};


instance PC_SPL_PalTeleportSecret(C_Info)
{
	npc = PC_Hero;
	condition = PC_SPL_PalTeleportSecret_Condition;
	information = PC_SPL_PalTeleportSecret_Info;
	permanent = TRUE;
	description = "Создать руну телепорта";
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
		Info_AddChoice(PC_SPL_PalTeleportSecret,"Секрет библиотеки!",PC_SPL_PalTeleportSecret_Create);
	};
};

func void PC_SPL_PalTeleportSecret_BACK()
{
	Info_ClearChoices(PC_SPL_PalTeleportSecret);
};

func void PC_SPL_PalTeleportSecret_Create()
{
	if(Npc_HasItems(hero,ItMi_HolyWater) >= 1)
	{
		Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
		CreateInvItems(hero,ItRu_PalTeleportSecret,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Light_Info()
{
	if((Npc_HasItems(hero,ItSc_Light) >= 1) && (Npc_HasItems(hero,ItMi_Gold) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Light,1);
		Npc_RemoveInvItems(hero,ItMi_Gold,1);
		CreateInvItems(hero,ItRu_Light,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Firebolt_Info()
{
	if((Npc_HasItems(hero,ItSc_Firebolt) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Firebolt,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItRu_FireBolt,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_LightHeal_Info()
{
	if((Npc_HasItems(hero,ItSc_LightHeal) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_LightHeal,1);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,1);
		CreateInvItems(hero,ItRu_LightHeal,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_SumGobSkel_Info()
{
	if((Npc_HasItems(hero,ItSc_SumGobSkel) >= 1) && (Npc_HasItems(hero,ItAt_GoblinBone) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_SumGobSkel,1);
		Npc_RemoveInvItems(hero,ItAt_GoblinBone,1);
		CreateInvItems(hero,ItRu_SumGobSkel,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Zap_Info()
{
	if((Npc_HasItems(hero,ItSc_Zap) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Zap,1);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
		CreateInvItems(hero,ItRu_Zap,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_InstFireball_Info()
{
	if((Npc_HasItems(hero,ItSc_InstantFireball) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_InstantFireball,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItems(hero,ItRu_InstantFireball,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Icebolt_Info()
{
	if((Npc_HasItems(hero,ItSc_Icebolt) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Icebolt,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,ItRu_Icebolt,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_SumWolf_Info()
{
	if((Npc_HasItems(hero,ItSc_SumWolf) >= 1) && (Npc_HasItems(hero,ItAt_WolfFur) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_SumWolf,1);
		Npc_RemoveInvItems(hero,ItAt_WolfFur,1);
		CreateInvItems(hero,ItRu_SumWolf,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Windfist_Info()
{
	if((Npc_HasItems(hero,ItSc_Windfist) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Windfist,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRu_Windfist,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Sleep_Info()
{
	if((Npc_HasItems(hero,ItSc_Sleep) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Sleep,1);
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		CreateInvItems(hero,ItRu_Sleep,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_MediumHeal_Info()
{
	if((Npc_HasItems(hero,ItSc_MediumHeal) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_MediumHeal,1);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1);
		CreateInvItems(hero,ItRu_MediumHeal,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_LightningFlash_Info()
{
	if((Npc_HasItems(hero,ItSc_LightningFlash) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_LightningFlash,1);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,ItRu_LightningFlash,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_ChargeFireball_Info()
{
	if((Npc_HasItems(hero,ItSc_ChargeFireBall) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_ChargeFireBall,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItem(hero,ItRu_ChargeFireball);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_SumSkel_Info()
{
	if((Npc_HasItems(hero,ItSc_SumSkel) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_SumSkel,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		CreateInvItems(hero,ItRu_SumSkel,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Fear_Info()
{
	if((Npc_HasItems(hero,ItSc_Fear) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Fear,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		CreateInvItems(hero,ItRu_Fear,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_IceCube_Info()
{
	if((Npc_HasItems(hero,ItSc_IceCube) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_IceCube,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		CreateInvItems(hero,ItRu_IceCube,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
	b_endproductiondialog();
};

func void PC_ItRu_ThunderBall_Info()
{
	if((Npc_HasItems(hero,ItSc_ThunderBall) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_ThunderBall,1);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItRu_ThunderBall,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_SumGol_Info()
{
	if((Npc_HasItems(hero,ItSc_SumGol) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_SumGol,1);
		Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
		CreateInvItems(hero,ItRu_SumGol,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_HarmUndead_Info()
{
	if((Npc_HasItems(hero,ItSc_HarmUndead) >= 1) && (Npc_HasItems(hero,ItMi_HolyWater) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_HarmUndead,1);
		Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
		CreateInvItems(hero,ItRu_HarmUndead,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Pyrokinesis_Info()
{
	if((Npc_HasItems(hero,ItSc_Pyrokinesis) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Pyrokinesis,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
		CreateInvItems(hero,ItRu_Pyrokinesis,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Firestorm_Info()
{
	if((Npc_HasItems(hero,ItSc_Firestorm) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Firestorm,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItRu_Firestorm,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_IceWave_Info()
{
	if((Npc_HasItems(hero,ItSc_IceWave) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_IceWave,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		CreateInvItems(hero,ItRu_IceWave,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_SumDemon_Info()
{
	if((Npc_HasItems(hero,ItSc_SumDemon) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_SumDemon,1);
		Npc_RemoveInvItems(hero,ItAt_DemonHeart,1);
		CreateInvItems(hero,ItRu_SumDemon,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_FullHeal_Info()
{
	if((Npc_HasItems(hero,ItSc_FullHeal) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_FullHeal,1);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		CreateInvItems(hero,ItRu_FullHeal,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Firerain_Info()
{
	if((Npc_HasItems(hero,ItSc_Firerain) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Firerain,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
		CreateInvItems(hero,ItRu_Firerain,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_BreathOfDeath_Info()
{
	if((Npc_HasItems(hero,ItSc_BreathOfDeath) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_BreathOfDeath,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		CreateInvItems(hero,ItRu_BreathOfDeath,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_MassDeath_Info()
{
	if((Npc_HasItems(hero,ItSc_MassDeath) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_MassDeath,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		CreateInvItems(hero,ItRu_MassDeath,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_ArmyOfDarkness_Info()
{
	if((Npc_HasItems(hero,ItSc_ArmyOfDarkness) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_ArmyOfDarkness,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
		Npc_RemoveInvItems(hero,ItAt_DemonHeart,1);
		CreateInvItems(hero,ItRu_ArmyOfDarkness,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Shrink_Info()
{
	if((Npc_HasItems(hero,ItSc_Shrink) >= 1) && (Npc_HasItems(hero,ItAt_GoblinBone) >= 1) && (Npc_HasItems(hero,ItAt_TrollTooth) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Shrink,1);
		Npc_RemoveInvItems(hero,ItAt_GoblinBone,1);
		Npc_RemoveInvItems(hero,ItAt_TrollTooth,1);
		CreateInvItems(hero,ItRu_Shrink,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Whirlwind_Info()
{
	if((Npc_HasItems(hero,ItSc_Whirlwind) >= 1) && (Npc_HasItems(hero,ItAt_Wing) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Whirlwind,1);
		Npc_RemoveInvItems(hero,ItAt_Wing,1);
		CreateInvItems(hero,ItRu_Whirlwind,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Icelance_Info()
{
	if((Npc_HasItems(hero,ItSc_Icelance) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Icelance,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,ItRu_Icelance,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_thunderstorm_Info()
{
	if((Npc_HasItems(hero,ItSc_Thunderstorm) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItAt_Wing) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Thunderstorm,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		Npc_RemoveInvItems(hero,ItAt_Wing,1);
		CreateInvItems(hero,ItRu_Thunderstorm,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Geyser_Info()
{
	if((Npc_HasItems(hero,ItSc_Geyser) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Geyser,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		CreateInvItems(hero,ItRu_Geyser,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

func void PC_ItRu_Waterfist_Info()
{
	if((Npc_HasItems(hero,ItSc_Waterfist) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1))
	{
		Npc_RemoveInvItems(hero,ItSc_Waterfist,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
		CreateInvItems(hero,ItRu_Waterfist,1);
		Print(PRINT_RuneSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_RuneBlank,1);
	};
	b_endproductiondialog();
};

