
var int FlasksCount;
var int BoozeStart;
var int TabakStart;
var int ManaStart;
var int HealthStart;
var int SpecialStart;

func int C_PlayerHasFlasks()
{
	if(FlasksCount > 0)
	{
		return TRUE;
	};
	AI_PrintScreen("Закончились чистые мензурки!",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	return FALSE;
};

func void potionalchemy_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		FlasksCount = Npc_HasItems(self,ItMi_Flask) + 1;
		Npc_RemoveInvItems(self,ItMi_Flask,Npc_HasItems(self,ItMi_Flask));
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PotionAlchemy;
		//AI_ProcessInfos(her);
		AI_ProcessInfos(self);
	};
};

func void B_BrewPotion(var int potion)
{
	AI_Wait(self,0.5);
	FlasksCount -= 1;
	CreateInvItem(self,potion);
	AI_PrintScreen(PRINT_AlchemySuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
};

func void B_BrewAlcohol(var int alcohol)
{
	AI_Wait(self,0.5);
	FlasksCount -= 1;
	CreateInvItem(self,alcohol);
	AI_PrintScreen(PRINT_AlcoholSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
};

instance PC_PotionAlchemy_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PotionAlchemy_End_Condition;
	information = PC_PotionAlchemy_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PotionAlchemy_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_End_Info()
{
	if(FlasksCount > 0)
	{
		CreateInvItems(self,ItMi_Flask,FlasksCount);
	};
	b_endproductiondialog();
};


instance PC_Booze_Start(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_Booze_Start_Condition;
	information = PC_Booze_Start_Info;
	permanent = TRUE;
	description = "Перегнать алкоголь";
};


func int PC_Booze_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Booze_Start_Info()
{
	BoozeStart = TRUE;
};


instance PC_Booze_Stop(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Booze_Stop_Condition;
	information = PC_Booze_Stop_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_Booze_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (BoozeStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_Booze_Stop_Info()
{
	BoozeStart = FALSE;
};


instance PC_Booze_Lou(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_Booze_Lou_Condition;
	information = PC_Booze_Lou_Info;
	permanent = TRUE;
	description = "'Молот Лу' (1 вода, 2 репы, 1 болотная трава, 1 зуб болотной акулы и 1 ром)";
};


func int PC_Booze_Lou_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (BoozeStart == TRUE) && (Knows_LousHammer == TRUE))
	{
		return TRUE;
	};
};

func void PC_Booze_Lou_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_SwampHerb) && (Npc_HasItems(self,ItPl_Beet) >= 2) && Npc_HasItems(self,ItAt_SharkTeeth) && Npc_HasItems(self,ItFo_Addon_Rum) && Npc_HasItems(self,ItFo_Water))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(self,ItPl_Beet,2);
		Npc_RemoveInvItems(self,ItAt_SharkTeeth,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
		Npc_RemoveInvItems(self,ItFo_Water,1);
		B_BrewAlcohol(ItFo_Addon_LousHammer);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Booze_Schlaf(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Booze_Schlaf_Condition;
	information = PC_Booze_Schlaf_Info;
	permanent = TRUE;
	description = "Двойной 'Молот Лу' (1 'Молот Лу' и 1 ром)";
};


func int PC_Booze_Schlaf_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (BoozeStart == TRUE) && (Knows_Schlafhammer == TRUE))
	{
		return TRUE;
	};
};

func void PC_Booze_Schlaf_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItFo_Addon_LousHammer) && Npc_HasItems(self,ItFo_Addon_Rum))
	{
		Npc_RemoveInvItems(self,ItFo_Addon_LousHammer,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
		B_BrewAlcohol(ItFo_Addon_SchlafHammer);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Booze_SchnellerHering(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_Booze_SchnellerHering_Condition;
	information = PC_Booze_SchnellerHering_Info;
	permanent = TRUE;
	description = "'Быстрая селедка' (1 вода, 1 ром, 1 рыба и 1 снеппер-трава)";
};


func int PC_Booze_SchnellerHering_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (BoozeStart == TRUE) && (Knows_SchnellerHering == TRUE))
	{
		return TRUE;
	};
};

