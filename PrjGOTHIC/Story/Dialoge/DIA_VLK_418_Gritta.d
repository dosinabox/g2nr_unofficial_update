
instance DIA_Gritta_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_EXIT_Condition;
	information = DIA_Gritta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Gritta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PICKPOCKET(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 900;
	condition = DIA_Gritta_PICKPOCKET_Condition;
	information = DIA_Gritta_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20_Female;
};


func int DIA_Gritta_PICKPOCKET_Condition()
{
	return C_Beklauen(20,20);
};

func void DIA_Gritta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,Dialog_Back,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};


instance DIA_Gritta_Hello(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 10;
	condition = DIA_Gritta_Hello_Condition;
	information = DIA_Gritta_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Hello_Info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Что тебе нужно, чужеземец? Если ты пришел просить милостыню, я вынуждена разочаровать тебя. Я бедная вдова.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Меня зовут Гритта. С тех пор, как умер мой муж, я слежу за домом моего дяди, Торбена.
};


instance DIA_Gritta_WantsMoney(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WantsMoney_Condition;
	information = DIA_Gritta_WantsMoney_Info;
	permanent = FALSE;
	description = "Меня прислал Маттео. Он говорит, что ты задолжала ему.";
};


func int DIA_Gritta_WantsMoney_Condition()
{
	if(MIS_Matteo_Gold == LOG_Running)
	{
		return TRUE;
	};
};


var int Gritta_WantPay;
var int Gritta_Threatened;

func void DIA_Gritta_WantsMoney_Info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Меня прислал Маттео. Он говорит, что ты задолжала ему.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//Он хочет получить деньги? За что? То, что он мне прислал, ни на что не годится. Ткань отвратительная, а швы расползаются прямо на глазах.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//А ты выдел, какого они цвета? Это не тот цвет, что я заказывала. Это надувательство!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Послушай, если бы мой муж был жив, он бы не посмел заявлять такое. Ох, мой бедный муж...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить ...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_Continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//...он был таким хорошим человеком. Красивый, работящий, настоящий джентльмен. У нас было все. Богатство, счастье...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//...иногда нас даже приглашали в высший свет. На торжества, где можно было похвастаться нарядом и прической...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//...на званые обеды... Тогда все было совсем по-другому. Тогда никто бы не осмелился унижать бедную вдову такими...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить ...",DIA_Gritta_WantsMoney_Continue02);
};

func void DIA_Gritta_WantsMoney_Continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//...нелепыми заявлениями. А что мне теперь делать? Моя пенсия еле позволяет сводить концы с концами, а жизнь становится все труднее и труднее. Да ты сам это можешь видеть...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//...людям приходится экономить и потуже затягивать пояса. Уже много недель ни один корабль не заходил в город. Мой муж был капитаном торгового корабля - на самом деле, он даже владел этим кораблем...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//...из своих долгих плаваний он всегда привозил мне подарки - изысканные ткани с материка, дорогие специи из южных стран...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить ...",DIA_Gritta_WantsMoney_Continue03);
};

func void DIA_Gritta_WantsMoney_Continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//...большинство даже не слышали о таких вещах. Но однажды, я получила известие, что Гритта затонула - так назывался этот корабль, мой муж назвал его так из...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...любви ко мне. Я плакала и молилась, чтобы моему мужу удалось выжить в этой катастрофе. Я надеялась, я ждала новостей о нем, но все мои молитвы были тщетными...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//...да смилостивится Иннос над его душой. Пусть он спит спокойно. С тех пор мне приходится жить вот в этих скромных условиях. А теперь этот бездушный, бессердечный Маттео...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...хочет отнять у меня последние сбережения. Пожалуйста, сжалься над бедной женщиной. Если бы мой муж был жив, Маттео не посмел бы сделать это. Ох, мой бедный муж...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить ...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_WhereMoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Хватит. Где золото?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(вызывающе) Но у меня нет золота, я бедная вдова!
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Выкладывай деньги, или мне придется проучить тебя!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Похоже, мне придется продать твои вещи ...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Я собираюсь заплатить эту сумму за тебя.",DIA_Gritta_WantsMoney_IWillPay);
};

