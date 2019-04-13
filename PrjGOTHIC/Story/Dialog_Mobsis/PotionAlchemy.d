
func void potionalchemy_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PotionAlchemy;
		AI_ProcessInfos(her);
	};
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
	CreateInvItems(self,ItMi_Flask,1);
	b_endproductiondialog();
};


var int BoozeStart;

instance PC_Booze_Start(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_Booze_Start_Condition;
	information = PC_Booze_Start_Info;
	permanent = TRUE;
	description = "ѕерегнать алкоголь";
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
	description = "ѕопробовать сделать 'ћолот Ћу'";
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
	if((Npc_HasItems(self,ItPl_SwampHerb) >= 1) && (Npc_HasItems(self,ItPl_Beet) >= 2) && (Npc_HasItems(self,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 1))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(self,ItPl_Beet,2);
		Npc_RemoveInvItems(self,ItAt_SharkTeeth,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
		Print(PRINT_AlchemySuccess);
		CreateInvItems(self,ItFo_Addon_LousHammer,1);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_Booze_Schlaf(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Booze_Schlaf_Condition;
	information = PC_Booze_Schlaf_Info;
	permanent = TRUE;
	description = "ћолот Ћу с двойным ромом";
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
	if((Npc_HasItems(self,ItPl_SwampHerb) >= 1) && (Npc_HasItems(self,ItPl_Beet) >= 2) && (Npc_HasItems(self,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 2))
	{
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(self,ItPl_Beet,2);
		Npc_RemoveInvItems(self,ItAt_SharkTeeth,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Rum,2);
		Print(PRINT_AlchemySuccess);
		CreateInvItems(self,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_Booze_SchnellerHering(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_Booze_SchnellerHering_Condition;
	information = PC_Booze_SchnellerHering_Info;
	permanent = TRUE;
	description = "—делать 'Ѕыструю селедку'";
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
	if((Npc_HasItems(self,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(self,ItFo_Fish) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 1))
	{
		Npc_RemoveInvItems(self,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
		Npc_RemoveInvItems(self,ItFo_Fish,1);
		Print(PRINT_AlchemySuccess);
		CreateInvItems(self,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_Charge_InnosEye(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_Charge_InnosEye_Condition;
	information = PC_Charge_InnosEye_Info;
	permanent = TRUE;
	description = "«ар€дить √лаз »нноса";
};


func int PC_Charge_InnosEye_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == TRUE) && (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_Charge_InnosEye_Info()
{
	if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) && (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
	{
		if(Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_SwampdragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_RockdragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_FiredragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_IcedragonHeart,1);
		};
		Npc_RemoveInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
		CreateInvItems(hero,ItMi_InnosEye_MIS,1);
		Print(PRINT_AlchemySuccessInnoseye);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


var int ManaStart;

instance PC_Mana_Start(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Mana_Start_Condition;
	information = PC_Mana_Start_Info;
	permanent = TRUE;
	description = "»зготовить зелье маны";
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
	description = "Ёссенци€ маны (2 огненных крапивы и 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPl_Mana_Herb_01) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_01,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_01,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Mana_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_02_Condition;
	information = PC_ItPo_Mana_02_Info;
	permanent = TRUE;
	description = "Ёкстракт маны (2 огненных травы и 1 луговой горец) ";
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
	if((Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_02,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Mana_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_03_Condition;
	information = PC_ItPo_Mana_03_Info;
	permanent = TRUE;
	description = "Ёликсир маны (2 огненных корн€ и 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_03,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Mana_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_04_Condition;
	information = PC_ItPo_Mana_04_Info;
	permanent = TRUE;
	description = "„иста€ мана (3 эссенции маны, 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPo_Mana_01) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPo_Mana_01,3);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Mana_Addon_04,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


var int HealthStart;

instance PC_Health_Start(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_Health_Start_Condition;
	information = PC_Health_Start_Info;
	permanent = TRUE;
	description = "»зготовить лечебное зелье";
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
	description = "Ћечебна€ эссенци€ (2 лечебные травы и 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPl_Health_Herb_01) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItem(hero,ItPo_Health_01);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Health_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_02_Condition;
	information = PC_ItPo_Health_02_Info;
	permanent = TRUE;
	description = "Ћечебный экстракт (2 лечебных растени€ и 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_02,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Health_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_03_Condition;
	information = PC_ItPo_Health_03_Info;
	permanent = TRUE;
	description = "Ћечебный эликсир (2 лечебных корн€ и 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPl_Health_Herb_03) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_03,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Health_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_04_Condition;
	information = PC_ItPo_Health_04_Info;
	permanent = TRUE;
	description = "„истое здоровье (3 лечебные эссенции, 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPo_Health_01) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPo_Health_01,3);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Health_Addon_04,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


var int SpecialStart;

instance PC_Special_Start(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_Special_Start_Condition;
	information = PC_Special_Start_Info;
	permanent = TRUE;
	description = "»зготовить особое зелье";
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


instance PC_ItPo_Addon_Geist(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Addon_Geist_Condition;
	information = PC_ItPo_Addon_Geist_Info;
	permanent = TRUE;
	description = "Ёликсир изменени€ сознани€";
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
	if((Npc_HasItems(hero,ItAt_Sting) >= 2) && (Npc_HasItems(hero,ItPo_Mana_02) >= 1) && (Npc_HasItems(hero,ItPo_Health_01) >= 1) && (Npc_HasItems(hero,ItFo_Addon_Pfeffer_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItAt_Sting,2);
		Npc_RemoveInvItems(hero,ItPo_Mana_02,1);
		Npc_RemoveInvItems(hero,ItPo_Health_01,1);
		Npc_RemoveInvItems(hero,ItFo_Addon_Pfeffer_01,1);
		if(Knows_Bloodfly == TRUE)
		{
			CreateInvItems(hero,ItPo_Addon_Geist_02,1);
		}
		else
		{
			CreateInvItems(hero,ItPo_Addon_Geist_01,1);
		};
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Perm_Health(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Health_Condition;
	information = PC_ItPo_Perm_Health_Info;
	permanent = TRUE;
	description = "Ёликсир жизни (1 лечебный корень и 1 царский щавель)";
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
	if((Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_Health,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Perm_Mana(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Mana_Condition;
	information = PC_ItPo_Perm_Mana_Info;
	permanent = TRUE;
	description = "Ёликсир духа (1 огненный корень и 1 царский щавель)";
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
	if((Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_Mana,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Dex(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Dex_Condition;
	information = PC_ItPo_Dex_Info;
	permanent = TRUE;
	description = "Ёликсир ловкости (1 гоблинские €годы и 1 царский щавель.)";
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
	if((Npc_HasItems(hero,ItPl_Dex_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Dex_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_DEX,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Strg(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Strg_Condition;
	information = PC_ItPo_Strg_Info;
	permanent = TRUE;
	description = "Ёликсир силы (1 драконий корень и 1 царский щавель.)";
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
	if((Npc_HasItems(hero,ItPl_Strength_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Strength_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		CreateInvItems(hero,ItPo_Perm_STR,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItPo_Speed(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Speed_Condition;
	information = PC_ItPo_Speed_Info;
	permanent = TRUE;
	description = "«елье ускорени€ (1 снеппер-трава и 1 луговой горец)";
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
	if((Npc_HasItems(hero,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItPo_Speed,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


var int TabakStart;

instance PC_Tabak_Start(C_Info)
{
	npc = PC_Hero;
	nr = 11;
	condition = PC_Tabak_Start_Condition;
	information = PC_Tabak_Start_Info;
	permanent = TRUE;
	description = "—мешать табак или свернуть кос€к";
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
	description = "ќбработать болотную траву (1 кос€к)";
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
	if(Npc_HasItems(hero,ItPl_SwampHerb) >= 1)
	{
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		CreateInvItems(hero,ItMi_Joint,1);
		Print(PRINT_JointSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItMi_Addon_Joint_01(C_Info)
{
	nr = 11;
	npc = PC_Hero;
	condition = PC_ItMi_Addon_Joint_01_Condition;
	information = PC_ItMi_Addon_Joint_01_Info;
	permanent = TRUE;
	description = "»зготовить '«еленого послушника' (1 кос€к)";
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
	if((Npc_HasItems(hero,ItPl_SwampHerb) >= 2) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItMi_Addon_Joint_01,1);
		Print(PRINT_Addon_Joint_01_Success);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};


instance PC_ItMi_Tabak(C_Info)
{
	nr = 10;
	npc = PC_Hero;
	condition = PC_ItMi_Tabak_Condition;
	information = PC_ItMi_Tabak_Info;
	permanent = TRUE;
	description = "—мешать табак ...";
};


func int PC_ItMi_Tabak_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Npc_HasItems(hero,ItMi_ApfelTabak) >= 1) && (TabakStart == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMi_Tabak_Info()
{
	Npc_RemoveInvItems(hero,ItMi_ApfelTabak,1);
	Info_ClearChoices(PC_ItMi_Tabak);
	Info_AddChoice(PC_ItMi_Tabak,Dialog_Back,PC_ItMi_Tabak_BACK);
	if(Npc_HasItems(hero,ItFo_Honey) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с медом",PC_ItMi_Tabak_Honey);
	};
	if(Npc_HasItems(hero,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с болотной травой",PC_ItMi_Tabak_Swampherb);
	};
	if(Npc_HasItems(hero,ItPl_Mushroom_01) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с черным грибом",PC_ItMi_Tabak_Mushroom_01);
	};
};

func void PC_ItMi_Tabak_BACK()
{
	Info_ClearChoices(PC_ItMi_Tabak);
};

func void PC_ItMi_Tabak_Honey()
{
	CreateInvItems(hero,ItMi_Honigtabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};

func void PC_ItMi_Tabak_Swampherb()
{
	CreateInvItems(hero,ItMi_SumpfTabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};

func void PC_ItMi_Tabak_Mushroom_01()
{
	CreateInvItems(hero,ItMi_PilzTabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};


instance PC_ItPo_MegaDrink(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_MegaDrink_Condition;
	information = PC_ItPo_MegaDrink_Info;
	permanent = TRUE;
	description = "«елье из драконьих €иц (10 драконьих €иц, 1 черный жемчуг, 1 сера)";
};


func int PC_ItPo_MegaDrink_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE) && (BoozeStart == FALSE) && (TabakStart == FALSE) && (HealthStart == FALSE) && (ManaStart == FALSE) && (SpecialStart == FALSE))
	{
		return TRUE;
	};
};

func void PC_ItPo_MegaDrink_Info()
{
	if((Npc_HasItems(hero,ItAt_DragonEgg_MIS) >= 10) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,ItAt_DragonEgg_MIS,10);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItPo_MegaDrink,1);
		Print(PRINT_AlchemySuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};

