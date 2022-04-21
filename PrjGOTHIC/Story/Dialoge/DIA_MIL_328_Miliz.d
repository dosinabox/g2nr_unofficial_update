
instance DIA_328_Miliz_EXIT(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 999;
	condition = DIA_328_Miliz_EXIT_Condition;
	information = DIA_328_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_328_Checkpoint = "NW_CITY_HABOUR_HUT_03_IN_05";

instance DIA_328_Miliz_Hi(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 1;
	condition = DIA_328_Miliz_Hi_Condition;
	information = DIA_328_Miliz_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_328_Miliz_Hi_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_Hi_Info()
{
	B_PlayerEnteredCity();
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//Эй, тебе нечего делать здесь. Понятно?
	if(Npc_GetDistToWP(other,"NW_CITY_HABOUR_HUT_03_IN_06") <= 600)
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//Кто ты такой?
		AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//Это не твое дело! Здесь я главный. Понял?
		AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//Главный? Над чем? Над этими сундуками?
		AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//Эй, этот склад находится в моем ведении, понял? Так что проваливай, или я раскрою твой череп.
		other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_328_Checkpoint);
		if(!Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) || (other.attribute[ATR_DEXTERITY] < 25) || (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE))
		{
			AI_StopProcessInfos(self);
		};
		Npc_SetRefuseTalk(self,20);
	};
};


instance DIA_328_Miliz_Kill(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 2;
	condition = DIA_328_Miliz_Kill_Condition;
	information = DIA_328_Miliz_Kill_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_328_Miliz_Kill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_328_Miliz_Hi))
	{
		if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		}
		else if(!Npc_RefuseTalk(self))
		{
			return TRUE;
		}
		else if((Npc_GetDistToWP(other,Mil_328_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
		{
			return TRUE;
		};
	};
};

func void DIA_328_Miliz_Kill_Info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//Эй, ты все еще здесь! Разве я не сказал тебе, чтобы ты проваливал?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//Ну, держись! Сейчас я покажу тебе, кто здесь главный!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_328_Miliz_PICKPOCKET(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 888;
	condition = DIA_328_Miliz_PICKPOCKET_Condition;
	information = DIA_328_Miliz_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Key;
};


func int DIA_328_Miliz_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItKe_Storage))
	{
		return C_CanStealFromNpc(35);
	};
	return FALSE;
};

func void DIA_328_Miliz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_328_Miliz_PICKPOCKET);
	Info_AddChoice(DIA_328_Miliz_PICKPOCKET,Dialog_Back,DIA_328_Miliz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_328_Miliz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_328_Miliz_PICKPOCKET_DoIt);
};

func void DIA_328_Miliz_PICKPOCKET_DoIt()
{
	B_StealItem(35,ItKe_Storage);
	Info_ClearChoices(DIA_328_Miliz_PICKPOCKET);
};

func void DIA_328_Miliz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_328_Miliz_PICKPOCKET);
};