func void DIA_Gritta_WantsMoney_EnoughStuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Тогда мы просто продадим некоторые из твоих тряпок. Я уверен, что в твоем сундуке их целая груда...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Как ты смеешь, деревенщина! Ладно, вот, возьми золото.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(ухмыляется) Видишь, это было не так уж сложно.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(раздраженно) А теперь, пожалуйста, покинь мой дом.
	Gritta_GoldGiven = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Gritta_WantsMoney_IWillPay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Я собираюсь заплатить эту сумму за тебя.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Ты сделаешь это ради меня? Ох, я знала, что ты не такой жадный как этот Маттео!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//Да, да, не стоит благодарностей.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Возвращайся, когда вернешь деньги Маттео - я хочу отблагодарить тебя.
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Gritta_WantPay = TRUE;
};

func void DIA_Gritta_WantsMoney_BeatUp()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(угрожающе) Выкладывай деньги, или мне придется проучить тебя!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(вызывающе) Да ты просто обычный бандит. Давай, доставая свое оружие, и я позову стражу!
	Gritta_Threatened = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_WINE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WINE_Condition;
	information = DIA_Gritta_WINE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_WINE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Gritta_WantPay == TRUE) && (MIS_Matteo_Gold == LOG_SUCCESS) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		return TRUE;
	};
};

func void DIA_Gritta_WINE_Info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//Это было очень благородно с твоей стороны заплатить за меня. Я хочу отблагодарить тебя.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Вот бутылка вина, которую мой муж, да упокоит Иннос его душу, привез с южных островов.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Также я расскажу о тебе всем! Наконец-то в городе появился человек, чья добродетель...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//Да-да, не стоит благодарностей.
	B_GivePlayerXP(XP_PayForGritta);
	B_GiveInvItems(self,other,ItFo_Wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PERM(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 3;
	condition = DIA_Gritta_PERM_Condition;
	information = DIA_Gritta_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Gritta_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Gritta_PERM_Info()
{
	if(Npc_KnowsInfo(other,DIA_Gritta_WINE) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Пока в городе есть такие люди как ты, меня не оставляет надежда, что все еще будет хорошо.
	}
	else if((Gritta_WantPay == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Возвращайся, когда уладишь вопрос с Маттео.
	}
	else if((Gritta_Threatened == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Что ты уставился на меня как идиот? Ты все равно не осмелишься ударить меня!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Что еще тебе нужно? Ты получил мое золото! Убирайся!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_Kap3_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_Kap3_EXIT_Condition;
	information = DIA_Gritta_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Gritta_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int GrittaXP_Once;

instance DIA_Gritta_Perm3U4U5(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 31;
	condition = DIA_Gritta_Perm3U4U5_Condition;
	information = DIA_Gritta_Perm3U4U5_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};

func void DIA_Gritta_Perm3U4U5_Info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Как дела?
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Все здесь катится в тартарары. Куда не взглянешь, везде одни преступления и насилие. Только представь, недавно убили даже паладина!
			Info_ClearChoices(DIA_Gritta_Perm3U4U5);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,Dialog_Back,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Эта война - ради вас. Такое случается.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Все будет хорошо.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Что ты слышала?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Ох, я так взволнована. Лорд Хаген освободил этого наемника.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//А какое это имеет отношение к тебе?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Да ты сам подумай. Ты веришь, что наемники сидели бы, сложа руки, когда их товарища собирались повесить?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Они бы попытались освободить его, и пролилось бы много крови. Но, слава Инносу, все разрешилось удачно.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Паладины к чему-то готовятся. Похоже, они собираются уходить из города.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Все как всегда, но я не хочу жаловаться.
	};
};

func void DIA_Gritta_Perm3U4U5_BACK()
{
	Info_ClearChoices(DIA_Gritta_Perm3U4U5);
};

func void DIA_Gritta_Perm3U4U5_War()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//Эта война - ради вас. Такое случается.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Да, всему виной эта ужасная война. Все страдают от нее. Не знаю даже, как им удается сводить концы с концами.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Иногда я спрашиваю себя, что мы сделали, чтобы заслужить такое наказание от Инноса.
};

func void DIA_Gritta_Perm3U4U5_TurnsGood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//Все будет хорошо.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//Ты пытаешься подбодрить меня. Это мило.
	if(GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		GrittaXP_Once = TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Что ты слышала?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Только то, что говорят на улицах.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Я слышала, что убийцу уже поймали, но я не знаю, правда это или нет.
};

