
instance DIA_Xardas_FirstEXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_FirstEXIT_Condition;
	information = DIA_Xardas_FirstEXIT_Info;
	permanent = FALSE;
	description = "Я немедленно отправляюсь в путь! (КОНЕЦ)";
};


func int DIA_Xardas_FirstEXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstEXIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Я немедленно отправляюсь в путь!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Хорошо! И еще одно: не говори никому, что разговаривал со мной. И, прежде всего, не говори об этом магам!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//С тех пор, как я отошел от них, Круг Огня считает меня мертвым - и это очень хорошо.
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Xardas_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_EXIT_Condition;
	information = DIA_Xardas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Addon_zuerst;

instance DIA_Xardas_Hello(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Hello_Condition;
	information = DIA_Xardas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_00");	//Наконец-то! (улыбается) Я и не думал, что нам с тобой доведется встретиться снова.
	AI_Output(other,self,"DIA_Addon_Xardas_Hello_15_01");	//Я чувствую себя так, будто три недели пролежал под кучей камней.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_02");	//Так оно и было. Ты выжил только благодаря магии твоих доспехов.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_03");	//Я уже начал опасаться, что не смогу вытащить тебя из-под развалин храма.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_04");	//Но хватит об этом. Сейчас-то ты здесь.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_05");	//И над нами нависла новая угроза.
	Info_ClearChoices(DIA_Xardas_Hello);
	Info_AddChoice(DIA_Xardas_Hello,"По крайней мере, у нас сейчас достаточно времени. Спящий уничтожен.",DIA_Addon_Xardas_Hello_Dragons);
	Info_AddChoice(DIA_Xardas_Hello,"Что это за НОВАЯ угроза, о которой ты говоришь?",DIA_Addon_Xardas_Hello_Man);
};

func void DIA_Addon_Xardas_Hello_Man()
{
	PlayVideo("Intro_ADDON");
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_10");	//Ты должен стать их союзником! Это единственный способ остановить Белиара.
	Addon_zuerst = TRUE;
};

func void DIA_Addon_Xardas_Hello_Dragons()
{
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//По крайней мере, у нас сейчас достаточно времени. Я сделал это. Спящий...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//...был изгнан. Ты победил его, да, это так - но не в наших силах остановить войну, которая разгорается сейчас.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Своим последним, яростным воплем, Спящий привел в движение армии тьмы.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//Это был приказ всем созданиям тьмы. Слово силы, которому все они обязаны повиноваться.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Его последним приказом было: ИДИТЕ! И они пошли. Все. Даже драконы.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(изумленно) Драконы!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Это творения древней силы. Я чувствую их присутствие - даже здесь.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//И они собрали вокруг себя целую армию из низших существ.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//И где эта армия сейчас?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Лагерь этой армии находится недалеко отсюда, в Долине Рудников около Хориниса, и она готовится к атаке.
	if(Addon_zuerst == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(задумчиво) У нас очень мало времени.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Xardas_Hello_Dragons_14_06");	//Но это еще не все. Есть еще кое-что, что угрожает нам. Об этом я узнал лишь недавно.
		Info_ClearChoices(DIA_Xardas_Hello);
		Info_AddChoice(DIA_Xardas_Hello,"О какой ДРУГОЙ  угрозе ты говоришь?",DIA_Addon_Xardas_Hello_Man);
	};
};


instance DIA_Xardas_AWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_AWAY_Condition;
	information = DIA_Xardas_AWAY_Info;
	permanent = FALSE;
	description = "Тогда давай побыстрее уносить отсюда ноги!";
};


func int DIA_Xardas_AWAY_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Xardas_TODO) && !Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Тогда давай побыстрее уносить отсюда ноги!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Если мы сбежим сейчас, это всего лишь отсрочит нашу встречу с драконами.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//При помощи солдат и магов, живущих здесь, мы можем остановить их до того, как армия тьмы будет полностью сформирована.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//У нас не будет лучшего шанса для этого.
};


instance DIA_Xardas_TODO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_TODO_Condition;
	information = DIA_Xardas_TODO_Info;
	permanent = FALSE;
	description = "Что мы можем сделать?";
};


