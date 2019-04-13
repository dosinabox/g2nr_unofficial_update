
instance DIA_Buster_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_EXIT_Condition;
	information = DIA_Buster_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Hello(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_Hello_Condition;
	information = DIA_Buster_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_Hello_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_Hello_Info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Посмотрите, кто у нас здесь?! Я тебя случайно не знаю?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Как скажешь. Я хочу увидеть лендлорда.",DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice(DIA_Buster_Hello,"А кто спрашивает?",DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//А кто спрашивает?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//Я Бастер, один из наемников Ли!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//И тебе лучше быть повежливее со мной, а не то мне придется поучить тебя манерам!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//Ладно, что тебе нужно здесь?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Это не твое дело.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"Я знаю Ли!",DIA_Buster_Hello_IKnowLee);
	Info_AddChoice(DIA_Buster_Hello,"Как скажешь. Я хочу увидеть лендлорда.",DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//Я знаю Ли!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Все знают Ли! Это ни чего не значит, приятель. Сейчас ты разговариваешь со МНОЙ!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//Итак, куда ты направляешься?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Это не твое дело.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"Как скажешь. Я хочу увидеть лендлорда.",DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//Это не твое дело.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Я никому не позволю так разговаривать со мной, ты, грязный червь! По-моему, ты заслуживаешь хорошей взбучки.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//Как скажешь. Я хочу увидеть лендлорда.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//Да?.. Хм - ты не кажешься мне таким уж опасным.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Хочешь проверить?",DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice(DIA_Buster_Hello,"Я тоже убил парочку другую тварей.",DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice(DIA_Buster_Hello,"Тебе правильно кажется.",DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//Тебе правильно кажется.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(самодовольно) Да, за долгие годы я научился распознавать такие вещи, приятель.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//Нам постоянно приходится сражаться с орками. Или со стражниками из города. Они такие настырные. (смеется)
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Ты имеешь в виду НАСТОЯЩИХ орков? Этих больших тварей?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"И?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"Потрясающе.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//Я тоже убил парочку другую тварей.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ха! (смеется) Ты, наверное, прихлопнул несколько долгоносиков на поле и выгнал парочку крыс из их нор.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//А мы здесь имеем дело с орками! Да, и с этими коварными городскими стражниками. (иронический смех)
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Ты имеешь в виду НАСТОЯЩИХ орков? Этих больших тварей?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"И?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"Потрясающе.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Хочешь проверить?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Надо же! Я напал не на того парня, да?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//Можно сказать и так.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//Тогда давай, покажи мне, на что ты годен.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//Потрясающе.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(смеется) Это наша работа, парень! Мы даже делаем свое собственное оружие и доспехи!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//Мы каждый день ходим рука об руку со смертью. Но деревенщине вроде тебя этого не понять.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Похоже, мне придется показать тебе, что я знаю об этом!",DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice(DIA_Buster_Hello,"Как скажешь.",DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Как скажешь.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(со скучающим хрюканьем) Проходи, зануда!
	AI_StopProcessInfos(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//Похоже, мне придется показать тебе, что я знаю об этом!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//Ты что, строишь из себя буйного крестьянина, да?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//Хорошо, давай, покажи, на что ты способен.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//И?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(фыркает) Как будто ты понимаешь, о чем я говорю. Ты думаешь, что ты крут, да?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(сердито) Похоже, пришло время преподнести тебе урок!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Всегда готов!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"Я просто шучу...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Ты имеешь в виду НАСТОЯЩИХ орков? Этих больших тварей?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(вздыхает) Я имею в виду... Минутку! Ты что, издеваешься надо мной?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(улыбаясь) Даже и не думал.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//Ах ты червь навозный! (агрессивно) Ты сам напрашиваешься, да?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//Тогда давай, покажи, на что ты способен, герой!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"Всегда готов!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"Я просто шучу...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//Всегда готов!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//Тогда иди сюда, приятель!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//Я просто шучу...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//Поосторожнее с такими шутками! А теперь проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_Buster_FightNone(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_FightNone_Condition;
	information = DIA_Buster_FightNone_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_FightNone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_Hello) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//Что тебе нужно, слизняк?
};


instance DIA_Buster_Duell(C_Info)
{
	npc = SLD_802_Buster;
	nr = 3;
	condition = DIA_Buster_Duell_Condition;
	information = DIA_Buster_Duell_Info;
	permanent = TRUE;
	description = "Я вызываю тебя на дуэль!";
};


func int DIA_Buster_Duell_Condition()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Buster_Duell_Info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//Я вызываю тебя на дуэль!
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ах-ах! Тебе все неймется, да? Ладно, иди сюда!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//Ты хочешь попробовать еще раз? Ну, ты зануда, ладно, иди сюда!
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//Только больше не убегай!
		};
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Buster_WannaJoin(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WannaJoin_Condition;
	information = DIA_Buster_WannaJoin_Info;
	permanent = TRUE;
	description = "Я хочу присоединиться к наемникам!";
};


