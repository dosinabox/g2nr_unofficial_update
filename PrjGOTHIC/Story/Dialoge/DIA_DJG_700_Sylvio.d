
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if(!Npc_IsDead(IceDragon) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Эй ты, паладин! Возвращайся в свою шахту. Здесь для тебя ничего нет.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Эй, ты! Меня тошнит от магов! Иди куда-нибудь еще! Здесь для тебя ничего нет.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Ох, будь я проклят! Ты тоже решил подзаработать, ха? Я знал это! У тебя душа наемника.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Послушай, если ты думаешь, что загребешь здесь кучу золота, ты жестоко ошибаешься. Я был здесь первым.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Понял. Никто не хочет расставаться с награбленным.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//Ты сам сказал это. Исчезни.
};


instance DIA_Sylvio_VERSAGER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = "А что, если я не исчезну?";
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//А что, если я не исчезну?
	if(SylvioIceGolemsKilledBefore4Chapter == FALSE)
	{
		AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Не строй из себя крутого, выскочка, иначе тебя ждет такой же конец, как вот тех неудачников, лежащих в снегу.
	}
	else
	{
		AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Там, за этими утесами, находится ледяная долина. Ты такой никогда раньше не видел.
		AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Там скрывается ледяной дракон вместе со своей ордой.
		AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Если ты такой крутой, может, ты попробуешь?
	};
};


instance DIA_Sylvio_DEINELEUTE(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = "Это твои люди?";
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_DJG_Sylvio_KillIceGolem != LOG_SUCCESS) && (SylvioIceGolemsKilledBefore4Chapter == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//Это твои люди?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Больше нет. Не такая уж большая потеря. Эти идиоты все равно мало что стоили.
};


instance DIA_Sylvio_WASISTPASSIERT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = "Что случилось с ними?";
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioIceGolemsKilledBefore4Chapter == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Что случилось с ними?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Они не смогли пройти мимо этих ледяных гигантов. Те затоптали их.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Если ты такой крутой, может, ты попробуешь?
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Хорошо. Почему бы и нет?",DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Чем это тебе поможет, если я сделаю это?",DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Что я за это получу?",DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Почему ты не расправишься с ними сам?",DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem,"Сильвио испугался ледяных големов у входа в заснеженный район Долины Рудников.");
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
//	IceGolem_Sylvio1.flags = 0;
//	IceGolem_Sylvio2.flags = 0;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Почему ты не расправишься с ними сам?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Давай, давай. Не мели чепухи.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//По-моему, у тебя дрожат коленки.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Я не играю в твои игры.",DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Что я за это получу?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Не знаю. Ну, скажем... 1000 золотых монет. Как тебе это?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//Чем это тебе поможет, если я сделаю это?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//Тебе это все равно. Но, отвечая на твой вопрос, скажу: я хочу попасть в этот ледяной район.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//К сожалению, на моем пути стоят эти чертовы твари.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Что тебе делать в этом ледяном районе?",DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Я не играю в твои игры.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Ах-х. Тогда убирайся отсюда, трус.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Что тебе делать в этом ледяном районе?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ты когда-нибудь перестанешь задавать вопросы, а? Хорошо, я скажу тебе.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Там, за этими утесами, находится ледяная долина. Ты такой никогда раньше не видел.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Там скрывается ледяной дракон вместе со своей ордой.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Мне нужно это. Так как? Да или нет?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//Хорошо. Почему бы и нет?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Тогда поторопись. Я не могу долго ждать.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = "Твой путь чист! Ледяных гигантов больше нет.";
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MIS_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Твой путь чист! Ледяных гигантов больше нет.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Отличная работа. Посмотрим, что там у нас есть.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Минуточку. А как мои деньги?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Всему свое время.
	};
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	if(!Npc_IsDead(DJG_Bullco))
	{
		if(C_BodyStateContains(DJG_Bullco,BS_SIT))
		{
			AI_Standup(DJG_Bullco);
		};
		B_StartOtherRoutine(DJG_Bullco,"IceWait1");
	};
};


instance DIA_Sylvio_WASJETZT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = "Что еще?";
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if(IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		if(MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS)
		{
			return TRUE;
		}
		else if((SylvioIceGolemsKilledBefore4Chapter == TRUE) && Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER))
		{
			return TRUE;
		};
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Что еще?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Ну-у... Мне что-то обстановка там не очень нравится.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Будет лучше всего, если ты пойдешь вперед, а я пойду за тобой.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Звучит неплохо...",DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Ты боишься?",DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Я не собираюсь делать всю грязную работу за тебя.",DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT,"Сначала я хочу увидеть свои деньги.",DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Ты боишься?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Чушь, хватит болтать. Иди вперед.
};

func void DIA_Sylvio_WASJETZT_ok()
{
	DIA_Common_SoundsGood();
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Давай, быстрее!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Я не собираюсь делать всю грязную работу за тебя.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Трус!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Сначала я хочу увидеть свои деньги.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Когда мы завалим дракона, у тебя будет столько денег, что не сможешь унести.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Я хочу получить свои деньги сейчас.",DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Я хочу получить свои деньги сейчас.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Либо ты пойдешь впереди меня, либо мне придется разобраться с тобой.
};


instance DIA_Sylvio_KOMMSTDU(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = "Я думал, ты направляешься в ледяной район.";
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Я думал, ты направляешься в ледяной район.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//Иди вперед. А я пойду сзади.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = "Мне не помешала бы твоя помощь.";
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if(!Npc_IsDead(IceDragon) && (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	DIA_Common_INeedYourHelp();
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Чушь. Ты и так великолепно справляешься.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(IceDragon))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Ледяной дракон мертв! А теперь ты отдашь мне все, что у тебя есть!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ни за что!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//Это я получу всю славу за убийство ледяного дракона.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//А твоя маленькая роль в этом деле окончена!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_AmbientKap4);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter,"Эта грязная свинья Сильвио собирался присвоить себе мою победу над ледяным драконом. Мы немного повздорили.");
	B_Attack(self,other,AR_KILL,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
	if(Biff.aivar[AIV_PARTYMEMBER] == TRUE)
	{
//		B_Attack(Biff,DJG_Sylvio,AR_KILL,1);
		B_Attack(Biff,DJG_Bullco,AR_GuardStopsFight,1);
	};
};


instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && !Npc_RefuseTalk(self) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//Пришло время расплаты.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
	if(Biff.aivar[AIV_PARTYMEMBER] == TRUE)
	{
//		B_Attack(Biff,DJG_Sylvio,AR_KILL,1);
		B_Attack(Biff,DJG_Bullco,AR_GuardStopsFight,1);
	};
};


instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