func int DIA_Xardas_TODO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Что мы можем сделать?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//На этот раз самим нам не справиться. Только сила Инноса может помочь нам в борьбе против этих драконов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//В городе Хоринис, что неподалеку отсюда, остановился отряд паладинов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//Они обладают сильным артефактом, который может помочь нам победить этих драконов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//Они называют его 'Глаз Инноса'. Ты должен завладеть этим артефактом.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//Расскажи паладинам о надвигающейся угрозе. Ты ДОЛЖЕН убедить их предводителя поддержать нас!
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_07");	//А после этого ты должен найти артефакт Белиара.
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_08");	//Это противоположность Глаза Инноса. Он не должен попасть в руки зла.
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_Running);
	B_LogEntry(TOPIC_INNOSEYE,"В городе Хоринис расположился отряд паладинов. Они обладают сильным артефактом: Глазом Инноса. Его сила должна помочь нам избавиться от драконов. Я должен убедить паладинов, что нам нужно объединить наши усилия.");
};


instance DIA_Addon_Xardas_StonePlate(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Addon_Xardas_StonePlate_Condition;
	information = DIA_Addon_Xardas_StonePlate_Info;
	description = "Что ты можешь сказать об этой каменной табличке?";
};


func int DIA_Addon_Xardas_StonePlate_Condition()
{
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_StonePlate_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_StonePlate_15_00");	//Что ты можешь сказать об этой каменной табличке?
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_03");	//Сначала я подозревал, что это магический артефакт, но потом пришел к выводу, что никакой ценности она не имеет.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_04");	//Я не смог полностью расшифровать надписи на табличке, но похоже, они относятся к истории какой-то древней культуры.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_05");	//Если хочешь, можешь забрать табличку себе. Мне она ни к чему.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Xardas_Portal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_Portal_Condition;
	information = DIA_Addon_Xardas_Portal_Info;
	description = "Маги воды нашли портал, ведущий в неисследованную часть острова...";
};


func int DIA_Addon_Xardas_Portal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_WhatsOrnament) && !C_ScHasBeliarsWeapon() && (Saturas_KlaueInsMeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_00");	//Маги воды нашли портал, ведущий в неисследованную часть острова...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_01");	//Как интересно...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_02");	//Как только ты узнаешь что-нибудь, что действительно сможет нам помочь, дай мне знать!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_03");	//Где-то там может быть спрятан артефакт Белиара. Ты должен найти его!
};


instance DIA_Addon_Xardas_PortalAgain(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_PortalAgain_Condition;
	information = DIA_Addon_Xardas_PortalAgain_Info;
	permanent = TRUE;
	description = "Насчет этой неизвестной части острова...";
};


func int DIA_Addon_Xardas_PortalAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Xardas_Portal) && !C_ScHasBeliarsWeapon() && (Saturas_KlaueInsMeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_17");	//Насчет этой неизвестной части острова...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_18");	//Меня не интересуют детали. Возвращайся, если узнаешь что-нибудь действительно полезное.
};


instance DIA_Addon_Xardas_AddonSuccess(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_AddonSuccess_Condition;
	information = DIA_Addon_Xardas_AddonSuccess_Info;
	description = "Я исследовал неизвестную часть острова...";
};


func int DIA_Addon_Xardas_AddonSuccess_Condition()
{
	if(C_ScHasBeliarsWeapon() || (Saturas_KlaueInsMeer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_03");	//Я исследовал неизвестную часть острова...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_04");	//И что ты нашел?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_05");	//Все кончилось тем, что в мои руки попал Коготь Белиара.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//Коготь Белиара?! Где он сейчас? Он у тебя с собой?
	if(C_ScHasBeliarsWeapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//Да, вот он.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_08");	//(жадно) Как интересно...
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_09");	//Это оружие может нам очень помочь. Но оно также и очень опасно.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_10");	//Будь осторожнее! И самое главное, не потеряй Коготь!
		B_GivePlayerXP(XP_Ambient * 3);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//У меня его больше нет...
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//Я отдал его магам воды, чтобы они утопили его в море...
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_13");	//(кричит) Ты сошел с ума?! Да ты хотя бы понимаешь, что ты отдал?
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_14");	//Это оружие могло бы сослужить нам огромную службу!
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_15");	//Я думаю, что я сделал правильный выбор.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_16");	//(вздыхает) Пути богов неисповедимы...
	};
};


