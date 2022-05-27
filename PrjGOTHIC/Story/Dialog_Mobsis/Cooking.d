
func int pan_cond()
{
	if(Npc_IsPlayer(self))
	{
		if(!Npc_HasItems(self,ItMi_Pan) || !Npc_HasItems(self,ItFoMuttonRaw))
		{
			AI_PlayAni(self,"T_DONTKNOW");
			if(!Npc_HasItems(self,ItMi_Pan) && !Npc_HasItems(self,ItFoMuttonRaw))
			{
				AI_PrintScreen("Требуется сковорода и сырое мясо!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			}
			else if(!Npc_HasItems(self,ItMi_Pan))
			{
				AI_PrintScreen("Требуется сковорода!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			}
			else if(!Npc_HasItems(self,ItFoMuttonRaw))
			{
				AI_PrintScreen("Требуется сырое мясо!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			};
			return FALSE;
		};
	};
	return TRUE;
};

func void pan_s1()
{
	if(C_NpcIsHero(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PAN;
		AI_ProcessInfos(self);
	};
};

func void stove_s1()
{
	if(C_NpcIsHero(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PAN;
		AI_ProcessInfos(self);
	};
};

instance PC_PAN_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_pan_1_condition;
	information = pc_pan_1_info;
	important = FALSE;
	permanent = TRUE;
	description = "Пожарить все куски сырого мяса";
};


func int pc_pan_1_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PAN)
	{
		return TRUE;
	};
};

func void pc_pan_1_info()
{
	var int amount;
	amount = Npc_HasItems(self,ItFoMuttonRaw);
	if(amount <= 10)
	{
		AI_Wait(self,1);
	}
	else if(amount <= 30)
	{
		AI_Wait(self,3);
	}
	else if(amount <= 50)
	{
		AI_Wait(self,5);
	}
	else if(amount > 50)
	{
		AI_Wait(self,7);
	};
	Npc_RemoveInvItems(self,ItFoMuttonRaw,amount);
	CreateInvItems(self,ItFoMutton,amount);
	AI_PrintScreen("Мясо пожарено",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	b_endproductiondialog();
};

instance PC_PAN_CANCEL(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_pan_cancel_condition;
	information = pc_pan_cancel_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int pc_pan_cancel_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PAN)
	{
		return TRUE;
	};
};

func void pc_pan_cancel_info()
{
	b_endproductiondialog();
};