func int DIA_Buster_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (Buster_Duell == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//У парня с таким ударом, как у тебя, не должно возникнуть с этим особых проблем.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//Ты не особенно хороший боец, но и трусом тебя назвать нельзя.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//Мой голос не много значит, так как здесь я не очень давно, но если Ли спросит, я проголосую за тебя.
		Buster_Duell = TRUE;
		Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		B_LogEntry(TOPIC_SLDRespekt,"С тех пор, как я победил Бастера, он не имеет ничего против моего вступления в ряды наемников.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//Ты? Я не помню, чтобы таких трусов, как ты, когда-либо принимали в наемники...
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Ты убегаешь от дуэли - таким, как ты, здесь нечего делать!
		};
	};
};


var int Buster_SentenzaTip;

instance DIA_Buster_OtherSld(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_OtherSld_Condition;
	information = DIA_Buster_OtherSld_Info;
	permanent = FALSE;
	description = "Я хочу узнать больше о наемниках и этой местности.";
};


func int DIA_Buster_OtherSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Buster_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//Я хочу узнать больше о наемниках и этой местности.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//О местности я мало что могу сказать. Тебе лучше поспрашивать фермеров.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//А что касается наемников - то правила у нас просты: если можешь постоять за себя - добро пожаловать к нам.
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//Я думаю, ты достоин стать одним из нас.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//Но не стоит обольщаться. Тебе просто повезло во время нашего последнего боя.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//На этой ферме полно парней, которые будут получше меня...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Сентенза, например. Он охраняет вход на ферму. Тебе лучше не связываться с ним.
		Buster_SentenzaTip = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//Но зачем я говорю тебе все это, слизняк?!
		AI_StopProcessInfos(self);
	};
};


var int Buster_GoldZumBrennen;
var int Buster_Bonus;

instance DIA_Buster_AboutSentenza(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_AboutSentenza_Condition;
	information = DIA_Buster_AboutSentenza_Info;
	permanent = FALSE;
	description = "Что там насчет Сентензы?";
};


func int DIA_Buster_AboutSentenza_Condition()
{
	if(Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_AboutSentenza_Info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//Что там насчет Сентензы?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//Он попытается вытрясти из тебя золото, когда ты будешь входить на ферму - он делает это со всеми.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//На твоем месте, я бы заплатил. Я сам так и сделал, когда пришел туда в первый раз. И что хорошо, он проголосовал за меня после этого.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//Услуга за услугу, как он сказал. Я потерял при этом все свое золото, но его все равно было немного. А потом я даже порадовался этому.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//Я видел, как он избивал парня, который решил НЕ платить ему.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//Спасибо за совет.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//Пожалуйста. Он много для тебя значит?
	Info_ClearChoices(DIA_Buster_AboutSentenza);
	Info_AddChoice(DIA_Buster_AboutSentenza,"Нет.",DIA_Buster_AboutSentenza_No);
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Buster_AboutSentenza,"Да, вот держи - 5 золотых монет.",DIA_Buster_AboutSentenza_Give);
	};
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Да, вот держи - 5 золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//Спасибо. Похоже, все не так уж плохо. Я не забуду твоей доброты.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//Я так и думал.
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};


instance DIA_Buster_LeeLeader(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_LeeLeader_Condition;
	information = DIA_Buster_LeeLeader_Info;
	permanent = FALSE;
	description = "Наемников возглавляет Ли, да?";
};