instance DIA_Xardas_WEAPON(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_WEAPON_Condition;
	information = DIA_Xardas_WEAPON_Info;
	permanent = FALSE;
	description = "Мне нужно оружие.";
};


func int DIA_Xardas_WEAPON_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//Мне нужно оружие.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//Я могу дать тебе только то немногое, что у меня есть здесь.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//Посмотри в моей башне. Ты можешь взять все, что покажется тебе полезным.
};


instance DIA_Xardas_ARTEFAKT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_ARTEFAKT_Condition;
	information = DIA_Xardas_ARTEFAKT_Info;
	permanent = FALSE;
	description = "А что такое этот 'Глаз Инноса'?";
};


func int DIA_Xardas_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//А что такое этот 'Глаз Инноса'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//Это амулет. Легенды гласят, что сам Иннос вложил часть своей силы в этот амулет.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Он восстановит часть твоей потерянной силы и поможет нам победить драконов.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//Также он обладает и другими скрытыми возможностями. Я расскажу тебе больше, когда этот амулет будет у тебя в руках.
};


instance DIA_Xardas_PALADIN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_PALADIN_Condition;
	information = DIA_Xardas_PALADIN_Info;
	permanent = FALSE;
	description = "А почему паладины должны отдать мне этот Глаз Инноса?";
};


func int DIA_Xardas_PALADIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PALADIN_Info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//А почему паладины должны отдать мне этот Глаз Инноса?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Потому что ты тот, кому судьбой предназначено носить его.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//А откуда тебе это известно?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//Есть несколько причин полагать это. Вот самая важная из них: ты победил Спящего. Если бы тебе не благоволили боги, ты бы давно уже был мертв.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//Предположим, что ты прав, и мне действительно предначертано носить Глаз Инноса. А откуда паладины узнают, что это правда?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Глаз сам выбирает того, кто может носить его. Когда ты наденешь его, все сомнения паладинов рассеются.
};


instance DIA_Xardas_Khorinis(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 4;
	condition = DIA_Xardas_Khorinis_Condition;
	information = DIA_Xardas_Khorinis_Info;
	permanent = FALSE;
	description = "А как мне добраться до города?";
};


func int DIA_Xardas_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Lothar.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//А как мне добраться до города?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Просто иди по тропинке, ведущей отсюда через горы. Город большой, ты его не пропустишь.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Но будь осторожен! Путь в город полон опасностей. А ты сейчас далеко не так силен, как был раньше.
};


instance DIA_Xardas_WhereEx(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 6;
	condition = DIA_Xardas_WhereEx_Condition;
	information = DIA_Xardas_WhereEx_Info;
	permanent = FALSE;
	description = "А где именно мы сейчас находимся?";
};


func int DIA_Xardas_WhereEx_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//А где именно мы сейчас находимся?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//Как я уже сказал, неподалеку от города Хоринис.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Я отстроил мою башню здесь.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Но ведь прошло всего несколько дней, с тех пор как мы были в Долине Рудников...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//Слуги, которых я вызвал для строительства мой башни, проделали потрясающую работу...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Да, похоже на это.
};


instance DIA_Xardas_EQUIPMENT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 7;
	condition = DIA_Xardas_EQUIPMENT_Condition;
	information = DIA_Xardas_EQUIPMENT_Info;
	permanent = FALSE;
	description = "А где я смогу найти снаряжение получше?";
};


func int DIA_Xardas_EQUIPMENT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_WEAPON) && Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//А где я смогу найти снаряжение получше?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Ближайшее место, где ты сможешь раздобыть приличное оружие и доспехи - город Хоринис.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Но внизу, в долине, ты сможешь найти целебные травы, которые помогут тебе, если ты будешь ранен в бою.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Видишь озеро справа от моей башни? Оттуда в долину ведет секретный проход.
};


