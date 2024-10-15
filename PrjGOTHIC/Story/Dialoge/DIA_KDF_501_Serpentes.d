
instance DIA_Serpentes_EXIT(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 999;
	condition = DIA_Serpentes_EXIT_Condition;
	information = DIA_Serpentes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Serpentes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Serpentes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOTALK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOTALK_Condition;
	information = DIA_Serpentes_NOTALK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Serpentes_NOTALK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Knows_Fire_Contest == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOTALK_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(сварливо) Ты осмеливаешься обращаться ко мне, послушник? Возвращайся к своей работе.
	Info_ClearChoices(DIA_Serpentes_NOTALK);
	Info_AddChoice(DIA_Serpentes_NOTALK,Dialog_Ende_v1,DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice(DIA_Serpentes_NOTALK,"У меня есть еще один вопрос...",DIA_Serpentes_NOTALK_QUESTION);
};

func void DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//У меня есть еще один вопрос...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(в ярости) Похоже, ты не понимаешь. Я решаю, когда говорить с тобой, а когда нет. Что ты о себе вообразил?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//А теперь возвращайся к работе!
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_NOTALK_EXIT()
{
	DIA_Common_IHaveToGo_v1();
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_GOAWAY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_GOAWAY_Condition;
	information = DIA_Serpentes_GOAWAY_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_GOAWAY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_NOTALK) && Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Твое присутствие здесь говорит не только о недостатке уважения, но также о твоей тупости, послушник!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_YOURSTORY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 24;
	condition = DIA_Serpentes_YOURSTORY_Condition;
	information = DIA_Serpentes_YOURSTORY_Info;
	permanent = FALSE;
	description = "Я слышал, что ты прошел Испытание Огнем.";
};


func int DIA_Serpentes_YOURSTORY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulthar_TEST) && (other.guild == GIL_NOV) && !Npc_KnowsInfo(other,DIA_Pyrokar_MAGICAN) && (MIS_Golem != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_YOURSTORY_Info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//Я слышал, что ты прошел Испытание Огнем.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//Со всей присущей мне скромностью я расскажу тебе об этом. Все остальные, кто пытались пройти это испытание, мертвы.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(снисходительно) Тебе не стоит пытаться пройти это испытание. Твой дух слаб. Лучше служи в монастыре, и, возможно, через несколько лет ты будешь выбран.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Я хочу пройти это испытание.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Если такова воля Инноса, то пройдешь. Но если нет - то ты умрешь.
};


instance DIA_Serpentes_TEST(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_TEST_Condition;
	information = DIA_Serpentes_TEST_Info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, Мастер.";
};


func int DIA_Serpentes_TEST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_TEST_Info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Я готов пройти твое испытание, Мастер.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Итак, ты хочешь подвергнуться этому испытанию. Только самые мужественные послушники требуют этого. Но мужество - это не все, что тебе понадобится.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Достаточно ли ты умен, чтобы пройти это испытание? А сил у тебя хватит встретить все опасности, что поджидают тебя?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Если нет, ты заплатишь за это своей жизнью.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//А теперь слушай: В Месте Камней найди того, кто никогда не был рожден - найди того, кто когда-то был вызван.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Одолей того, кого нельзя одолеть - померься силами с живой скалой, сразись с бессмертным камнем - и уничтожь его.
	Wld_InsertNpc(MagicGolem,"FP_MAGICGOLEM");
	B_InitNpcGlobals();
	MIS_Golem = LOG_Running;
	Log_CreateTopic(TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Golem,LOG_Running);
	B_LogEntry(TOPIC_Golem,"Серпентес дал мне испытание. Он хочет, чтобы я нашел 'того, кто когда-то был вызван', живую скалу, и победил его.");
};


instance DIA_Serpentes_NOIDEA(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOIDEA_Condition;
	information = DIA_Serpentes_NOIDEA_Info;
	permanent = FALSE;
	description = "С живой скалой? Что за создание это должно быть?";
};


