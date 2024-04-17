
func void stomp_s1()
{
	if(C_NpcIsHero(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_STOMP;
		AI_ProcessInfos(self);
	};
};

instance PC_Stomp_Start(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Stomp_Start_Condition;
	information = PC_Stomp_Start_Info;
	permanent = TRUE;
	description = "Обработать болотную траву";
};


func int PC_Stomp_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_STOMP)
	{
		return TRUE;
	};
};

func void PC_Stomp_Start_Info()
{
	Info_ClearChoices(PC_Stomp_Start);
	Info_AddChoice(PC_Stomp_Start,Dialog_Back,PC_Stomp_BACK);
	if(Green_Extrem == TRUE)
	{
		Info_AddChoice(PC_Stomp_Start,"Свернуть 'Зеленый послушник' (2 болотные травы, 1 луговой горец)",PC_Stomp_Joint);
	};
	Info_AddChoice(PC_Stomp_Start,"Свернуть косяк из болотной травы (1 болотная трава)",PC_Stomp_Swampherb);
};

func void PC_Stomp_BACK()
{
	Info_ClearChoices(PC_Stomp_Start);
};

func void PC_Stomp_Joint()
{
	if((Npc_HasItems(self,ItPl_SwampHerb) >= 2) && Npc_HasItems(self,ItPl_Temp_Herb))
	{
		AI_Wait(self,0.5);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,2);
		Npc_RemoveInvItems(self,ItPl_Temp_Herb,1);
		CreateInvItems(self,ItMi_Addon_Joint_01,1);
		AI_PrintScreen(PRINT_Addon_Joint_01_Success,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
		PC_Stomp_Start_Info();
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};

func void PC_Stomp_Swampherb()
{
	if(Npc_HasItems(self,ItPl_SwampHerb))
	{
		AI_Wait(self,0.5);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
		CreateInvItems(self,ItMi_Joint,1);
		AI_PrintScreen(PRINT_JointSuccess,-1,YPOS_GoldGiven,FONT_ScreenSmall,1);
		PC_Stomp_Start_Info();
	}
	else
	{
		AI_PrintScreen(PRINT_ProdItemsMissing,-1,YPOS_ItemGiven,FONT_ScreenSmall,1);
	};
};

instance PC_Stomp_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Stomp_End_Condition;
	information = PC_Stomp_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_Stomp_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_STOMP)
	{
		return TRUE;
	};
};

func void PC_Stomp_End_Info()
{
	B_EndProductionDialog();
};