instance DIA_Xardas_ABOUTLESTER(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_ABOUTLESTER_Condition;
	information = DIA_Xardas_ABOUTLESTER_Info;
	permanent = FALSE;
	description = "Ты уже поговорил с Лестером?";
};


func int DIA_Xardas_ABOUTLESTER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_SEND_XARDAS) && (Npc_GetDistToWP(Lester,"NW_XARDAS_TOWER_IN1_31") <= 500) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ABOUTLESTER_Info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Ты уже поговорил с Лестером?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Да, я просто засыпал его вопросами. Он многое смог рассказать мне, но он полностью вымотан.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//Это почти чудо, что ему удалось выжить. Я отправил его в постель.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Что он рассказал тебе?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Боюсь, что ничего хорошего. Он видел не только дракона, но еще и людей в черных плащах с капюшонами.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//И?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Если эти люди существуют, то их присутствие несет определенную угрозу.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//И мне это не нравится. Вот, возьми мое кольцо. Оно защитит тебя от магии.
	B_GiveInvItems(self,other,ItRi_Prot_Mage_01,1);
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_FirstPal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = DIA_Xardas_FirstPal_Condition;
	information = DIA_Xardas_FirstPal_Info;
	permanent = FALSE;
	description = "Я был в городе...";
};


func int DIA_Xardas_FirstPal_Condition()
{
	if((Lothar.aivar[AIV_TalkedToPlayer] == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstPal_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//Я был в городе...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//И? Ты смог поговорить с предводителем паладинов?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Меня к нему не пропустят...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//Чушь! Должен быть способ увидеться с ним.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Если все остальное не получится, вступи в монастырь и стань магом.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Это, возможно, сомнительная затея с точки зрения морали, но это даст тебе то, что тебе нужно.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Если ты будешь магом, ему придется встретиться с тобой.
};


instance DIA_Xardas_Weiter(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = DIA_Xardas_Weiter_Condition;
	information = DIA_Xardas_Weiter_Info;
	permanent = TRUE;
	description = "И что нам делать дальше?";
};


func int DIA_Xardas_Weiter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Weiter_Info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//И что нам делать дальше?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Мы должны действовать согласно нашему плану. Другого пути нет.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Ты должен добыть Глаз Инноса, а я буду продолжать искать ответы.
};


instance DIA_Xardas_KdfSecret(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 9;
	condition = DIA_Xardas_KdfSecret_Condition;
	information = DIA_Xardas_KdfSecret_Info;
	permanent = FALSE;
	description = "Почему Круг Огня не должен знать о тебе?";
};


func int DIA_Xardas_KdfSecret_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};

func void DIA_Xardas_KdfSecret_Info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Почему Круг Огня не должен знать о тебе?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//Когда-то я был высшим членом Круга. Даже тогда я подозревал, что демоническая магия может быть ключом к этому магическому барьеру.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Но мне было ни за что не убедить остальных членов Круга последовать этому пути.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Поэтому я покинул Круг, чтобы изучать черную магию.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//Это преступление, которому в глазах Магов Огня, (язвительно) 'Посвященных Инноса', всегда таких 'Добрых' и 'Добродетельных', никогда не будет оправдания.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Они уверены, что я все еще жив, но они понятия не имеют, где искать меня - и это хорошо.
};


instance DIA_Xardas_KAP3_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP3_EXIT_Condition;
	information = DIA_Xardas_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BACKFROMOW(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 31;
	condition = DIA_Xardas_BACKFROMOW_Condition;
	information = DIA_Xardas_BACKFROMOW_Info;
	description = "Я вернулся из Долины Рудников.";
};


func int DIA_Xardas_BACKFROMOW_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Я вернулся из Долины Рудников.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//Давно бы пора. И что ты там видел?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//Ты был прав. Там все кишит врагами, даже яблоку упасть негде.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Орки осаждают замок, а драконы опустошают все вокруг.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Осталось недолго, прежде чем они нападут на Хоринис, если я не ошибаюсь.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_DMTSINDDA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 32;
	condition = DIA_Xardas_DMTSINDDA_Condition;
	information = DIA_Xardas_DMTSINDDA_Info;
	description = "Что, черт возьми, произошло здесь?";
};


