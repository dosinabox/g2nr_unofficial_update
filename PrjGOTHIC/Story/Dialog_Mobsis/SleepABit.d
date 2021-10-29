
func void sleepabit_s1()
{
	if(C_NpcIsHero(self) || C_NpcIsRockefeller(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SleepAbit;
		AI_ProcessInfos(self);
		if(SC_IsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
	};
};

func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t += 24;
		Wld_SetTime(t,0);
	};
	Wld_StopEffect("DEMENTOR_FX");
	if(SC_IsObsessed == TRUE)
	{
		PrintScreen(PRINT_SleepOverObsessed,-1,-1,FONT_Screen,2);
	}
	else
	{
//		B_Say_Overlay(hero,hero,"$AWAKE");
		PrintScreen(PRINT_SleepOver,-1,-1,FONT_Screen,2);
		BeerDay = 0;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	};
	if(Parlan_DontTalkToNovice == LOG_FAILED)
	{
		Parlan_DontTalkToNovice = LOG_Running;
	};
	B_CheckLog();
	B_CoolHotDraw(hero);
	B_ClearFakeItems(hero);
//	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_SleepTime_Morning(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SleepTime_Morning_Condition;
	information = PC_SleepTime_Morning_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до утра";
};


func int PC_SleepTime_Morning_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(8);
};


instance PC_SleepTime_Noon(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_SleepTime_Noon_Condition;
	information = PC_SleepTime_Noon_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до полудня";
};


func int PC_SleepTime_Noon_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};


instance PC_SleepTime_Evening(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_SleepTime_Evening_Condition;
	information = PC_SleepTime_Evening_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до вечера";
};


func int PC_SleepTime_Evening_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(20);
};


instance PC_SleepTime_Midnight(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_SleepTime_Midnight_Condition;
	information = PC_SleepTime_Midnight_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до полуночи";
};


func int PC_SleepTime_Midnight_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
};


instance PC_SleepTime_Dawn(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_SleepTime_Dawn_Condition;
	information = PC_SleepTime_Dawn_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Спать до рассвета";
};


func int PC_SleepTime_Dawn_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Dawn_Info()
{
	PC_Sleep(5);
};

