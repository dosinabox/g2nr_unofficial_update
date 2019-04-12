
instance DIA_OWPAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OWPAL_4_EXIT_Condition;
	information = DIA_OWPAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OWPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OWPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OWPAL_4_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OWPAL_4_STANDARD_Condition;
	information = DIA_OWPAL_4_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OWPAL_4_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OWPAL_4_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_00");	//Иннос - моя честь, а моя честь - моя жизнь.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_01");	//Мы будем стоять здесь насмерть, пока Иннос дарует нам свой святой свет.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_02");	//С помощью Инноса мы изгоним отсюда всех этих дьявольских созданий.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OWPAL_4(var C_Npc slf)
{
	dia_owpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_owpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