func int DIA_Xardas_DMTSINDDA_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info()
{
	if(Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Лестер сказал, что ты хотел видеть меня как можно быстрее.
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Что, черт возьми, произошло здесь?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Враг узнал, кем ты являешься на самом деле, и планирует завладеть Глазом Инноса.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Он распознал эту угрозу. Это заставило его выйти из тени и решиться на открытую атаку.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Игра в прятки окончена. Вчера еще никто не знал, какова будет атака врага. Но теперь это становится слишком очевидно.
	B_LogEntry(TOPIC_INNOSEYE,"Врагу теперь известно, что я ищу Глаз Инноса. Мне нужно побыстрее найти его, пока еще не слишком поздно.");
	Info_ClearChoices(DIA_Xardas_DMTSINDDA);
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Меня атаковали маги в черных мантиях.",DIA_Xardas_DMTSINDDA_DMT);
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Я, наконец, добыл доказательство, для лорда Хагена.",DIA_Xardas_DMTSINDDA_Beweis);
};

func void DIA_Xardas_DMTSINDDA_DMT()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Меня атаковали маги в черных мантиях.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//У врага много обличий. Ищущие - одно из них. Они те, кто подготавливает плацдарм для врага.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Они заняли позиции в стратегических местах, и теперь только ждут возможности захлопнуть ловушку.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Держись от них подальше. Они сильные маги, и они попытаются во что бы то ни стало остановить тебя.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		B_LogEntry(TOPIC_DEMENTOREN,"Ксардас знает кто такие эти люди в черных рясах. Похоже именно Ищущие  заправляют всем в о вражеских рядах, и они очень опасны.");
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Я, наконец, добыл доказательство, которое требовал от меня лорд Хаген.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Что еще за доказательство?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Я получил письмо от Гаронда, предводителя паладинов в Долине Рудников. В нем он просит о подкреплении.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//Этого должно быть достаточно, чтобы убедить воинственного ветерана. Отлично.
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"И каков будет наш следующий шаг?",DIA_Xardas_DMTSINDDA_DMT_WhatToDo);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//И каков будет наш следующий шаг?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Иди и отнеси Лорду Хагену письмо от Гаронда, и добейся от него, чтобы он позволил тебя взять Глаз Инноса.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Затем иди в монастырь, и поговори с Пирокаром. Он должен дать тебе Глаз.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Сейчас нет ничего более важного, чем обеспечить безопасность этого артефакта.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Иди, пока еще не слишком поздно. Враг также попытается наложить на него свои лапы.
	B_LogEntry(TOPIC_INNOSEYE,"Глаз находится в монастыре магов огня. Я надеюсь, что лорд Хаген предоставит мне доступ к нему, когда я принесу ему письмо от лорда Гаронда. Верховный маг Пирокар не позволит мне надеть этот амулет без одобрения Хагена.");
};


instance DIA_Xardas_INNOSEYEBROKEN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 33;
	condition = DIA_Xardas_INNOSEYEBROKEN_Condition;
	information = DIA_Xardas_INNOSEYEBROKEN_Info;
	description = "Глаз Инноса был уничтожен.";
};


func int DIA_Xardas_INNOSEYEBROKEN_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Глаз Инноса был уничтожен.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Что ты говоришь? Уничтожен!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Я нашел его в северных лесах - к сожалению, мне удалось найти только фрагменты.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//Это был наш единственный шанс противостоять этим драконам. И мы провалили его!
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice(DIA_Xardas_INNOSEYEBROKEN,"И что теперь?",DIA_Xardas_INNOSEYEBROKEN_wasnun);
};

func void DIA_Xardas_INNOSEYEBROKEN_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//И что теперь?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//Это болезненный удар. Мы должны перестроиться. Я должен уединиться, и все взвесить.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//А тем временем, ты отправляйся в город и поговори с Ватрасом, Магом Воды. Возможно, он знает, что нужно делать.
	B_LogEntry(TOPIC_INNOSEYE,"Ксардас остался не очень доволен уничтожением Глаза Инноса. Маг воды Ватрас в городе Хоринис, возможно, наша единственная надежда.");
	MIS_Xardas_GoToVatrasInnoseye = LOG_Running;
};