func int DIA_Serpentes_NOIDEA_Condition()
{
	if((MIS_Golem == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOIDEA_Info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//С живой скалой? Что за создание это должно быть?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Я сказал тебе все. (с издевкой) Или это испытание кажется тебе слишком сложным?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Теперь ты узнаешь, что означает пройти Испытание Огнем - я больше не буду отвечать на твои вопросы.
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOHELP(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOHELP_Condition;
	information = DIA_Serpentes_NOHELP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_NOHELP_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_NOIDEA) && (MIS_Golem == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && (!Npc_KnowsInfo(other,DIA_Ulthar_TEST) || Npc_KnowsInfo(other,DIA_Serpentes_YOURSTORY)))
	{
		if(!Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Serpentes_NOHELP_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(с презрением) Иди и выполняй свою задачу, послушник!
	AI_StopProcessInfos(self);
};


func void B_ReturnHolyHammer()
{
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//И будет лучше, если я заберу этот молот.
	Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
	AI_PrintScreen("Священный молот отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	GarwigThiefOneTime = FALSE;
};

instance DIA_Serpentes_SUCCESS(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 3;
	condition = DIA_Serpentes_SUCCESS_Condition;
	information = DIA_Serpentes_SUCCESS_Info;
	permanent = FALSE;
	description = "Я победил голема.";
};


func int DIA_Serpentes_SUCCESS_Condition()
{
	if((MIS_Golem == LOG_Running) && (other.guild == GIL_NOV))
	{
		if(Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Serpentes_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Я победил голема.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Что? Ты действительно сделал это? Но без Молота Инноса ты никогда бы не смог уничтожить этого голема.
	if(!Npc_IsDead(Garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(с сожалением) Тем не менее, я должен признать, что ты выполнил задание, которое я дал тебе.
		if(Npc_HasItems(other,Holy_Hammer_MIS))
		{
			B_ReturnHolyHammer();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(торжествующе) Но ты выдал себя! Это ты убил Гарвига!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//ТЫ ПОНЕСЕШЬ НАКАЗАНИЕ ЗА УБИЙСТВО СЛУГИ ИННОСА!!!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_HumanMurderedHuman,0);
	};
	MIS_Golem = LOG_SUCCESS;
	B_GivePlayerXP(XP_GOLEM);
};


instance DIA_Serpentes_PERM(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 99;
	condition = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent = TRUE;
	description = "Ты хочешь что-то еще сказать мне?";
};


func int DIA_Serpentes_PERM_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Serpentes_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_PERM_Info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Ты хочешь что-то еще сказать мне?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Нет. Пока нет, брат.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Свободен. Ты знаешь, что тебе нужно делать.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_MinenAnteile(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 30;
	condition = DIA_Serpentes_MinenAnteile_Condition;
	information = DIA_Serpentes_MinenAnteile_Info;
	important = TRUE;
};


func int DIA_Serpentes_MinenAnteile_Condition()
{
	if((Pedro_Traitor == TRUE) && (Kapitel >= 3))
	{
		if(other.guild == GIL_KDF)
		{
			if(!Npc_IsDead(Salandril))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Matteo))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Bosper))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Zuris))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Elena))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Orlan))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Hakon))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Rosi))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Canthar))
			{
				return TRUE;
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			if(!Npc_IsDead(Salandril))
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Serpentes_MinenAnteile_Info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Не так быстро. У меня есть еще одно задание для тебя.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(вздыхает) Что еще?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Теперь, когда ты принадлежишь к Братству Огня, ты также должен выполнять обязанности, сопутствующие твоему положению.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Церковь занимается не только вопросами магии - она также, как ты знаешь, является последней инстанцией в вопросе осуществления правосудия.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Последний случай, с которым нам пришлось иметь дело, открывает бездонную пропасть, и с этим нужно разобраться раз и навсегда.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"У меня и так уже много заданий. Найди кого-нибудь еще.",DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Ну что там еще?",DIA_Serpentes_MinenAnteile_was);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Разве это не работа ополчения?",DIA_Serpentes_MinenAnteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Наемник вроде тебя мог бы очень помочь нам в этом вопросе.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Найди себе другого мальчика на побегушках, старик!",DIA_Serpentes_MinenAnteile_nein_sld);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Кого я должен убить?",DIA_Serpentes_MinenAnteile_KillSLD);
	};
};

func void DIA_Serpentes_MinenAnteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Разве это не работа ополчения?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Ополчение отвечает только за город. Это дело может иметь далеко идущие последствия.
};