func void PC_Booze_SchnellerHering_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_Speed_Herb_01) && (Npc_HasItems(self,ItFo_Fish) || Npc_HasItems(self,ItFo_SmellyFish)) && Npc_HasItems(self,ItFo_Addon_Rum) && Npc_HasItems(self,ItFo_Water))
	{
		Npc_RemoveInvItems(self,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
		if(Npc_HasItems(self,ItFo_Fish))
		{
			Npc_RemoveInvItems(self,ItFo_Fish,1);
		}
		else if(Npc_HasItems(self,ItFo_SmellyFish))
		{
			Npc_RemoveInvItems(self,ItFo_SmellyFish,1);
		};
		Npc_RemoveInvItems(self,ItFo_Water,1);
		B_BrewAlcohol(ItFo_Addon_SchnellerHering);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Charge_InnosEye(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_Charge_InnosEye_Condition;
	information = PC_Charge_InnosEye_Info;
	permanent = TRUE;
	description = "Зарядить Глаз Инноса";
};


func int PC_Charge_InnosEye_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == TRUE) && Npc_HasItems(self,ItMi_InnosEye_Discharged_Mis) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Charge_InnosEye_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItAt_IcedragonHeart) || Npc_HasItems(self,ItAt_RockdragonHeart) || Npc_HasItems(self,ItAt_FiredragonHeart) || Npc_HasItems(self,ItAt_SwampdragonHeart)) && (Npc_HasItems(self,ItMi_InnosEye_Discharged_Mis)))
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		if(Npc_HasItems(self,ItAt_SwampdragonHeart))
		{
			Npc_RemoveInvItems(self,ItAt_SwampdragonHeart,1);
		}
		else if(Npc_HasItems(self,ItAt_RockdragonHeart))
		{
			Npc_RemoveInvItems(self,ItAt_RockdragonHeart,1);
		}
		else if(Npc_HasItems(self,ItAt_FiredragonHeart))
		{
			Npc_RemoveInvItems(self,ItAt_FiredragonHeart,1);
		}
		else if(Npc_HasItems(self,ItAt_IcedragonHeart))
		{
			Npc_RemoveInvItems(self,ItAt_IcedragonHeart,1);
		};
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
		CreateInvItems(self,ItMi_InnosEye_MIS,1);
		AI_PrintScreen(PRINT_AlchemySuccessInnoseye,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Mana_Start(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Mana_Start_Condition;
	information = PC_Mana_Start_Info;
	permanent = TRUE;
	description = "Изготовить зелье маны";
};


func int PC_Mana_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (ManaStart == FALSE) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Mana_Start_Info()
{
	ManaStart = TRUE;
};


instance PC_Mana_Stop(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Mana_Stop_Condition;
	information = PC_Mana_Stop_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_Mana_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (ManaStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_Mana_Stop_Info()
{
	ManaStart = FALSE;
};


instance PC_ItPo_Mana_01(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_01_Condition;
	information = PC_ItPo_Mana_01_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_Mana_Essenz," (2 огненных крапивы и 1 луговой горец)");
};


func int PC_ItPo_Mana_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (ManaStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_01_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Mana_Herb_01) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Mana_Herb_01,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Mana_01);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Mana_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_02_Condition;
	information = PC_ItPo_Mana_02_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_Mana_Extrakt," (2 огненных травы и 1 луговой горец)");
};


func int PC_ItPo_Mana_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (ManaStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_02_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Mana_Herb_02) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Mana_02);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Mana_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_03_Condition;
	information = PC_ItPo_Mana_03_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_Mana_Elixier," (2 огненных корня, 1 луговой горец)");
};


func int PC_ItPo_Mana_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (ManaStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_03_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Mana_Herb_03) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Mana_Herb_03,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Mana_03);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Mana_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_04_Condition;
	information = PC_ItPo_Mana_04_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_Mana_Full," (3 эссенции маны, 1 луговой горец)");
};


