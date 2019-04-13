
instance DIA_Ulthar_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_GREET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_GREET_Condition;
	information = DIA_Ulthar_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulthar_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_GREET_Info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Послушай, новый послушник должен предстать перед Высшим Советом. Да пребудет с тобой Иннос, сын мой.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//А каковы задачи Высшего Совета?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Это наш долг - провозглашать волю Инноса. Согласно его воле, мы называем избранных послушников, которые должны пройти Испытание Магией.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//Хотя мы ведем уединенный образ жизни, мы следим за событиями в миру, так как церковь Инноса представляет собой высший закон на земле.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ах, так вам интересно, что происходит в миру...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//А что вы думаете об этих драконах, что опустошают Долину Рудников со своей армией, что растет день ото дня?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Я понимаю, что сердце твое горит гневом, но мы должны сначала взвесить твои слова, прежде чем предпринять какие-нибудь шаги.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Если мы позволим себе увлечься и начать действовать поспешно, мы ничего не добьемся. Поэтому выполняй свои задачи, а мы пока обсудим, что можно сделать.
};


instance DIA_Ulthar_MAGETEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_MAGETEST_Condition;
	information = DIA_Ulthar_MAGETEST_Info;
	description = "Расскажи мне об Испытании Магией.";
};


func int DIA_Ulthar_MAGETEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_GREET))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_MAGETEST_Info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Расскажи мне об Испытании Магией.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Это шанс для избранного послушника вступить в гильдию магов. Но только один может пройти это испытание.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//И Иннос один выбирает послушников для него.
};


instance DIA_Ulthar_WHEN(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 3;
	condition = DIA_Ulthar_WHEN_Condition;
	information = DIA_Ulthar_WHEN_Info;
	permanent = TRUE;
	description = "Когда пройдет это испытание?";
};


func int DIA_Ulthar_WHEN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_MAGETEST) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_WHEN_Info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Когда пройдет это испытание?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Как только мы услышим волю Инноса, мы сообщим об этом избранным послушникам и проведем испытание.
};


instance DIA_Ulthar_TEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_TEST_Condition;
	information = DIA_Ulthar_TEST_Info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, мастер.";
};