instance DIA_Xardas_RITUALREQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_RITUALREQUEST_Condition;
	information = DIA_Xardas_RITUALREQUEST_Info;
	description = "Ватрас отправил меня к тебе.";
};


func int DIA_Xardas_RITUALREQUEST_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && Npc_KnowsInfo(other,DIA_Xardas_INNOSEYEBROKEN) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RITUALREQUEST_Info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Ватрас отправил меня к тебе.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//Хорошо. Что он сказал?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Он сказал, что-то о ритуале обращения в Круге Солнца.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(смеется) Вот старый дьявол. Думаю, я знаю, что он затеял. Ты пришел, чтобы призвать меня к нему.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Похоже на то. Когда ты отправляешься?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Не стоит заставлять Ватраса ждать. Я отправляюсь немедленно. А ты должен выполнить свою задачу, а затем присоединиться ко мне опять.
		AI_StopProcessInfos(self);
		B_LogEntry(TOPIC_INNOSEYE,"Ксардас согласился участвовать в ритуале в Круге Солнца.");
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//Я буду помогать в этом ритуале только когда буду уверен, что ты готов к встрече с драконами.
	};
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_WARUMNICHTJETZT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_WARUMNICHTJETZT_Condition;
	information = DIA_Xardas_WARUMNICHTJETZT_Info;
	description = "Почему бы тебе не отправиться на встречу с Ватрасом ПРЯМО СЕЙЧАС?";
};


func int DIA_Xardas_WARUMNICHTJETZT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//Почему бы тебе не отправиться на встречу с Ватрасом ПРЯМО СЕЙЧАС?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//Иногда я просто не понимаю тебя.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(раздраженно) Не смей говорить со мной в таком тоне. Если бы не я, твое ни на что не годное тело до сих пор бы гнило в этом храме.
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"Не волнуйся! Просто скажи, что мне нужно сделать.",DIA_Xardas_WARUMNICHTJETZT_wastun);
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"Тогда, по крайней мере объясни мне, почему ты колеблешься.",DIA_Xardas_WARUMNICHTJETZT_grund);
};

func void DIA_Xardas_WARUMNICHTJETZT_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//Тогда, по крайней мере объясни мне, почему ты колеблешься.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//С тех пор, как я отошел от Магов Огня, я старался держаться от них подальше.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//И я не собираюсь изменять этой привычке, если только у меня совсем уж не будет выбора.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//Но прежде, чем я предстану перед укоризненным взором этих магов, я сначала хочу убедиться, что у тебя есть хоть какие-то шансы противостоять драконам.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//С твоим жалким снаряжением, впрочем, тебе далеко не продвинуться. Возвращайся, когда станешь достаточно силен.
	AI_StopProcessInfos(self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//Не волнуйся! Просто скажи, что мне нужно сделать.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//Ты все еще слишком слаб, чтобы сражаться с драконами. С этим снаряжением у тебя нет никаких шансов.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//Не возвращайся ко мне, пока не будешь полностью готов. Вот тогда я пойду, и присоединюсь к Ватрасу.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BEREIT(C_Info)
{
	npc = NONE_100_Xardas;
	condition = DIA_Xardas_BEREIT_Condition;
	information = DIA_Xardas_BEREIT_Info;
	description = "Я готов к сражению с драконами.";
};


func int DIA_Xardas_BEREIT_Condition()
{
	if((Xardas_GoesToRitualInnosEye == FALSE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//Я готов к сражению с драконами.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//Тогда не будем терять времени. Я немедленно отправляюсь к Кругу Солнца. А ты выполни свои задачи. Я встречу тебя там.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_INNOSEYE,"Ксардас согласился участвовать в ритуале в Круге Солнца.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	Xardas_GoesToRitualInnosEye = TRUE;
};


instance DIA_Xardas_BINGESPANNT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 35;
	condition = DIA_Xardas_BINGESPANNT_Condition;
	information = DIA_Xardas_BINGESPANNT_Info;
	permanent = TRUE;
	description = "Этот ритуал обращения сработает?";
};


func int DIA_Xardas_BINGESPANNT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3) && (Xardas_GoesToRitualInnosEye == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BINGESPANNT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Этот ритуал обращения сработает?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//Я не совсем уверен. Это зависит от того, что именно собирается сделать Ватрас.
};


instance DIA_Xardas_PYROWILLNICHT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 37;
	condition = DIA_Xardas_PYROWILLNICHT_Condition;
	information = DIA_Xardas_PYROWILLNICHT_Info;
	description = "Пирокар отказывается принять участие в ритуале.";
};