func int PC_ItPo_Mana_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == TRUE) && (ManaStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_04_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPo_Mana_01) >= 3) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPo_Mana_01,3);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Mana_Addon_04);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Health_Start(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_Health_Start_Condition;
	information = PC_Health_Start_Info;
	permanent = TRUE;
	description = "Изготовить лечебное зелье";
};


func int PC_Health_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (HealthStart == FALSE) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Health_Start_Info()
{
	HealthStart = TRUE;
};


instance PC_Health_Stop(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Health_Stop_Condition;
	information = PC_Health_Stop_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_Health_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (HealthStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_Health_Stop_Info()
{
	HealthStart = FALSE;
};


instance PC_ItPo_Health_01(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Health_01_Condition;
	information = PC_ItPo_Health_01_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_HP_Essenz," (2 лечебные травы, 1 луговой горец)");
};


func int PC_ItPo_Health_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (HealthStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_01_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Health_Herb_01) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Health_Herb_01,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Health_01);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Health_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_02_Condition;
	information = PC_ItPo_Health_02_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_HP_Extrakt," (2 лечебных растения, 1 луговой горец)");
};


func int PC_ItPo_Health_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (HealthStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_02_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Health_Herb_02) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Health_02);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Health_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_03_Condition;
	information = PC_ItPo_Health_03_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_HP_Elixier," (2 лечебных корня, 1 луговой горец)");
};


func int PC_ItPo_Health_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (HealthStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_03_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Health_Herb_03) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Health_Herb_03,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Health_03);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Health_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_04_Condition;
	information = PC_ItPo_Health_04_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_HP_Full," (3 лечебные эссенции, 1 луговой горец)");
};


func int PC_ItPo_Health_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == TRUE) && (HealthStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_04_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPo_Health_01) >= 3) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPo_Health_01,3);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Health_Addon_04);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Special_Start(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_Special_Start_Condition;
	information = PC_Special_Start_Info;
	permanent = TRUE;
	description = "Изготовить особое зелье";
};


func int PC_Special_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (SpecialStart == FALSE) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Special_Start_Info()
{
	SpecialStart = TRUE;
};


instance PC_Special_Stop(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Special_Stop_Condition;
	information = PC_Special_Stop_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_Special_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_Special_Stop_Info()
{
	SpecialStart = FALSE;
};


instance PC_ItPo_Perm_Health(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Health_Condition;
	information = PC_ItPo_Perm_Health_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_HPMax_Elixier," (1 лечебный корень, 1 царский щавель)");
};


func int PC_ItPo_Perm_Health_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Health_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_Health_Herb_03) && Npc_HasItems(self,ItPl_Perm_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(self,ItPl_Perm_Herb,1);
		B_BrewPotion(ItPo_Perm_Health);
		TotalPermEaten += 1;
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Perm_Mana(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Mana_Condition;
	information = PC_ItPo_Perm_Mana_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ManaMax_Elixier," (1 огненный корень, 1 царский щавель)");
};


func int PC_ItPo_Perm_Mana_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Mana_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_Mana_Herb_03) && Npc_HasItems(self,ItPl_Perm_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(self,ItPl_Perm_Herb,1);
		B_BrewPotion(ItPo_Perm_Mana);
		TotalPermEaten += 1;
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Perm_MushroomMana(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_MushroomMana_Condition;
	information = PC_ItPo_Perm_MushroomMana_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_MushroomMana," (50 черных грибов, 1 луговая ягода)");
};


func int PC_ItPo_Perm_MushroomMana_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Knows_MushroomMana == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_MushroomMana_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_Mushroom_01) >= 50) && Npc_HasItems(self,ItPl_Planeberry))
	{
		Npc_RemoveInvItems(self,ItPl_Mushroom_01,50);
		Npc_RemoveInvItems(self,ItPl_Planeberry,1);
		B_BrewPotion(ItPo_Perm_MushroomMana);
		TotalMushroomsEaten += 50;
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Dex(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Dex_Condition;
	information = PC_ItPo_Dex_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_DEX_Elixier," (1 гоблинская ягода, 1 царский щавель)");
};


