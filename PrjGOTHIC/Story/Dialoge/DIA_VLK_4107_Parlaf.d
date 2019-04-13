
instance DIA_Parlaf_EXIT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 999;
	condition = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parlaf_HALLO(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_HALLO_Condition;
	information = DIA_Parlaf_HALLO_Info;
	description = "Привет, как дела?";
};


func int DIA_Parlaf_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_HALLO_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//Привет, как дела?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//А как, по-твоему? Я провел целый день за точильным кругом, затачивая клинки.
	if(Npc_IsDead(Engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//А вчера Энгор опять урезал наш паек. Если он будет продолжать в том же духе, мы все помрем с голода.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//Или нас всех перебьют орки. Не самая радужная перспектива.
	};
};


instance DIA_Parlaf_ENGOR(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_ENGOR_Condition;
	information = DIA_Parlaf_ENGOR_Info;
	description = "Кто такой Энгор?";
};


func int DIA_Parlaf_ENGOR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && (Npc_IsDead(Engor) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_ENGOR_Info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//Кто такой Энгор?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//Энгор заведует провизией и выдает пайки. А они становятся все меньше с каждой неделей.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//Конечно, с ним можно договориться, но только за золото и весьма недешево.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//А ты не можешь позволить себе это?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//За те гроши, что нам платят, я могу купить только пару реп!
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC,"Энгор заведует припасами замка и ведет небольшой бизнес на стороне.");
};


instance DIA_Parlaf_Wo(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_Wo_Condition;
	information = DIA_Parlaf_Wo_Info;
	permanent = FALSE;
	description = "Где мне найти этого Энгора?";
};


func int DIA_Parlaf_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parlaf_ENGOR) && (Npc_IsDead(Engor) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_Wo_Info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//Где мне найти этого Энгора?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//В доме рыцарей. Пройди через открытый вход рядом с кузницей.
};


instance DIA_Parlaf_HUNGRIG(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_HUNGRIG_Condition;
	information = DIA_Parlaf_HUNGRIG_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Parlaf_HUNGRIG_Condition()
{
	if((MIS_Engor_BringMeat != LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && (Npc_IsDead(Engor) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_HUNGRIG_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//Что новенького?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//Этот чертов Энгор должен увеличить пайки!
};


instance DIA_Parlaf_SATT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_SATT_Condition;
	information = DIA_Parlaf_SATT_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Parlaf_SATT_Condition()
{
	if(((MIS_Engor_BringMeat == LOG_SUCCESS) || Npc_IsDead(Engor)) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO))
	{
		return TRUE;
	};
};


var int DIA_Parlaf_SATT_OneTime;

func void DIA_Parlaf_SATT_Info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//Что новенького?
	if((DIA_Parlaf_SATT_OneTime == FALSE) && (Npc_IsDead(Engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//Энгор раздал мясные пайки. Ох, как долго я этого ждал.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//Твое прибытие - это единственная действительно свежая новость.
	};
};


instance DIA_Parlaf_PICKPOCKET(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 900;
	condition = DIA_Parlaf_PICKPOCKET_Condition;
	information = DIA_Parlaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Parlaf_PICKPOCKET_Condition()
{
	return C_Beklauen(34,12);
};

func void DIA_Parlaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,Dialog_Back,DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};

func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};

