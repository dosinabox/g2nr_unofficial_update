
instance DIA_OUT_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_7_EXIT_Condition;
	information = DIA_OUT_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_7_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OUT_7_STANDARD_Condition;
	information = DIA_OUT_7_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OUT_7_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_7_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_00");	//Последнее время жить здесь стало значительно опаснее. А полевые хищники так вообще житья не дают.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_01");	//Мы должны отдавать долю городу. Если мы не будем делать этого, у нас будут проблемы с паладинами.
	}
	else
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_02");	//Бунт Онара будет иметь серьезные последствия. Я лучше не буду принимать в нем участия.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_7(var C_Npc slf)
{
	DIA_OUT_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};