func int PC_ItPo_Dex_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Dex_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_Dex_Herb_01) && Npc_HasItems(self,ItPl_Perm_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Dex_Herb_01,1);
		Npc_RemoveInvItems(self,ItPl_Perm_Herb,1);
		B_BrewPotion(ItPo_Perm_DEX);
		TotalDexEaten += 1;
		TotalPermEaten += 1;
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Strg(C_Info)
{
	nr = 5;
	npc = PC_Hero;
	condition = PC_ItPo_Strg_Condition;
	information = PC_ItPo_Strg_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_STR_Elixier," (1 драконий корень, 1 царский щавель)");
};


func int PC_ItPo_Strg_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Strg_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_Strength_Herb_01) && Npc_HasItems(self,ItPl_Perm_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Strength_Herb_01,1);
		Npc_RemoveInvItems(self,ItPl_Perm_Herb,1);
		B_BrewPotion(ItPo_Perm_STR);
		TotalStrEaten += 1;
		TotalPermEaten += 1;
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Speed(C_Info)
{
	nr = 6;
	npc = PC_Hero;
	condition = PC_ItPo_Speed_Condition;
	information = PC_ItPo_Speed_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_Speed_Elixier," (1 снеппер-трава, 1 луговой горец)");
};


func int PC_ItPo_Speed_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Speed_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_Speed_Herb_01) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		Npc_RemoveInvItems(self,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		B_BrewPotion(ItPo_Speed);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_Addon_Geist(C_Info)
{
	nr = 7;
	npc = PC_Hero;
	condition = PC_ItPo_Addon_Geist_Condition;
	information = PC_ItPo_Addon_Geist_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_Geist," (2 жала кровавой мухи, 1 экстракт маны, 1 лечебная эссенция и 1 красный жгучий перец)");
};


func int PC_ItPo_Addon_Geist_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Knows_MCELIXIER == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_Addon_Geist_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItAt_Sting) >= 2) && Npc_HasItems(self,ItPo_Mana_02) && Npc_HasItems(self,ItPo_Health_01) && Npc_HasItems(self,ItFo_Addon_Pfeffer_01))
	{
		Npc_RemoveInvItems(self,ItAt_Sting,2);
		Npc_RemoveInvItems(self,ItPo_Mana_02,1);
		Npc_RemoveInvItems(self,ItPo_Health_01,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Pfeffer_01,1);
		if(Knows_Bloodfly == TRUE)
		{
			B_BrewPotion(ItPo_Addon_Geist_02);
		}
		else
		{
			B_BrewPotion(ItPo_Addon_Geist_01);
		};
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItPo_MegaDrink(C_Info)
{
	nr = 8;
	npc = PC_Hero;
	condition = PC_ItPo_MegaDrink_Condition;
	information = PC_ItPo_MegaDrink_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_MegaDrink," (10 драконьих яиц, 1 черная жемчужина, 1 сера)");
};


func int PC_ItPo_MegaDrink_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE) && (SpecialStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItPo_MegaDrink_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItAt_DragonEgg_MIS) >= 10) && Npc_HasItems(self,ItMi_DarkPearl) && Npc_HasItems(self,ItMi_Sulfur))
	{
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,10);
		Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(self,ItMi_Sulfur,1);
		B_BrewPotion(ItPo_MegaDrink);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_Tabak_Start(C_Info)
{
	npc = PC_Hero;
	nr = 11;
	condition = PC_Tabak_Start_Condition;
	information = PC_Tabak_Start_Info;
	permanent = TRUE;
	description = "Смешать табак или свернуть косяк";
};