func void DIA_Serpentes_MinenAnteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//У меня и так уже много заданий. Найди кого-нибудь еще.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(сердито) Это возмутительно. Тебе никогда не достичь высших кругов магии, если ты не желаешь выполнять работу для Братства.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Я объявляю тебе выговор. Надеюсь, больше этого не повторится - иначе ты плохо кончишь.
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_nein_sld()
{
	AI_Output(other,self,"DIA_Vatras_Mission_No_15_00");	//Найди себе другого мальчика на побегушках, старик!
	B_Say(self,other,"$YESGOOUTOFHERE");
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//Ну что там еще?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Кто-то в городе продает фальшивые акции шахт бывшей исправительной колонии.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Эти бумаги абсолютно бесполезны и не имеют особого значения. Но все же, они могут посеять волнения и недовольства среди людей, что мы не можем позволить себе в текущей ситуации.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Этот мошенник предположительно имеет связи со всеми наиболее влиятельными торговцами в городе и сельской местности, и ему даже удалось продать свои поддельные акции некоторым из них.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Найди этого мошенника и приведи его сюда. В такие тяжелые времена мы не потерпим жуликов и грабителей.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Это дело должно стать показательным, чтоб другим было неповадно.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Я попробую прояснить этот вопрос.",DIA_Serpentes_MinenAnteile_was_ja);
};

func void DIA_Serpentes_MinenAnteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Я попробую прояснить этот вопрос.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Еще одно. Когда ты будешь разговаривать с этими торговцами, важно, чтобы они не поняли, что ты ищешь именно эти акции.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Я думаю, они захотят продать их, но наверняка откажутся иметь с тобой дело, если поймут, что ты действуешь по поручению Церкви, понимаешь?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Да.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Тогда за работу. Я желаю тебе успеха, брат.
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	MIS_Serpentes_MinenAnteil_KDF = LOG_Running;
	if(!Npc_IsDead(Salandril))
	{
		CreateInvItems(Salandril,ItWr_MinenAnteil_MIS,2);
		SalandrilMinenAnteil_MAINCounter += 2;
	};
	if(!Npc_IsDead(Matteo))
	{
		CreateInvItems(Matteo,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Bosper))
	{
		CreateInvItems(Bosper,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Zuris))
	{
		CreateInvItems(Zuris,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Elena))
	{
		CreateInvItems(Elena,ItWr_MinenAnteil_MIS,2);
		SalandrilMinenAnteil_MAINCounter += 2;
	};
	if(!Npc_IsDead(Orlan))
	{
		CreateInvItems(Orlan,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Hakon))
	{
		CreateInvItems(Hakon,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Rosi))
	{
		CreateInvItems(Rosi,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Canthar))
	{
		CreateInvItems(Canthar,ItWr_MinenAnteil_MIS,3);
		SalandrilMinenAnteil_MAINCounter += 3;
	};
	Log_CreateTopic(TOPIC_MinenAnteileKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteileKDF,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteileKDF,"Кто-то продает фальшивые акции шахты и обогащается таким незаконным способом. Я должен найти того, кто продает эти акции торговцам. Серпентес хочет заполучить все эти поддельные документы.");
};

func void DIA_Serpentes_MinenAnteile_KillSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Кого я должен убить?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//О, Иннос. Никого, конечно же. Это дело требует изящности, ты, грубый мужлан.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Саландрил, алхимик из верхнего квартала, виновен в серьезном преступлении и его нужно наказать за это.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Однако он отказывается прибыть в монастырь для суда. Приведи его сюда.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Как ты сделаешь это, меня не волнует. Но ты, конечно же, будешь вознагражден.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Разве это не работа ополчения?",DIA_Serpentes_MinenAnteile_miliz);
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Нет проблем. Я сделаю это.",DIA_Serpentes_MinenAnteile_was_jaSLD);
};


var int MIS_Serpentes_BringSalandril_SLD;

func void DIA_Serpentes_MinenAnteile_was_jaSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//Нет проблем. Я сделаю это.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Хорошо. Мы ожидаем услышать от тебя новости через несколько дней.
	MIS_Serpentes_BringSalandril_SLD = LOG_Running;
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	Log_CreateTopic(TOPIC_MinenAnteileSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteileSLD,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteileSLD,"Я должен доставить Саландрила, алхимика из верхней части Хориниса, в монастырь для суда. Меня не особенно интересует, что он там натворил, пока мне хорошо платят за это.");
};


var int SerpentesMinenAnteilCounter;
var int AllMinenAnteilFound;

instance DIA_Serpentes_MinenAnteileBringen(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 2;
	condition = DIA_Serpentes_MinenAnteileBringen_Condition;
	information = DIA_Serpentes_MinenAnteileBringen_Info;
	permanent = TRUE;
	description = "Насчет поддельных акций...";
};


