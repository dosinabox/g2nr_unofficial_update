
var int HotRawSwordsCount;
var int Erzwaffen;
var int Normalwaffen;

func int C_PlayerHasHotRawSwords()
{
	if(HotRawSwordsCount > 0)
	{
		return TRUE;
	};
	AI_PrintScreen("Закончилась раскаленная сталь!",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	return FALSE;
};

func void smithweapon_s1()
{
	var C_Npc her;
	var C_Item EquipWeap;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		HotRawSwordsCount = Npc_HasItems(self,ItMiSwordrawhot) + 1;
		Npc_RemoveInvItems(self,ItMiSwordrawhot,Npc_HasItems(self,ItMiSwordrawhot));
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SmithWeapon;
		if(Npc_HasEquippedMeleeWeapon(self))
		{
			EquipWeap = Npc_GetEquippedMeleeWeapon(self);
			if(Hlp_IsItem(EquipWeap,ItMw_1H_Mace_L_04))
			{
				AI_UnequipWeapons(self);
			};
		};
		//AI_ProcessInfos(her);
		AI_ProcessInfos(self);
	};
};

func int smithweapon_cond()
{
	var C_Item EquipWeap;
	if(Npc_IsPlayer(self))
	{
		if(Npc_HasItems(self,ItMw_1H_Mace_L_04) && Npc_HasEquippedMeleeWeapon(self))
		{
			EquipWeap = Npc_GetEquippedMeleeWeapon(self);
			if(Hlp_IsItem(EquipWeap,ItMw_1H_Mace_L_04))
			{
				AI_UnequipWeapons(self);
			};
		}
		else
		{
			AI_UseMob(self,"BSANVIL",0);
			AI_UseMob(self,"BSANVIL",-1);
			AI_PrintScreen("нужен молот",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			AI_PlayAni(self,"T_DONTKNOW");
		};
	};
	return TRUE;
};

func void B_CountAnvilUses()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_GetDistToWP(self,"NW_CITY_SMITH_ANVIL") <= 1000)
		{
			HaradsAnvilUsed += 1;
		};
	};
	AnyAnvilUsed += 1;
};

func void B_CraftSword(var int sword,var int ore,var int blood)
{
	if((ore == 0) && (blood == 0))
	{
		AI_Wait(self,0.5);
	}
	else
	{
		if(((ore > 0) && (Npc_HasItems(self,ItMi_Nugget) < ore)) || ((blood > 0) && (Npc_HasItems(self,ItAt_DragonBlood) < blood)))
		{
			AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
			return;
		};
		Npc_RemoveInvItems(self,ItMi_Nugget,ore);
		Npc_RemoveInvItems(self,ItAt_DragonBlood,blood);
		AI_Wait(self,1.5);
	};
	HotRawSwordsCount -= 1;
	CreateInvItem(self,sword);
	AI_PrintScreen(PRINT_SmithSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
	B_CountAnvilUses();
};

instance PC_SmithWeapon_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SmithWeapon_End_Condition;
	information = PC_SmithWeapon_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_SmithWeapon_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_SmithWeapon_End_Info()
{
	if(HotRawSwordsCount > 0)
	{
		CreateInvItems(self,ItMiSwordraw,HotRawSwordsCount);
	};
	b_endproductiondialog();
};


instance PC_Common(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Common_Condition;
	information = PC_Common_Info;
	permanent = TRUE;
	description = "Выковать обычное оружие";
};


func int PC_Common_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_Common_Info()
{
	Normalwaffen = TRUE;
};


instance PC_Ore(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Ore_Condition;
	information = PC_Ore_Info;
	permanent = TRUE;
	description = "Выковать рудное оружие";
};


func int PC_Ore_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_Ore_Info()
{
	Erzwaffen = TRUE;
};


instance PC_CommonBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_CommonBACK_Condition;
	information = PC_CommonBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_CommonBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == TRUE) && (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_CommonBACK_Info()
{
	Normalwaffen = FALSE;
};


instance PC_OreBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_OreBACK_Condition;
	information = PC_OreBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_OreBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_OreBACK_Info()
{
	Erzwaffen = FALSE;
};


instance PC_ItMw_1H_Common(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_ItMw_1H_Common_Condition;
	information = PC_ItMw_1H_Common_Info;
	permanent = TRUE;
	description = NAME_ItMw_1H_Common_01;
};


func int PC_ItMw_1H_Common_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Common_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_1H_Common_01,0,0);
	};
};


instance PC_WEAPON_1H_Harad_01(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_WEAPON_1H_Harad_01_Condition;
	information = PC_WEAPON_1H_Harad_01_Info;
	permanent = TRUE;
	description = NAME_Addon_Harad_01;
};


