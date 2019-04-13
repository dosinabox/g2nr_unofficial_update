
instance DIA_Jergan_EXIT(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 999;
	condition = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jergan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jergan_Hallo(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jergan_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Я пришел из замка. Меня послали поискать пропавших и разведать эту местность.
};


instance DIA_Jergan_Vermisste(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent = FALSE;
	description = "Пропавших?";
};


func int DIA_Jergan_Vermisste_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Vermisste_Info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Пропавших?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Некоторые сбежали, когда на нас напали драконы. Большинству из них не удалось выжить - это и неудивительно!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Но все же, если кому-то удалось выжить, я должен привести их назад.
};


instance DIA_Jergan_Burg(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent = FALSE;
	description = "Ты можешь помочь мне пробраться в замок?";
};


func int DIA_Jergan_Burg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Burg_Info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Ты можешь помочь мне пробраться в замок?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Конечно, но ты должен оказать мне услугу.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Если тебе удастся добраться до замка, поговори с паладином Ориком. Скажи ему, что его брат погиб здесь, у Прохода.
	Log_CreateTopic(Topic_OricBruder,LOG_MISSION);
	Log_SetTopicStatus(Topic_OricBruder,LOG_Running);
	B_LogEntry(Topic_OricBruder,"Когда я буду в замке, я должен сказать Орику, что его брат погиб в Проходе.");
};


instance DIA_Jergan_Gegend(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent = TRUE;
	description = "Что мне нужно знать об этой местности?";
};


func int DIA_Jergan_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};


var int Jergan_Tell;

func void DIA_Jergan_Gegend_Info()
{
	if(Jergan_Tell == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Что мне нужно знать об этой местности?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Если ты хочешь выжить, беги от всего, что тебе встретится.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Эти зеленокожие твари взяли замок в кольцо уже несколько недель назад. К тому же, где-то здесь спрятались драконы.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Вся Долина Рудников кишит орками. Куда бы ты ни направился, ты рискуешь нарваться на них.
	Jergan_Tell = TRUE;
};


instance DIA_Jergan_Hilfe(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent = FALSE;
	description = "Как мне попасть в замок?";
};


func int DIA_Jergan_Hilfe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Как мне попасть в замок?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Прежде всего, забудь о прямой дороге. Но если ты обойдешь замок с другой стороны, возможно, у тебя будет шанс.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Тебе лучше держаться подальше от дорог и использовать реку. Лучше всего, если ты будешь плыть вниз по течению.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Орки установили таран за замком. Ты можешь сделать так - подкрасться к оркам как можно ближе, а затем бежать со всех ног к тарану.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//У тебя может получиться, если ты достаточно быстр.
};


instance DIA_Jergan_Mine(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Jergan_Mine_Condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Jergan_Mine_Info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Я разведчик. Моя работа - следить за врагом. Но все эти снепперы совсем не облегчают мне жизнь.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//Хотя, сейчас самое время насобирать трофеев - если, конечно, ты знаешь, что делаешь.
};


instance DIA_Jergan_Claw(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent = FALSE;
	description = "Ты можешь напучить меня этому?";
};


func int DIA_Jergan_Claw_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Claw_Info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Ты можешь напучить меня этому?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Я могу показать тебе, как отделять когти этих тварей.
};


instance DIA_Jergan_Teach(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent = TRUE;
	description = "(Изучить удаление когтей)";
};


func int DIA_Jergan_Teach_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Teach_Info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Покажи мне, как отделять когти.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Когти нужно отрубить одним точным и резким ударом. Тут нельзя колебаться, иначе ты испортишь трофей.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Таким образом ты можешь отделять не только когти снепперов, но также ящеров и мракорисов.
	};
};


instance DIA_Jergan_Diego(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent = FALSE;
	description = "Ты знаешь, куда отправился Диего? ";
};


func int DIA_Jergan_Diego_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,DIA_DiegoOw_Hallo) == FALSE) && Npc_KnowsInfo(other,DIA_Parcival_Diego))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Diego_Info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Ты знаешь, куда отправился Диего?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Диего? Он был одним из старателей Сильвестро. Но потом сбежал.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Я видел его с двумя рыцарями и ящиком, недалеко отсюда.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Видишь старую башню вон там справа? Иди туда, а затем по направлению к замку.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Дорога идет через скалы справа. Вот туда они и пошли.
};


instance DIA_Jergan_Leader(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jergan_Leader_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(NewMine_LeadSnapper) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Leader_Info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Ты убил вожака стаи. И как - ты забрал когти этого зверя?
	if(Npc_HasItems(other,ItAt_ClawLeader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Да.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Они, стоят целое состояние. Есть люди, которые коллекционируют такие вещи.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Если ты найдешь правильного покупателя, то получишь за них целую кучу золота.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Нет.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Это ты зря. Я уверен, они стоят целое состояние.
	};
};


instance DIA_Jergan_PICKPOCKET(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 900;
	condition = DIA_Jergan_PICKPOCKET_Condition;
	information = DIA_Jergan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Jergan_PICKPOCKET_Condition()
{
	return C_Beklauen(84,110);
};

func void DIA_Jergan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,Dialog_Back,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