func int DIA_Serpentes_MinenAnteileBringen_Condition()
{
	if((MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_HasItems(other,ItWr_MinenAnteil_MIS) && (other.guild == GIL_KDF))
	{
		if(Npc_HasItems(other,ItWr_MinenAnteil_MIS) > 1)
		{
			DIA_Serpentes_MinenAnteileBringen.description = "Я смог найти несколько акций шахт.";
		}
		else
		{
			DIA_Serpentes_MinenAnteileBringen.description = "Я смог найти акции шахт.";
		};
		return TRUE;
	};
};

func void DIA_Serpentes_MinenAnteileBringen_Info()
{
	var int SerpentesMinenAnteilCount;
	var int SerpentesMinenAnteilGeld;
	var int MinenAnteilLeft;
	SerpentesMinenAnteilCount = Npc_HasItems(other,ItWr_MinenAnteil_MIS);
	if(SerpentesMinenAnteilCount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Я смог найти акции шахт.
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Я смог найти несколько акций шахт.
	};
	B_GiveInvItems(other,self,ItWr_MinenAnteil_MIS,SerpentesMinenAnteilCount);
	Npc_RemoveInvItems(self,ItWr_MinenAnteil_MIS,SerpentesMinenAnteilCount);
	B_GivePlayerXP(SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
	SerpentesMinenAnteilCounter += SerpentesMinenAnteilCount;
	MinenAnteilLeft = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCounter;
	if(MinenAnteilLeft > 0)
	{
		AI_PrintScreen(ConcatStrings(PRINT_MinenAnteilLeft,IntToString(MinenAnteilLeft)),-1,YPOS_ItemTaken,FONT_ScreenSmall,3);
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Очень хорошо. Ты должен изъять из обращения все акции. Это отрава для наших людей. Принеси их все мне.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Вот. Это компенсирует твои расходы.
	}
	else if(AllMinenAnteilFound == FALSE)
	{
		AI_PrintScreen(PRINT_AllMinenAnteil,-1,YPOS_ItemTaken,FONT_ScreenSmall,3);
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Это все акции, как мне кажется.
		if(SerpentesMinenAnteilCount == 1)
		{
			AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//Это действительно последняя акция, да?
		};
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Отлично. Ты заслужил награду.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Возьми этот защитный амулет. Он поможет тебе пройти по пути, который еще только ожидает тебя.
		CreateInvItems(self,ItAm_Prot_Mage_01,1);
		B_GiveInvItems(self,other,ItAm_Prot_Mage_01,1);
		AllMinenAnteilFound = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOTBAD");
	};
	SerpentesMinenAnteilGeld = SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer;
	CreateInvItems(self,ItMi_Gold,SerpentesMinenAnteilGeld);
	B_GiveInvItems(self,other,ItMi_Gold,SerpentesMinenAnteilGeld);
};


instance DIA_Serpentes_GOTSalandril(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 32;
	condition = DIA_Serpentes_GOTSalandril_Condition;
	information = DIA_Serpentes_GOTSalandril_Info;
	description = "Я знаю, кто ввел эти акции в обращение.";
};


func int DIA_Serpentes_GOTSalandril_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOTSalandril_Info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Я знаю, кто ввел эти акции в обращение. Это Саландрил, алхимик из верхнего квартала города.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Тогда приведи его сюда. Нам есть, что обсудить с ним.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_SalandrilHERE(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilHERE_Condition;
	information = DIA_Serpentes_SalandrilHERE_Info;
	description = "Саландрил здесь, в монастыре.";
};


func int DIA_Serpentes_SalandrilHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) || (MIS_Serpentes_BringSalandril_SLD != FALSE))
	{
		if(!Npc_IsDead(Salandril) && (Salandril_SentToMonastery == TRUE))
		{
			if(Npc_GetDistToWP(Salandril,"ALTAR") < 5000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Serpentes_SalandrilHERE_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Саландрил здесь, в монастыре.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Отлично. Мы разберемся с ним позже.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Вот твоя награда. И никому ни слова об этом, понятно?
		CreateInvItems(self,ItMi_Gold,400);
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_SalandrilInKloster);
};


instance DIA_Serpentes_SalandrilDEAD(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilDEAD_Condition;
	information = DIA_Serpentes_SalandrilDEAD_Info;
	description = "Саландрил мертв.";
};


func int DIA_Serpentes_SalandrilDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) || (MIS_Serpentes_BringSalandril_SLD != FALSE))
	{
		if(Npc_IsDead(Salandril) && !Npc_KnowsInfo(other,DIA_Serpentes_SalandrilHERE))
		{
			return TRUE;
		};
	};
};

func void DIA_Serpentes_SalandrilDEAD_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Саландрил мертв.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Что ж, значит, его дела не остались безнаказанными. Да сжалится Иннос над его бедной душой.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