func int DIA_Ulthar_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_TEST_Info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Я готов пройти твое испытание, мастер.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Я не удивлен, что ты знаешь этот старый закон.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Но я подозреваю, что ты не осознаешь, какому риску ты себя подвергаешь. Помни, что нетерпеливый дух не выдержит Испытание Огнем.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Уже очень давно никто не подвергался этому испытанию. А пройти его и остаться в живых вообще удалось только одному человеку.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//Тогда это был молодой и амбициозный послушник, а теперь это давний и постоянный член Высшего Совета - я говорю о Серпентесе.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Недолго ему осталось быть единственным, кто пошел это испытание.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//Тогда я не буду больше испытывать твое терпение. Вот мое испытание для тебя:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Создай руну 'огненная стрела'. Это все - да поможет тебе Иннос.
	MIS_RUNE = LOG_Running;
	Log_CreateTopic(TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rune,LOG_Running);
	B_LogEntry(TOPIC_Rune,"Ультар дал мне испытание. Я должен создать руну Огненная стрела.");
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_RUNNING(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_RUNNING_Condition;
	information = DIA_Ulthar_RUNNING_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ulthar_RUNNING_Condition()
{
	if((MIS_RUNE == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(other,ItRu_FireBolt) == 0))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_RUNNING_Info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Ты знаешь свою задачу. Занимайся ей.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SUCCESS(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_SUCCESS_Condition;
	information = DIA_Ulthar_SUCCESS_Info;
	permanent = FALSE;
	description = "Я создал руну!";
};


func int DIA_Ulthar_SUCCESS_Condition()
{
	if((MIS_RUNE == LOG_Running) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//Я создал руну!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Отлично, послушник. Храни ее - свою первую руну.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Когда ты достигнешь первого Круга Огня, ты сможешь использовать ее.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Ты прошел это испытание к моему полному удовлетворению.
	if((MIS_GOLEM == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Но опасное испытание, что приготовил Серпентес, еще ожидает тебя!
	};
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP(XP_RUNE);
};


instance DIA_Ulthar_KAP3_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP3_EXIT_Condition;
	information = DIA_Ulthar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_PermAbKap3(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 99;
	condition = DIA_Ulthar_PermAbKap3_Condition;
	information = DIA_Ulthar_PermAbKap3_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Ulthar_PermAbKap3_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_PermAbKap3_Info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Есть новости?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Пока нет. Иди и занимайся своими задачами. Тебе еще многое нужно сделать.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Нет. Ничего такого, чего бы ты еще не знал, брат.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SCHREINEVERGIFTET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information = DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important = TRUE;
};


func int DIA_Ulthar_SCHREINEVERGIFTET_Condition()
{
	if(Pedro_Traitor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Еще одно. Некоторые придорожные алтари, посвященные Инносу, были осквернены врагом. Они потеряли свои магические свойства.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Понимаю, и что теперь?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Ты должен очистить эти алтари, чтобы ситуация не усугубилась.
		CreateInvItems(self,ItMi_UltharsHolyWater_Mis,1);
		B_GiveInvItems(self,other,ItMi_UltharsHolyWater_Mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//Возьми эту святую воду и окропи ей основания алтаря.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//Со святыми словами очищения к алтарю вернется его былая сила.
		if(Npc_HasItems(other,ItWr_Map_Shrine_MIS) == FALSE)
		{
			if(Npc_HasItems(Gorax,ItWr_Map_Shrine_MIS) && (Npc_IsDead(Gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Горакс может продать тебе карту, на которой помечены наши алтари.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Вот карта. На ней отмечены алтари, построенные нами.
				CreateInvItems(self,ItWr_Map_Shrine_MIS,1);
				B_GiveInvItems(self,other,ItWr_Map_Shrine_MIS,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Теперь иди и выполняй свои поручения.
		MIS_Ulthar_HeileSchreine_PAL = LOG_Running;
		Log_CreateTopic(TOPIC_Ulthar_HeileSchreine_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL,LOG_Running);
		B_LogEntry(TOPIC_Ulthar_HeileSchreine_PAL,"Ультар дал мне задание очистить при помощи святой воды все алтари, оскверненные врагом.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Еще одно. Держись подальше от придорожных алтарей. Мы слышали, что некоторые из них были осквернены.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Никто не знает, как теперь они действуют.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Тебя не должна волновать эта проблема. О ней позаботятся паладины.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Ulthar_SchreineGeheilt(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheilt_Condition;
	information = DIA_Ulthar_SchreineGeheilt_Info;
	description = "Я очистил все алтари.";
};


func int DIA_Ulthar_SchreineGeheilt_Condition()
{
	if(MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheilt_Info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//Я очистил все алтари.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//Превосходно, сын мой. Я горжусь тобой. Да не оставит тебя внимание Инноса.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//Возьми этот Амулет силы, он может пригодиться тебе в твоих сражениях с врагом.
	CreateInvItems(self,ItAm_Dex_Strg_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_Strg_01,1);
	B_GivePlayerXP(XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP4_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP4_EXIT_Condition;
	information = DIA_Ulthar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SchreineGeheiltNoPAL(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information = DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important = TRUE;
};


func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Хорошие новости. Придорожные алтари очищены. Сила Инноса помогла паладинам снять эту проблему.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Ты опять можешь приносить дары Инносу без каких либо оговорок или ограничений.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP5_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP5_EXIT_Condition;
	information = DIA_Ulthar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP6_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP6_EXIT_Condition;
	information = DIA_Ulthar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_PICKPOCKET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 900;
	condition = DIA_Ulthar_PICKPOCKET_Condition;
	information = DIA_Ulthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Ulthar_PICKPOCKET_Condition()
{
	return C_Beklauen(74,320);
};

func void DIA_Ulthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,Dialog_Back,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

