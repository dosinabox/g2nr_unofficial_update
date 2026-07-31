
instance DIA_PAL_270_EXIT(C_Info)
{
	npc = PAL_270_Ritter;
	nr = 999;
	condition = DIA_Common_EXIT_Condition;
	information = DIA_Common_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int DIA_PAL_270_OUT_NoPerm;

instance DIA_PAL_270_OUT(C_Info)
{
	npc = PAL_270_Ritter;
	condition = DIA_PAL_270_OUT_Condition;
	information = DIA_PAL_270_OUT_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_PAL_270_OUT_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_PAL_270_OUT_Info()
{
	if(DIA_PAL_270_OUT_NoPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_00");	//Ты пришел из Хориниса, да? Когда все кончится, я тоже вернусь туда.
		DIA_PAL_270_OUT_NoPerm = TRUE;
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_01");	//Я очень рад, что мы с вами в одной команде, сэр.
	}
	else
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_02");	//У нас получится. Мы доставим руду в Хоринис, и нас будут носить на руках!
	};
	AI_StopProcessInfos(self);
};

