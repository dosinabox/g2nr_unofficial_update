
instance DIA_Maria_EXIT(C_Info)
{
	npc = BAU_910_Maria;
	nr = 999;
	condition = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maria_Hallo(C_Info)
{
	npc = BAU_910_Maria;
	nr = 1;
	condition = DIA_Maria_Hallo_Condition;
	information = DIA_Maria_Hallo_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Maria_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Я жена Онара, Мария.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Что тебе нужно здесь?
};


instance DIA_Maria_Umsehen(C_Info)
{
	npc = BAU_910_Maria;
	nr = 2;
	condition = DIA_Maria_Umsehen_Condition;
	information = DIA_Maria_Umsehen_Info;
	permanent = FALSE;
	description = "Я просто хотел посмотреть, как вы живете...";
};


func int DIA_Maria_Umsehen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Я просто хотел посмотреть, как вы живете...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//Когда столько людей живет на ферме, даже в доме покоя не найдешь!
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Они так и лезут сюда.
};


instance DIA_Maria_Soeldner(C_Info)
{
	npc = BAU_910_Maria;
	nr = 3;
	condition = DIA_Maria_Soeldner_Condition;
	information = DIA_Maria_Soeldner_Info;
	permanent = FALSE;
	description = "Тебя беспокоят наемники?";
};


func int DIA_Maria_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Тебя беспокоят наемники?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Ох, забудь о том, что я только что сказала - с тех пор, как вы здесь, жить здесь стало значительно безопаснее.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//Ох. Ну, зато с тех пор как пришли наемники, хотя бы на ферме стало безопаснее.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Когда мы еще были сами по себе, сюда постоянно приходили стражники из города и грабили нас.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Они забирали большую часть урожая. И овец тоже. И ничего не давали нам взамен.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Некоторые из них даже воровали, что плохо лежит.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Только не пойми меня неверно, солдат. Я знаю, что не все вы такие.
	};
};


instance DIA_Maria_Mission(C_Info)
{
	npc = BAU_910_Maria;
	nr = 4;
	condition = DIA_Maria_Mission_Condition;
	information = DIA_Maria_Mission_Info;
	permanent = FALSE;
	description = "А что они украли у тебя?";
};


func int DIA_Maria_Mission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Soeldner) && (MIS_Maria_BringPlate != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//А что они украли у тебя?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//В основном золото и серебро. Они даже забрали мой свадебный подарок. Золотую тарелку.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Ручаюсь, она сейчас пылится в сундуке у какого-нибудь городского стражника.
	};
	MIS_Maria_BringPlate = LOG_Running;
};


instance DIA_Maria_BringPlate(C_Info)
{
	npc = BAU_910_Maria;
	nr = 5;
	condition = DIA_Maria_BringPlate_Condition;
	information = DIA_Maria_BringPlate_Info;
	permanent = FALSE;
	description = "Я принес золотую тарелку. Это не твоя?";
};


func int DIA_Maria_BringPlate_Condition()
{
	if(Npc_HasItems(other,ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info()
{
	B_GiveInvItems(other,self,ItMi_MariasGoldPlate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Я принес золотую тарелку. Это не твоя?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Да! Это она! Огромное спасибо тебе!
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP(XP_Maria_Teller);
};


var int Maria_Belohnung;

instance DIA_Maria_Belohnung(C_Info)
{
	npc = BAU_910_Maria;
	nr = 6;
	condition = DIA_Maria_Belohnung_Condition;
	information = DIA_Maria_Belohnung_Info;
	permanent = TRUE;
	description = "А как насчет моего вознаграждения?";
};


func int DIA_Maria_Belohnung_Condition()
{
	if((MIS_Maria_BringPlate == LOG_SUCCESS) && (Maria_Belohnung == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//А как насчет моего вознаграждения?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,DIA_Onar_HowMuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Ты работаешь наемником на моего мужа, да?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Точно.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Сколько мой муж платит тебе?
		B_Say_Gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//Этого недостаточно. Иди к нему и скажи, чтобы он платил тебе больше.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//Ты думаешь, он послушает?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Он знает, что будет, если не послушает. Поверь мне.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Ты хочешь стать наемником на этой ферме?
		Info_ClearChoices(DIA_Maria_Belohnung);
		Info_AddChoice(DIA_Maria_Belohnung,"Вообще-то нет.",DIA_Maria_Belohnung_Gold);
		Info_AddChoice(DIA_Maria_Belohnung,"Да.",DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Maria_Belohnung = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Вот, возьми это. Ты заслужил.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Вообще-то нет.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Maria_Belohnung = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Тогда возьми это золото в качестве награды. Ты заслужил его.
	Info_ClearChoices(DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Да.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Хорошо, если ты будешь работать здесь, я прослежу, чтобы ты получал хорошее жалование.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Зайди ко мне, когда обсудишь размер жалования с моим мужем.
	Info_ClearChoices(DIA_Maria_Belohnung);
};


instance DIA_Maria_AboutOnar(C_Info)
{
	npc = BAU_910_Maria;
	nr = 7;
	condition = DIA_Maria_AboutOnar_Condition;
	information = DIA_Maria_AboutOnar_Info;
	permanent = FALSE;
	description = "Расскажи мне об Онаре.";
};


func int DIA_Maria_AboutOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Расскажи мне об Онаре.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//Он хороший человек. Немного сварливый и очень раздражительный, но у нас у всех есть свои недостатки.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Я спросила своего мужа:  'Почему ты позволяешь солдатам из города так с собой обращаться'?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//'Сделай же что-нибудь', - сказала я.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//И он нанял наемников. А теперь мне кажется, что мы ведем войну.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Но, если подумать, мы ведь действительно воюем, разве нет?
};


instance DIA_Maria_PERM(C_Info)
{
	npc = BAU_910_Maria;
	nr = 8;
	condition = DIA_Maria_PERM_Condition;
	information = DIA_Maria_PERM_Info;
	permanent = FALSE;
	description = "Что интересного было в последнее время?";
};


func int DIA_Maria_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Что интересного было в последнее время?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Мимо прошли паладины.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Сначала мы подумали, что они собираются напасть на нашу ферму, но они прошли мимо, в Долину Рудников.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Василий поймал вора несколько дней назад. А кроме этого, все спокойно.
	};
	if(Kapitel >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//С тех пор, как часть наемников ушла отсюда, стало значительно спокойнее.
	};
};


instance DIA_Maria_PICKPOCKET(C_Info)
{
	npc = BAU_910_Maria;
	nr = 900;
	condition = DIA_Maria_PICKPOCKET_Condition;
	information = DIA_Maria_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Maria_PICKPOCKET_Condition()
{
	return C_Beklauen(60,110);
};

func void DIA_Maria_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
	Info_AddChoice(DIA_Maria_PICKPOCKET,Dialog_Back,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maria_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};

func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};

