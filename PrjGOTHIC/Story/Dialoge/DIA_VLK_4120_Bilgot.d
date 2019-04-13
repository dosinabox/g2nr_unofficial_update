
instance DIA_Bilgot_EXIT(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 999;
	condition = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_HALLO(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_HALLO_Condition;
	information = DIA_Bilgot_HALLO_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Эй, откуда ты взялся? Ты пришел из замка?
	Info_AddChoice(DIA_Bilgot_HALLO,"Да, я пришел из замка - ну и что?",DIA_Bilgot_HALLO_Burg);
	Info_AddChoice(DIA_Bilgot_HALLO,"Я просто случайно забрел сюда...",DIA_Bilgot_HALLO_Zufall);
};

func void DIA_Bilgot_HALLO_Zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//Я просто случайно забрел сюда...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Парень, никто не заходит сюда СЛУЧАЙНО. Мы заперты здесь - окруженные снепперами!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//И дня не проходит, чтобы они не загрызли кого-нибудь из наших.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//Так ты не скажешь мне, откуда ты пришел? Хорошо - пусть тогда тебя съедят снепперы!
	AI_StopProcessInfos(self);
};

func void DIA_Bilgot_HALLO_Burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Да, я пришел из замка - ну и что?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//Как там дела?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//Не лучше, чем здесь. Орки все еще там, если ты это имел в виду.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Черт. Нигде нельзя чувствовать себя в безопасности.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//Я скажу тебе кое-что. Если бы я не был напуган до смерти, я бы бежал отсюда.
	Info_ClearChoices(DIA_Bilgot_HALLO);
};


instance DIA_Bilgot_Job(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Job_Condition;
	information = DIA_Bilgot_Job_Info;
	permanent = FALSE;
	description = "А что ты вообще здесь делаешь, кстати?";
};


func int DIA_Bilgot_Job_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_Job_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//А что ты вообще здесь делаешь, кстати?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//Я здесь как мальчик на побегушках. Поднеси-подай, посмотри, где там снепперы, Билгот туда, Билгот сюда.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//Мне лучше было остаться дома со своей старухой. Там было не лучше, но, по крайней мере, там была приличная еда.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//А теперь я - все, что осталось от отряда, которым командовал Фаджет.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//Откуда мне было знать, что этой экспедиции не суждено было вернуться?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//Мой приятель Олав улизнул. Может быть, хотя бы ему удалось вырваться...
};


instance DIA_Bilgot_Hilfe(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Hilfe_Condition;
	information = DIA_Bilgot_Hilfe_Info;
	permanent = FALSE;
	description = "Что ты знаешь о снепперах?";
};


func int DIA_Bilgot_Hilfe_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//Что ты знаешь о снепперах?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//Зачем тебе знать это? И не говори мне, что просто из любопытства!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//Я собираюсь поохотиться на этих снепперов,
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//Это безумие. Я наблюдал за ними - что за кровожадные твари!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//Тогда расскажи мне, что ты о них знаешь.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Хм... я мог бы помочь тебе, но только при одном условии!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//Что ты хочешь?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//Если тебе удастся убить снепперов - ты должен вытащить меня отсюда!
	if(Npc_IsDead(Fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//Мне здесь долго не продержаться - ты говорил с Федом? У этого парня крыша поехала, и я не хочу кончить как он!
	};
};


instance DIA_Bilgot_KNOWSLEADSNAPPER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 4;
	condition = DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information = DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent = FALSE;
	description = "Расскажи мне, что ты знаешь. И я вытащу тебя отсюда!";
};


func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_Hilfe) && (MIS_Fajeth_Kill_Snapper == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Расскажи мне, что ты знаешь. И я вытащу тебя отсюда!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//Я знал, что могу рассчитывать на тебя. Так что будь внимателен. Я довольно долго наблюдаю за снепперами.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//Они очень хитры и могут, ну, как бы... общаться. Они никогда не ходят поодиночке и нападают только стаей.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//Но есть еще кое-что. Среди них есть один особенный. Он редко показывается, но я видел его.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//Другие снепперы низко кланяются, когда проходят мимо него, но никогда не отходят далеко.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//Пока этот зверь не тронется с места, ни один снеппер поблизости даже не шевельнется.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Где мне найти этого кровожадного зверя?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//Я видел его на ступенях старой сторожевой башни.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//Отлично. Мне кажется, я понял. Спасибо!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Помни, ты дал мне слово!
	Wld_InsertNpc(NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01");
	B_LogEntry(TOPIC_FajethKillSnapper,"Билгот рассказал мне о вожаке стаи Снепперов. Он должен быть на ступеньках старой сторожевой башни.");
	Log_CreateTopic(TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BilgotEscort,LOG_Running);
	B_LogEntry(TOPIC_BilgotEscort,"Билгот хочет, чтобы я вывел его из долины.");
};


instance DIA_Bilgot_TAKEYOUWITHME(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_TAKEYOUWITHME_Condition;
	information = DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent = FALSE;
	description = "(Сдержать обещание)";
};


func int DIA_Bilgot_TAKEYOUWITHME_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_TAKEYOUWITHME_Info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//Время пришло, Билгот! Пакуй свои вещи, мы отправляемся в путь.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Я готов!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	Bilgot.flags = 0;
	MIS_RescueBilgot = LOG_Running;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_LAUFSCHNELLER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 5;
	condition = DIA_Bilgot_LAUFSCHNELLER_Condition;
	information = DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent = FALSE;
	description = "Ты не мог бы идти немного быстрее?!";
};


func int DIA_Bilgot_LAUFSCHNELLER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_TAKEYOUWITHME) && (Npc_KnowsInfo(other,DIA_Bilgot_BEIBRUECKEANGEKOMMEN) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Ты не мог бы идти немного быстрее?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//Я иду так быстро, как могу.
};


instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Хорошо, пришли. Дальше иди один. Но будь осторожен!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Спасибо!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Смотри, чтобы тебя не съели. Я очень огорчусь.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//Прощай!
	AI_StopProcessInfos(self);
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP(XP_BilgotEscort);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_Bilgot_LetztePause(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_LetztePause_Condition;
	information = DIA_Bilgot_LetztePause_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь? Я думал, ты пошел через Проход?";
};


func int DIA_Bilgot_LetztePause_Condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//Что ты делаешь здесь? Я думал, ты пошел через Проход?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//Я просто не в силах идти. Мне нужно передохнуть немного. Я справлюсь. Не волнуйся!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//Как скажешь.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Просто немного передохну.
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_Olav(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Olav_Condition;
	information = DIA_Bilgot_Olav_Info;
	permanent = FALSE;
	description = "Я нашел Олава.";
};


func int DIA_Bilgot_Olav_Condition()
{
	if((Npc_HasItems(Olav,ItSe_Olav) == 0) && Npc_KnowsInfo(other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//Я нашел Олава.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//И как он?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//Он мертв. Его съели волки.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//Ох, черт. Надеюсь, хотя бы мне удастся выбраться отсюда.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bilgot_PICKPOCKET(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 900;
	condition = DIA_Bilgot_PICKPOCKET_Condition;
	information = DIA_Bilgot_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Bilgot_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Bilgot_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET,Dialog_Back,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};

func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};