func int DIA_Xardas_PYROWILLNICHT_Condition()
{
	if((Pyrokar_DeniesInnosEyeRitual == TRUE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PYROWILLNICHT_Info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Пирокар отказывается принять участие в ритуале.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//Сначала он хочет получить доказательства того, что он может доверять тебе.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//Ах, неужели! Пирокар. Как интересно.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Этот старый чудак становится совершенно невыносимым. Но я думаю, у меня есть кое-что, что поможет тебе.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Когда я покидал орден Магов Огня, я взял с собой из монастыря несколько вещей.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Я не хотел, чтобы паладины или Маги Огня перевернули все в моей башне вверх дном, и нашли эти вещи.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Поэтому я спрятал их в надежном месте, где магам никогда не придет в голову искать их.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//И где же?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//Некоторые из них лежат в запертом сундуке на ферме Секоба.
	Sekob_RoomFree = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Ты доверяешь этому Секобу?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Нет. Но его можно купить и он не будет задавать глупых вопросов. К тому же, этот сундук заперт. Вот ключ.
	CreateInvItems(self,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	B_GiveInvItems(self,other,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Там, среди прочего, есть очень старая книга. Когда Пирокар увидит эту книгу, он поймет, что она от меня.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//Она больше не нужна мне. Поэтому, пусть она послужит хоть такой цели.
	B_LogEntry(TOPIC_INNOSEYE,"Ксардас дал мне ключ от сундука на ферме Секоба. Я должен отнести книгу, находящуюся в нем, Пирокару.");
};


instance DIA_Xardas_RitualInnosEyeRepairImportant(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information = DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important = TRUE;
};


func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Теперь, когда Глаз Инноса восстановлен, ты должен предстать перед драконами!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//Все они служат Белиару, богу тьмы.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Но должна быть также земная сила, которая контролирует их. Теперь это стало очевидным для меня.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Найди источник этой силы.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//А как только ты выяснишь это, сразу же возвращайся ко мне!
	Info_ClearChoices(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice(DIA_Xardas_RitualInnosEyeRepairImportant,Dialog_Ende,DIA_Xardas_RitualInnosEyeRepairImportant_weiter);
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
{
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Xardas,"Start");
	B_StartOtherRoutine(Vatras,"Start");
};


instance DIA_Xardas_WASNUN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_WASNUN_Condition;
	information = DIA_Xardas_WASNUN_Info;
	permanent = TRUE;
	description = "Глаз Инноса восстановлен. Что дальше?";
};


func int DIA_Xardas_WASNUN_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WASNUN_Info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Глаз Инноса восстановлен. Что дальше?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Не забудь надеть его, когда ты, наконец, предстанешь перед драконами.
	if(MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Не теряй времени. Отправляйся в Долину Рудников и убей этих драконов.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Иди к Пирокару, и пусть он объяснит тебе, как пользоваться Глазом.
	};
};


instance DIA_Xardas_KAP4_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP4_EXIT_Condition;
	information = DIA_Xardas_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_PERM4(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 40;
	condition = DIA_Xardas_PERM4_Condition;
	information = DIA_Xardas_PERM4_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_Xardas_PERM4_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Что нового?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//Ищущие еще не ушли. Они не остановятся, пока не прикончат тебя.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Убей драконов в Долине Рудников и выясни, кто стоит за этими нападениями. В противном случае, их сила только вырастет еще больше.
};


instance DIA_Xardas_KAP5_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP5_EXIT_Condition;
	information = DIA_Xardas_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_KAP6_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP6_EXIT_Condition;
	information = DIA_Xardas_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

