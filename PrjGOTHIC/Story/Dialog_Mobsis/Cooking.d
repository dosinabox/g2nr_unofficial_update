
func int pan_cond()
{
	if(Npc_IsPlayer(self))
	{
		if(Npc_HasItems(hero,ItMi_Pan) && Npc_HasItems(hero,ItFoMuttonRaw))
		{
			return TRUE;
		}
		else
		{
			if(!Npc_HasItems(hero,ItMi_Pan))
			{
				AI_PrintScreen("Требуется сковорода!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
				AI_PlayAni(self,"T_DONTKNOW");
			}
			else if(!Npc_HasItems(hero,ItFoMuttonRaw))
			{
				AI_PlayAni(self,"T_DONTKNOW");
				if(!Npc_RefuseTalk(self))
				{
					Print("Требуется сырое мясо!");
					B_Say_Overlay(self,self,"$MISSINGITEM");
					Npc_SetRefuseTalk(self,1);
				};
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
	if(Npc_HasItems(self,ItFoMuttonRaw) <= 10)
	{
		AI_Wait(hero,1);
	}
	else if(Npc_HasItems(self,ItFoMuttonRaw) <= 30)
	{
		AI_Wait(hero,3);
	}
	else if(Npc_HasItems(self,ItFoMuttonRaw) <= 50)
	{
		AI_Wait(hero,5);
	}
	else if(Npc_HasItems(self,ItFoMuttonRaw) > 50)
	{
		AI_Wait(hero,7);
	};
	CreateInvItems(hero,ItFoMutton,Npc_HasItems(hero,ItFoMuttonRaw));
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,Npc_HasItems(hero,ItFoMuttonRaw));
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