func int DIA_Buster_LeeLeader_Condition()
{
	if(Buster_Duell == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_LeeLeader_Info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Наемников возглавляет Ли, да?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//Правильно - эй, теперь я вспомнил, где видел тебя! Ты тоже был в колонии.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(вздыхает) Так было.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//Я не видел тебя, когда все рвануло. И незадолго перед этим тоже.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//У меня были другие проблемы.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//Тогда ты многое пропустил - с тех пор многое изменилось.
};


instance DIA_Buster_WhatHappened(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WhatHappened_Condition;
	information = DIA_Buster_WhatHappened_Info;
	permanent = FALSE;
	description = "Что стало с наемниками из колонии?";
};


func int DIA_Buster_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_LeeLeader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//Что стало с наемниками из колонии?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//После того, как Барьера не стало, Ли вывел нас из колонии. Он сказал, что нам ничего не страшно, если мы будем держаться вместе. И он был прав.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//Вскоре мы нашли здесь себе тепленькое местечко. Лендлорд платит нам, чтобы мы не пускали ополчение из города.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//Хотя большинство из нас готово делать это даже бесплатно.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//Онар кормит нас всех, и мы можем спокойно ждать, когда подвернется возможность убраться с этого проклятого острова.
};


instance DIA_Buster_Teach(C_Info)
{
	npc = SLD_802_Buster;
	nr = 8;
	condition = DIA_Buster_Teach_Condition;
	information = DIA_Buster_Teach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня сражаться?";
};


func int DIA_Buster_Teach_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void DIA_Buster_Teach_Info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//Ты можешь научить меня сражаться?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//Да, я могу показать тебе парочку приемов...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//Ты не так уж глуп, как кажешься. Хорошо, я научу тебя тому, что знаю сам. Тогда, может быть, у тебя появятся шансы против меня...
	};
	if(BusterLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Бастер может обучить меня искусству владения одноручным оружием.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Buster_Teach_1H_5);
};

func void DIA_Buster_Teach_Back()
{
	Info_ClearChoices(DIA_Buster_Teach);
};

func void DIA_Buster_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Buster_Teach_1H_5);
};

func void DIA_Buster_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Buster_Teach_1H_5);
};


instance DIA_Buster_KAP3_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP3_EXIT_Condition;
	information = DIA_Buster_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_SHADOWBEASTS(C_Info)
{
	npc = SLD_802_Buster;
	nr = 30;
	condition = DIA_Buster_SHADOWBEASTS_Condition;
	information = DIA_Buster_SHADOWBEASTS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_SHADOWBEASTS_Condition()
{
	if(((Kapitel == 3) || (Kapitel == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void B_DIA_Buster_SHADOWBEASTS_OK()
{
	AI_StopProcessInfos(self);
};

func void DIA_Buster_SHADOWBEASTS_Info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Эй, приятель!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//Последнее время я все думаю, как можно заработать денег в этой дыре.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//И?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//Мне кажется, я знаю, как это можно сделать.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//Торговец из города готов выложить круглую сумму за определенный товар.
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Кто этот торговец, о котором ты говоришь?",DIA_Buster_SHADOWBEASTS_wer);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Что ты там придумал?",DIA_Buster_SHADOWBEASTS_was);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Зачем ты говоришь мне все это?",DIA_Buster_SHADOWBEASTS_ich);
};

func void DIA_Buster_SHADOWBEASTS_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Зачем ты говоришь мне все это?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//Сам я не могу это сделать. Я должен оставаться здесь и присматривать за этими чертовыми баранами.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//Ты хочешь сказать, за фермерами.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//Ну, я так и сказал.
};

func void DIA_Buster_SHADOWBEASTS_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//Что ты там придумал?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//Этот торговец утверждает, что может очень выгодно продать рога мракорисов.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//Кто-то должен сходить в лес и поохотиться на этих тварей. Вот для этого ты и нужен.
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"Сколько на этом можно заработать?",DIA_Buster_SHADOWBEASTS_was_wieviel);
};

func void DIA_Buster_SHADOWBEASTS_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//Сколько на этом можно заработать?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//Целую кучу денег! Этого хватит нам обоим.
	if(Buster_GoldZumBrennen == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//А помня о том золоте, что ты дал мне, я сделаю для тебя особую цену.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//Звучит заманчиво! Я дам тебе знать, когда добуду эти рога.
	MIS_Buster_KillShadowbeasts_DJG = LOG_Running;
	Log_CreateTopic(TOPIC_Buster_KillShadowbeasts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts,LOG_Running);
	B_LogEntry(TOPIC_Buster_KillShadowbeasts,"Бастер даст хорошую цену за каждый рог мракориса, что я принесу ему.");
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
};