func int PC_WEAPON_1H_Harad_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_01_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_Schwert1,0,0);
	};
};


instance PC_WEAPON_1H_Harad_02(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_WEAPON_1H_Harad_02_Condition;
	information = PC_WEAPON_1H_Harad_02_Info;
	permanent = TRUE;
	description = NAME_Addon_Harad_02;
};


func int PC_WEAPON_1H_Harad_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_02_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_Schwert4,0,0);
	};
};


instance PC_WEAPON_1H_Harad_03(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_WEAPON_1H_Harad_03_Condition;
	information = PC_WEAPON_1H_Harad_03_Info;
	permanent = TRUE;
	description = NAME_Addon_Harad_03;
};


func int PC_WEAPON_1H_Harad_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_03_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_Rubinklinge,0,0);
	};
};


instance PC_WEAPON_1H_Harad_04(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_WEAPON_1H_Harad_04_Condition;
	information = PC_WEAPON_1H_Harad_04_Info;
	permanent = TRUE;
	description = NAME_Addon_Harad_04;
};


func int PC_WEAPON_1H_Harad_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_04_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_ElBastardo,0,0);
	};
};


instance PC_ItMw_1H_Special_01(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_ItMw_1H_Special_01_Condition;
	information = PC_ItMw_1H_Special_01_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_1H_Special_01,PRINT_Smith_1H_Special_01);
};


func int PC_ItMw_1H_Special_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_01_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_1H_Special_01,1,0);
	};
};


instance PC_ItMw_2H_Special_01(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_ItMw_2H_Special_01_Condition;
	information = PC_ItMw_2H_Special_01_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_2H_Special_01,PRINT_Smith_2H_Special_01);
};


func int PC_ItMw_2H_Special_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_01_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_2H_Special_01,2,0);
	};
};


instance PC_ItMw_1H_Special_02(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_ItMw_1H_Special_02_Condition;
	information = PC_ItMw_1H_Special_02_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_1H_Special_02,PRINT_Smith_1H_Special_02);
};


func int PC_ItMw_1H_Special_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_02_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_1H_Special_02,2,0);
	};
};


instance PC_ItMw_2H_Special_02(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_ItMw_2H_Special_02_Condition;
	information = PC_ItMw_2H_Special_02_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_2H_Special_02,PRINT_Smith_2H_Special_02);
};


func int PC_ItMw_2H_Special_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_02_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_2H_Special_02,3,0);
	};
};


instance PC_ItMw_1H_Special_03(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_ItMw_1H_Special_03_Condition;
	information = PC_ItMw_1H_Special_03_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_1H_Special_03,PRINT_Smith_1H_Special_03);
};


func int PC_ItMw_1H_Special_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_03_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_1H_Special_03,3,0);
	};
};


instance PC_ItMw_2H_Special_03(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_ItMw_2H_Special_03_Condition;
	information = PC_ItMw_2H_Special_03_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_2H_Special_03,PRINT_Smith_2H_Special_03);
};


func int PC_ItMw_2H_Special_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_03_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_2H_Special_03,4,0);
	};
};


instance PC_ItMw_1H_Special_04(C_Info)
{
	npc = PC_Hero;
	nr = 8;
	condition = PC_ItMw_1H_Special_04_Condition;
	information = PC_ItMw_1H_Special_04_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_1H_Special_04,PRINT_Smith_1H_Special_04);
};


func int PC_ItMw_1H_Special_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_04_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_1H_Special_04,4,5);
	};
};


instance PC_ItMw_2H_Special_04(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_ItMw_2H_Special_04_Condition;
	information = PC_ItMw_2H_Special_04_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_2H_Special_04,PRINT_Smith_2H_Special_04);
};


func int PC_ItMw_2H_Special_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_04_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		B_CraftSword(ItMw_2H_Special_04,5,5);
	};
};


instance PC_ItMw_Streitaxt1(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_ItMw_Streitaxt1_Condition;
	information = PC_ItMw_Streitaxt1_Info;
	permanent = TRUE;
	description = ConcatStrings(NAME_ItMw_Banditenaxt,PRINT_Smith_Streitaxt1);
};


func int PC_ItMw_Streitaxt1_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Knows_Banditenaxt == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_Streitaxt1_Info()
{
	if(!C_PlayerHasHotRawSwords())
	{
		b_endproductiondialog();
	}
	else
	{
		if((Npc_HasItems(self,ItAt_Teeth) < 3) || (HotRawSwordsCount < 2))
		{
			AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
		}
		else
		{
			Npc_RemoveInvItems(self,ItAt_Teeth,3);
			HotRawSwordsCount -= 1;
			B_CraftSword(ItMw_Banditenaxt,1,0);
		};
	};
};

