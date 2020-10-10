
instance DIA_Agon_EXIT(C_Info)
{
	npc = NOV_603_Agon;
	nr = 999;
	condition = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_Hello(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_SCHNITZELJAGD != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(презрительно) Что тебе нужно?
};


instance DIA_Agon_Wurst(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Wurst_Condition;
	information = DIA_Agon_Wurst_Info;
	permanent = FALSE;
	description = "Вот, у меня есть баранья колбаса для тебя.";
};


func int DIA_Agon_Wurst_Condition()
{
	if((MIS_GoraxEssen == LOG_Running) && !Npc_HasItems(self,ItFo_Schafswurst) && Npc_HasItems(other,ItFo_Schafswurst))
	{
		if(Kapitel == 1)
		{
			return TRUE;
		}
		else if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Agon_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Вот, у меня есть баранья колбаса для тебя.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Овечья колбаса, овечий сыр... овечье молоко... меня уже тошнит от одного их вида.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//Так ты хочешь колбасу или нет?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Ладно, давай ее сюда!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben += 1;
//	CreateInvItems(self,ItFo_Schafswurst,1);
	B_UseItem(self,ItFo_Schafswurst);
	if(Wurst_Gegeben >= 13)
	{
		AI_PrintScreen(PRINT_AllNovizen,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	}
	else
	{
		NovizeLeft = IntToString(13 - Wurst_Gegeben);
		NovizeText = ConcatStrings(PRINT_NovizenLeft,NovizeLeft);
		AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};


instance DIA_Agon_New(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent = FALSE;
	description = "Я новичок здесь.";
};


func int DIA_Agon_New_Condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Я новичок здесь.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//Я вижу.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Если у тебя еще нет работы, поговори с Парланом. Он поручит тебе что-нибудь.
};


instance DIA_Agon_YouAndBabo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent = FALSE;
	description = "Что произошло между тобой и Бабо?";
};


func int DIA_Agon_YouAndBabo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Что произошло между тобой и Бабо?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Тебе не стоит верить всему, что ты слышишь.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(настойчиво) Давай проясним кое-что: я буду поступать так, как сочту нужным. Так, как предопределил мне Иннос.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Я никому не позволю встать у меня на пути, и уж конечно не этому простофиле Бабо.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Разве мы, послушники, не должны поддерживать друг друга?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Одному Инносу ведомо, каким путем должны мы идти.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Я думаю, мы поладим.",DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Разве мы, послушники, не должны поддерживать друг друга?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Вы, остальные, можете поддерживать друг друга сколько хотите.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Но, пожалуйста, не трать мое время. (холодно) Никто не смеет стоять у меня на пути.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Одному Инносу ведомо, каким путем должны мы идти.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Моя семья всегда пользовалась благосклонностью Инноса, и ничто не изменит это.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Я думаю, мы поладим.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//Надеюсь. Когда я стану магом, я замолвлю за тебя словечко.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};


instance DIA_Agon_GetHerb(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent = TRUE;
	description = "Что ты выращиваешь здесь?";
};


func int DIA_Agon_GetHerb_Condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		if(Npc_GetDistToWP(self,"NW_MONASTERY_HERB_05") > 600)
		{
			DIA_Agon_GetHerb.description = "Чем вы здесь занимаетесь?";
		}
		else
		{
			DIA_Agon_GetHerb.description = "Что ты выращиваешь здесь?";
		};
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_HERB_05") > 600)
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Чем вы здесь занимаетесь?
	}
	else
	{
		AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Что ты выращиваешь здесь?
	};
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Мы пытаемся вырастить лечебные травы, из которых мастер Неорас готовит зелья.
};


instance DIA_Agon_GolemDead(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemDead_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && Npc_IsDead(Magic_Golem))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(торжествующе) Ты опоздал!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//Я был здесь первым! Я победил!
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"Только если тебе удастся выбраться отсюда живым.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead,"Заткнись!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead,"Поздравляю, ты действительно заслужил это.",DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(угрожающе) Только если тебе удастся выбраться отсюда живым.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Ты хочешь убить меня? У тебя ничего не получится.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Заткнись!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(насмешливо) Это бесполезно, ты проиграл! Смирись с этим.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Только мне суждено стать магом.
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"Черта с два. Этот сундук мой.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead,"Ты победил.",DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Черта с два. Этот сундук мой.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(в ярости) Нет, ты не сделаешь этого. Я убью тебя.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Ты победил.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(в ярости) Нет, тебе не обмануть меня. Ты пытаешься избавиться от меня.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//Я не допущу этого!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Поздравляю, ты действительно заслужил это.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(недоверчиво) Что это значит? Что ты задумал?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//Ты о чем это?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(нервно) Ты хочешь оспорить мою победу. Ты хочешь убить меня и забрать всю славу себе!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//У тебя ничего не выйдет!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Agon_GolemLives(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemLives_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && !Npc_IsDead(Magic_Golem))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(удивленно) Ты нашел это место раньше меня. Этого не может быть...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(решительно) Этого не может быть! Я не позволю это.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Твой труп никогда никто не найдет.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Agon_Perm(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Agon_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//Как дела?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Ох, спасибо за твою заботу, о, паладин. Я наслаждаюсь работой, и я уверен, что скоро меня выберут в маги.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(надменно) Ты всего лишь гость здесь, в монастыре Инноса. Поэтому ты должен вести себя соответствующе и не отрывать меня от работы. Прощай.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Agon_PICKPOCKET(C_Info)
{
	npc = NOV_603_Agon;
	nr = 900;
	condition = DIA_Agon_PICKPOCKET_Condition;
	information = DIA_Agon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Agon_PICKPOCKET_Condition()
{
	return C_Beklauen(23,12);
};

func void DIA_Agon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
	Info_AddChoice(DIA_Agon_PICKPOCKET,Dialog_Back,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Agon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

