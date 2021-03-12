
instance DIA_Agon_VLK_EXIT(C_Info)
{
	npc = VLK_4007_Agon;
	nr = 999;
	condition = DIA_Agon_VLK_EXIT_Condition;
	information = DIA_Agon_VLK_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_VLK_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_VLK_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_VLK_BackToCity(C_Info)
{
	npc = VLK_4007_Agon;
	nr = 1;
	condition = DIA_Agon_VLK_BackToCity_Condition;
	information = DIA_Agon_VLK_BackToCity_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Agon_VLK_BackToCity_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Agon_VLK_BackToCity_Info()
{
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Моя семья всегда пользовалась благосклонностью Инноса, и ничто не изменит это.
	AI_StopProcessInfos(self);
};

