
func int B_GoldMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_01") && (GoldMob_01_AmounT_MAX > GoldMob_01_Amount))
	{
		GoldMob_01_Amount = GoldMob_01_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_02") && (GoldMob_02_AmounT_MAX > GoldMob_02_Amount))
	{
		GoldMob_02_Amount = GoldMob_02_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_03") && (GoldMob_03_AmounT_MAX > GoldMob_03_Amount))
	{
		GoldMob_03_Amount = GoldMob_03_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_04") && (GoldMob_04_AmounT_MAX > GoldMob_04_Amount))
	{
		GoldMob_04_Amount = GoldMob_04_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_SIDE_PICK_01") && (GoldMob_05_AmounT_MAX > GoldMob_05_Amount))
	{
		GoldMob_05_Amount = GoldMob_05_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_SIDE_PICK_02") && (GoldMob_06_AmounT_MAX > GoldMob_06_Amount))
	{
		GoldMob_06_Amount = GoldMob_06_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_06") && (GoldMob_07_AmounT_MAX > GoldMob_07_Amount))
	{
		GoldMob_07_Amount = GoldMob_07_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_01") && (GoldMob_08_AmounT_MAX > GoldMob_08_Amount))
	{
		GoldMob_08_Amount = GoldMob_08_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_02") && (GoldMob_09_AmounT_MAX > GoldMob_09_Amount))
	{
		GoldMob_09_Amount = GoldMob_09_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_03") && (GoldMob_10_AmounT_MAX > GoldMob_10_Amount))
	{
		GoldMob_10_Amount = GoldMob_10_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_04") && (GoldMob_11_AmounT_MAX > GoldMob_11_Amount))
	{
		GoldMob_11_Amount = GoldMob_11_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_09_PICK") && (GoldMob_12_AmounT_MAX > GoldMob_12_Amount))
	{
		GoldMob_12_Amount = GoldMob_12_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_TO_MC_04_B") && (GoldMob_13_AmounT_MAX > GoldMob_13_Amount))
	{
		GoldMob_13_Amount = GoldMob_13_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_06") && (GoldMob_14_AmounT_MAX > GoldMob_14_Amount))
	{
		GoldMob_14_Amount = GoldMob_14_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_07") && (GoldMob_15_AmounT_MAX > GoldMob_15_Amount))
	{
		GoldMob_15_Amount = GoldMob_15_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_08") && (GoldMob_16_AmounT_MAX > GoldMob_16_Amount))
	{
		GoldMob_16_Amount = GoldMob_16_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_09") && (GoldMob_17_AmounT_MAX > GoldMob_17_Amount))
	{
		GoldMob_17_Amount = GoldMob_17_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_19") && (GoldMob_18_AmounT_MAX > GoldMob_18_Amount))
	{
		GoldMob_18_Amount = GoldMob_18_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_SLAVE_01") && (GoldMob_19_AmounT_MAX > GoldMob_19_Amount))
	{
		GoldMob_19_Amount = GoldMob_19_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_05") && (GoldMob_20_AmounT_MAX > GoldMob_20_Amount))
	{
		GoldMob_20_Amount = GoldMob_20_Amount + 1;
		return TRUE;
	};
	return FALSE;
};

func void Goldhacken_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_GOLDHACKEN;
		AI_ProcessInfos(her);
	};
};


instance PC_Goldhacken_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Goldhacken_End_Condition;
	information = PC_Goldhacken_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_Goldhacken_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void PC_Goldhacken_End_Info()
{
	Truemmer_Count = 0;
	b_endproductiondialog();
};


instance PC_Goldhacken_Addon_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Goldhacken_Addon_Hour_Condition;
	information = PC_Goldhacken_Addon_Hour_Info;
	permanent = TRUE;
	description = "Ударить несильно.";
};


func int PC_Goldhacken_Addon_Hour_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};


var int GoldCounter;

func void PC_Goldhacken_Addon_Hour_Info()
{
	var int CurrentChance;
	var int MultiNugget;
	Learn_by_doing = Learn_by_doing + 1;
	if(Learn_by_doing == 10)
	{
		B_Upgrade_Hero_HackChance(2);
	}
	else if(Learn_by_doing == 15)
	{
		B_Upgrade_Hero_HackChance(3);
	}
	else if(Learn_by_doing == 20)
	{
		B_Upgrade_Hero_HackChance(5);
	};
	CurrentChance = Hlp_Random(100);
	MultiNugget = Hlp_Random(10);
	if(B_GoldMob_Bestimmung() == TRUE)
	{
		if(CurrentChance <= Hero_HackChance)
		{
			if((GoldCounter >= 20) && (MultiNugget >= 8))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,3);
				PrintScreen("Добыто 3 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
				Truemmer_Count = 0;
			}
			else if((GoldCounter >= 7) && (MultiNugget >= 5))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,2);
				PrintScreen("Добыто 2 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
				Truemmer_Count = 0;
				GoldCounter = GoldCounter + 1;
			}
			else
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,1);
				PrintScreen("Добыт 1 золотой самородок!",-1,-1,FONT_ScreenSmall,2);
				Truemmer_Count = 0;
				GoldCounter = GoldCounter + 1;
			};
		}
		else
		{
			PrintScreen("Золотые осколки разлетаются во все стороны...",-1,-1,FONT_ScreenSmall,2);
			Truemmer_Count = Truemmer_Count + 1;
		};
	}
	else
	{
		PrintScreen("Здесь больше нечего делать.",-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};
};


instance PC_Goldhacken_Addon_TSchlag(C_Info)
{
	npc = PC_Hero;
	nr = 997;
	condition = PC_Goldhacken_Addon_TSchlag_Condition;
	information = PC_Goldhacken_Addon_TSchlag_Info;
	permanent = TRUE;
	description = "Ударить изо всех сил.";
};


func int PC_Goldhacken_Addon_TSchlag_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (Truemmer_Count >= 2) && (Knows_Truemmerschlag == TRUE))
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Addon_TSchlag_Info()
{
	var int TruemmerChance;
	TruemmerChance = Hlp_Random(100);
	if(TruemmerChance < 5)
	{
		PrintScreen("Ничего...",-1,-1,FONT_ScreenSmall,2);
	}
	else
	{
		Snd_Play("RAVENS_EARTHQUAKE3");
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		if(TruemmerChance >= 85)
		{
			CreateInvItems(hero,ItMi_GoldNugget_Addon,3);
			PrintScreen("Добыто 3 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
		}
		else if(TruemmerChance >= 50)
		{
			CreateInvItems(hero,ItMi_GoldNugget_Addon,2);
			PrintScreen("Добыто 2 золотых самородка!",-1,-1,FONT_ScreenSmall,2);
		}
		else
		{
			CreateInvItems(hero,ItMi_GoldNugget_Addon,1);
			PrintScreen("Добыт 1 золотой самородок!",-1,-1,FONT_ScreenSmall,2);
		};
	};
	Truemmer_Count = 0;
};


instance PC_Goldhacken_Addon_Chance(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = PC_Goldhacken_Addon_Chance_Condition;
	information = PC_Goldhacken_Addon_Chance_Info;
	permanent = TRUE;
	description = "(проверить свой навык)";
};


func int PC_Goldhacken_Addon_Chance_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Addon_Chance_Info()
{
	var string concatText;
	if(Hero_HackChance < 20)
	{
		concatText = ConcatStrings("совершенный новичок (",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 40)
	{
		concatText = ConcatStrings("вполне сносный работник (",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 55)
	{
		concatText = ConcatStrings("опытный золотоискатель (",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 75)
	{
		concatText = ConcatStrings("настоящий рудокоп ( ",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 90)
	{
		concatText = ConcatStrings("чертовски хороший рудокоп ( ",IntToString(Hero_HackChance));
	}
	else if(Hero_HackChance < 98)
	{
		concatText = ConcatStrings("великий рудокоп ( ",IntToString(Hero_HackChance));
	}
	else
	{
		concatText = ConcatStrings("гуру среди рудокопов ( ",IntToString(Hero_HackChance));
	};
	concatText = ConcatStrings(concatText," проц.)");
	PrintScreen(concatText,-1,-1,FONT_ScreenSmall,2);
};

