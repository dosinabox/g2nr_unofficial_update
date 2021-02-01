
instance DIA_Addon_Myxir_ADW_EXIT(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 999;
	condition = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_ADWHello(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_ADWHello_Condition;
	information = DIA_Addon_Myxir_ADWHello_Info;
	description = "Есть новые находки?";
};


func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Есть новые находки?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Зодчие просто поражают меня!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Жаль, что все они мертвы, как и их язык.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(задумчиво) Даже их могущественные ритуалы и духи предков не могли спасти их.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Духи предков?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Зодчие жили в тесной связи с миром духов.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Если я правильно понял, они верили, что их предки поддерживают с ними постоянный контакт.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Они регулярно проводили ритуалы, призывающие духов. Духи давали им советы и помогали достичь просвещения.
	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Как работали эти ритуалы?",DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"Та нежить, что мне доводилось встречать, была не очень-то разговорчивой.",DIA_Addon_Myxir_ADWHello_Watt);
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Как работали эти ритуалы?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Стражам мертвых были известны особые заклинания, которые использовались для умиротворения духов.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Впрочем, описания, которые я здесь нахожу, большей частью малопонятны. Очень редко мне удается найти четкий ответ на интересующий меня вопрос.
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//Та нежить, что мне доводилось встречать, была не очень-то разговорчивой.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Но зодчие призывали не злобных бездушных созданий, таких, как зомби или скелеты.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//Им удавалось вызывать духов великих воинов, жрецов и правителей.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Я не сомневаюсь, что они на самом деле существовали.
};


instance DIA_Addon_Myxir_PermADW(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_PermADW_Condition;
	information = DIA_Addon_Myxir_PermADW_Info;
	permanent = TRUE;
	description = "Если я встречу духа, то обязательно тебе сообщу.";
};


func int DIA_Addon_Myxir_PermADW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Если я встречу духа, то обязательно тебе сообщу.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(смеется) Да, я на этом настаиваю.
};


instance DIA_Addon_Myxir_GeistTafel(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistTafel_Condition;
	information = DIA_Addon_Myxir_GeistTafel_Info;
	description = "Меня послал Сатурас.";
};


func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if((Saturas_RiesenPlan == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Меня послал Сатурас.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Ворон проник в храм и закрыл его двери изнутри.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Сатурас считает, что он узнал о том, как попасть в храм, у духа!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(пораженно) О, Аданос!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Должно быть, чтобы узнать, как открыть ворота, он призвал верховного жреца Кардимона.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Судя по записям, его гробница была в пещерах под крепостью!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Ты должен поступить так же.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Но Кардимона тебе вызвать уже не удастся...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//На западе долины находится гробница Куарходрона, предводителя воинов.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Ты должен отыскать ее... и пробудить Куарходрона.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//Здесь написано, как тот, кто верит в Аданоса, может вызвать духа.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Ты думаешь, что это сработает?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//Мне в руки попадалось множество бессмысленных манускриптов.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Например, записи Ю'Бериона, предводителя Братства Спящего.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Но автору ЭТИХ записей я верю.
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_Running;
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Ты серьезно?",DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Почему Куарходрон? Почему не верховный жрец Кардимон?",DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"Братство Спящего распространяло не одну лишь ложь.",DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Почему Куарходрон? Почему не верховный жрец Кардимон?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Своим ритуалом Ворон осквернил гробницу Кардимона.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Так что тебе придется найти другого духа.
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Братство Спящего распространяло не одну лишь ложь. Спящий на самом деле существовал.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//Не то, о чем они говорили, заставляло сомневаться в их правдивости, а те слова, которые они использовали.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//Речи членов Братства были запутанны и непонятны. Их разум был затуманен болотной травой, которую они курили без остановки.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//А текст на этой табличке написан серьезным и разумным человеком. Это убеждает меня в правдивости его слов.
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Ты серьезно?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Мы должны использовать любую возможность.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//Даже если у нас есть лишь призрачный шанс встретиться с одним из зодчих, мы должны его использовать.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//В конце концов, Ворону-то это удалось.
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"И что же мне нужно сделать, чтобы вызвать этого духа?",DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//И что же мне нужно сделать, чтобы вызвать этого духа?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Найди гробницу Куарходрона. Она находится на западе долины.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Духа вызвать можно при помощи заклинания стражей мертвых. Вот, я записал его.
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//Это все. Теперь тебе нужно лишь отыскать гробницу.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Удачи, сын мой!
	B_LogEntry(TOPIC_Addon_Quarhodron,"Миксир хочет, чтобы я пробудил дух древнего короля воинов Куарходрона и попросил у него совета. Он дал мне бумагу с заклинанием, которое я должен прочитать в гробнице Куарходрона. Она находится на западе.");
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};


instance DIA_Addon_Myxir_GeistPerm(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistPerm_Condition;
	information = DIA_Addon_Myxir_GeistPerm_Info;
	permanent = TRUE;
	description = "Расскажи мне еще раз о том, как вызвать дух Куарходрона.";
};


func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Расскажи мне еще раз о том, как вызвать дух Куарходрона.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//Найди его гробницу и прочитай в ней заклинание стражей мертвых.
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//А что именно ты имел в виду?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Я записал слова. Ты должен просто прочитать их вслух.
};


instance DIA_Addon_Myxir_TalkedToGhost(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_TalkedToGhost_Info;
	description = "Я говорил с Куарходроном.";
};


func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Я говорил с Куарходроном.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(восхищенно) Тебе действительно удалось пробудить его от смертного сна?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//Невероятно! Меня все больше и больше восхищают эти зодчие.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Кто знает, чего бы они могли добиться, если бы их цивилизация не погибла...
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//И что же сказал дух?
	if(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Он рассказал мне о том, как попасть в храм Аданоса.
		if(Saturas_KnowsHow2GetInTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Тогда скорее иди к Сатурасу. Его, несомненно, заинтересует то, что ты ему расскажешь.
			B_LogEntry(TOPIC_Addon_Quarhodron,"Я должен сказать Сатурасу, что пробудил Куарходрона.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Зодчие просто поражают меня!
		};
	}
	else
	{
		DIA_Common_NothingImportantYet();
	};
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
};


instance DIA_Addon_Myxir_ADW_Teach(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 90;
	condition = DIA_Addon_Myxir_ADW_Teach_Condition;
	information = DIA_Addon_Myxir_ADW_Teach_Info;
	permanent = TRUE;
	description = "Научи меня этому языку.";
};


var int DIA_Addon_Myxir_ADW_Teach_NoPerm;

func int DIA_Addon_Myxir_ADW_Teach_Condition()
{
	if((DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();
	if(Myxir_Addon_TeachPlayer == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		Myxir_Addon_TeachPlayer = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,Dialog_Back,DIA_Addon_Myxir_ADW_Teach_BACK);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

