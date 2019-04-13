
instance DIA_Fed_EXIT(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 999;
	condition = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fed_HALLO(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 2;
	condition = DIA_Fed_HALLO_Condition;
	information = DIA_Fed_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fed_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fed_HALLO_Info()
{
	AI_Output(self,other,"DIA_Fed_HALLO_08_00");	//Что тебе нужно от меня? Я никуда не пойду!
	AI_Output(other,self,"DIA_Fed_HALLO_15_01");	//Успокойся - никто не хочет, чтобы ты куда-то шел.
	AI_Output(self,other,"DIA_Fed_HALLO_08_02");	//Слава Инносу. Знаешь, за последние несколько дней несколько человек покинули лагерь - и никто из них не вернулся.
	AI_Output(self,other,"DIA_Fed_HALLO_08_03");	//Их всех сожрали снепперы. Но меня им не достать. Я останусь здесь, пока все это не кончится.
};


instance DIA_Fed_Snapper(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 3;
	condition = DIA_Fed_Snapper_Condition;
	information = DIA_Fed_Snapper_Info;
	permanent = FALSE;
	description = "Что ты знаешь о снепперах?";
};


func int DIA_Fed_Snapper_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fed_Snapper_Info()
{
	AI_Output(other,self,"DIA_Fed_Snapper_15_00");	//Что ты знаешь о снепперах?
	AI_Output(self,other,"DIA_Fed_Snapper_08_01");	//Билгот следил за ними ночью. Часть их пасется у озера рядом со старой башней.
	AI_Output(self,other,"DIA_Fed_Snapper_08_02");	//А другие находятся прямо над нами - на вершине этого утеса. Они просто выжидают, когда у нас кончатся силы.
	AI_Output(self,other,"DIA_Fed_Snapper_08_03");	//Они заперли нас здесь. И скоро они нападут на наш лагерь - вот тогда они попируют...
	AI_Output(other,self,"DIA_Fed_Snapper_15_04");	//Понятно.
};


instance DIA_Fed_Perm(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 5;
	condition = DIA_Fed_Perm_Condition;
	information = DIA_Fed_Perm_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Fed_Perm_Condition()
{
	return TRUE;
};

func void DIA_Fed_Perm_Info()
{
	AI_Output(other,self,"DIA_Fed_Perm_15_00");	//С тобой все в порядке?
	if(MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_01");	//Там снепперы! Ты чувствуешь их запах?.. Я чувствую...
	}
	else
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_02");	//Снепперы, похоже, отступили. Но это ничего не значит. Они вернутся - или волки, или ящеры, или орки.
		AI_Output(self,other,"DIA_Fed_Perm_08_03");	//И рано или поздно они сожрут нас...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Fed_PICKPOCKET(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 900;
	condition = DIA_Fed_PICKPOCKET_Condition;
	information = DIA_Fed_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Fed_PICKPOCKET_Condition()
{
	return C_Beklauen(32,8);
};

func void DIA_Fed_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
	Info_AddChoice(DIA_Fed_PICKPOCKET,Dialog_Back,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fed_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