func int PC_Tabak_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (TabakStart == FALSE) && (BoozeStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Tabak_Start_Info()
{
	TabakStart = TRUE;
};


instance PC_Tabak_Stop(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Tabak_Stop_Condition;
	information = PC_Tabak_Stop_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_Tabak_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (TabakStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_Tabak_Stop_Info()
{
	TabakStart = FALSE;
};


instance PC_ItMi_Joint(C_Info)
{
	nr = 10;
	npc = PC_Hero;
	condition = PC_ItMi_Joint_Condition;
	information = PC_ItMi_Joint_Info;
	permanent = TRUE;
	description = "Косяк из болотной травы (1 болотная трава)";
};


func int PC_ItMi_Joint_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (TabakStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMi_Joint_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if(Npc_HasItems(self,ItPl_SwampHerb))
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		CreateInvItems(self,ItMi_Joint,1);
		AI_PrintScreen(PRINT_JointSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItMi_Addon_Joint_01(C_Info)
{
	nr = 11;
	npc = PC_Hero;
	condition = PC_ItMi_Addon_Joint_01_Condition;
	information = PC_ItMi_Addon_Joint_01_Info;
	permanent = TRUE;
	description = "'Зеленый послушник' (2 болотных травы, 1 луговой горец)";
};


func int PC_ItMi_Addon_Joint_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (TabakStart == TRUE) && (Green_Extrem == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMi_Addon_Joint_01_Info()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else if((Npc_HasItems(self,ItPl_SwampHerb) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		Npc_RemoveInvItems(self,ItPl_SwampHerb,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		CreateInvItems(self,ItMi_Addon_Joint_01,1);
		AI_PrintScreen(PRINT_Addon_Joint_01_Success,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};


instance PC_ItMi_Tabak(C_Info)
{
	nr = 12;
	npc = PC_Hero;
	condition = PC_ItMi_Tabak_Condition;
	information = PC_ItMi_Tabak_Info;
	permanent = TRUE;
	description = "Смешать табак...";
};


func int PC_ItMi_Tabak_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && Npc_HasItems(self,ItMi_ApfelTabak) && (TabakStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMi_Tabak_Info()
{
	Info_ClearChoices(PC_ItMi_Tabak);
	Info_AddChoice(PC_ItMi_Tabak,Dialog_Back,PC_ItMi_Tabak_BACK);
	if(Npc_HasItems(self,ItFo_Honey))
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с медом",PC_ItMi_Tabak_Honey);
	};
	if(Npc_HasItems(self,ItPl_SwampHerb))
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с болотной травой",PC_ItMi_Tabak_Swampherb);
	};
	if(Npc_HasItems(self,ItPl_Mushroom_01))
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с черным грибом",PC_ItMi_Tabak_Mushroom_01);
	};
	if(Npc_HasItems(self,ItFo_Apple))
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с яблоком",PC_ItMi_Tabak_Double);
	};
};

func void PC_ItMi_Tabak_BACK()
{
	Info_ClearChoices(PC_ItMi_Tabak);
};

func void PC_ItMi_Tabak_Honey()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		Npc_RemoveInvItems(self,ItMi_ApfelTabak,1);
		Npc_RemoveInvItems(self,ItFo_Honey,1);
		CreateInvItems(self,ItMi_Honigtabak,1);
		AI_PrintScreen(PRINT_TabakSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	};
};

func void PC_ItMi_Tabak_Swampherb()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		Npc_RemoveInvItems(self,ItMi_ApfelTabak,1);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		CreateInvItems(self,ItMi_SumpfTabak,1);
		AI_PrintScreen(PRINT_TabakSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	};
};

func void PC_ItMi_Tabak_Mushroom_01()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		Npc_RemoveInvItems(self,ItMi_ApfelTabak,1);
		Npc_RemoveInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItMi_PilzTabak,1);
		AI_PrintScreen(PRINT_TabakSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	};
};

func void PC_ItMi_Tabak_Double()
{
	if(!C_PlayerHasFlasks())
	{
		b_endproductiondialog();
	}
	else
	{
		AI_Wait(self,0.5);
		FlasksCount -= 1;
		Npc_RemoveInvItems(self,ItMi_ApfelTabak,1);
		Npc_RemoveInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItMi_Doppeltabak,1);
		AI_PrintScreen(PRINT_TabakSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	};
};