func void DIA_Buster_SHADOWBEASTS_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Кто этот торговец, о котором ты говоришь?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//Так не пойдет, приятель. Я что, по-твоему, дурак - раскрывать свои источники? Ты что, хочешь обмануть меня?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Либо ты будешь иметь дело со МНОЙ, или можешь забыть об этом, понятно?
};


instance DIA_Buster_BringTrophyShadowbeast(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_BringTrophyShadowbeast_Condition;
	information = DIA_Buster_BringTrophyShadowbeast_Info;
	permanent = TRUE;
	description = "Насчет рогов мракорисов...";
};


func int DIA_Buster_BringTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowHorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info()
{
	var int BusterTrophyShadowbeastCount;
	var int XP_BringBusterTrophyShadowbeast;
	var int XP_BringBusterTrophyShadowbeasts;
	var int BustersBusterTrophyShadowbeastOffer;
	var int BusterTrophyShadowbeastGeld;
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//Мой торговец из города передал прощальный привет.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//Что это значит?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//Он мертв. Можешь оставить эти рога себе. Теперь я все равно не знаю, что с ними делать.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else if(Npc_HasItems(other,ItAt_ShadowHorn))
	{
		BusterTrophyShadowbeastCount = Npc_HasItems(other,ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 30 * XP_PER_VICTORY;
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus;
		if(BusterTrophyShadowbeastCount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//Я принес тебе рог мракориса.
			B_GiveInvItems(other,self,ItAt_ShadowHorn,1);
			Npc_RemoveInvItem(self,ItAt_ShadowHorn);
			BusterTrophyShadowbeastCounter += 1;
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeast);
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//Я принес рога мракорисов для твоего торговца.
			B_GiveInvItems(other,self,ItAt_ShadowHorn,BusterTrophyShadowbeastCount);
			Npc_RemoveInvItems(self,ItAt_ShadowHorn,BusterTrophyShadowbeastCount);
			XP_BringBusterTrophyShadowbeasts = BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast;
			BusterTrophyShadowbeastCounter += BusterTrophyShadowbeastCount;
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Отлично. Давай сюда. И принеси еще, если сможешь. Кто знает, как долго торговцу будут интересны эти рога.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Вот твоя доля.
		BusterTrophyShadowbeastGeld = BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer;
		CreateInvItems(self,ItMi_Gold,BusterTrophyShadowbeastGeld);
		B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyShadowbeastGeld);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//А как нужно потрошить мракориса?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//Ты этого не знаешь? Ох, парень, я думал о тебе лучше.
		Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast,"Я вернусь к тебе с рогами.",DIA_Buster_BringTrophyShadowbeast_back);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast,B_BuildLearnString("Научи меня.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Buster_BringTrophyShadowbeast_teach);
	}
	else
	{
		Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast,"Я вернусь к тебе с рогами.",DIA_Buster_BringTrophyShadowbeast_back);
	};
};

func void DIA_Buster_BringTrophyShadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//Научи меня.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//Ладно, слушай. Убиваешь мракориса, и как можно крепче берешь его рог правой рукой.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Затем приставляешь нож к его лбу и делаешь глубокий разрез вокруг рога.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//Ну, а потом просто поддеваешь рог ножом, используя его как рычаг, и кладешь рог себе в карман.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//И приносишь его мне. Я думаю, у тебя получится.
	};
	Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//Я вернусь к тебе с рогами.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//Надеюсь.
	Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
};


instance DIA_Buster_KAP4_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP4_EXIT_Condition;
	information = DIA_Buster_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Perm4(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_Perm4_Condition;
	information = DIA_Buster_Perm4_Info;
	permanent = TRUE;
	description = "Что ты думаешь об охотниках на драконов?";
};


func int DIA_Buster_Perm4_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_Perm4_Info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//Что ты думаешь об охотниках на драконов?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//Эти парни могут заработать целую кучу золота - если не сыграют в ящик.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//А я предпочитаю остаться с Ли.
};


instance DIA_Buster_KAP5_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP5_EXIT_Condition;
	information = DIA_Buster_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_KAP6_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP6_EXIT_Condition;
	information = DIA_Buster_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_PICKPOCKET(C_Info)
{
	npc = SLD_802_Buster;
	nr = 900;
	condition = DIA_Buster_PICKPOCKET_Condition;
	information = DIA_Buster_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Buster_PICKPOCKET_Condition()
{
	return C_Beklauen(34,60);
};

func void DIA_Buster_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
	Info_AddChoice(DIA_Buster_PICKPOCKET,Dialog_Back,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Buster_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

