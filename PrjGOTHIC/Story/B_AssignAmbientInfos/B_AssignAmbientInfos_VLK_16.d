
instance DIA_VLK_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_16_EXIT_Condition;
	information = DIA_VLK_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_16_JOIN_Condition;
	information = DIA_VLK_16_JOIN_Info;
	permanent = TRUE;
	description = "Я хочу стать гражданином этого города!";
};


func int DIA_VLK_16_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Я хочу стать гражданином этого города!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Ты поможешь нам защититься от орков?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Если ты гражданин Хориниса, ты можешь поступить в ополчение - поговори с кем-нибудь из городской стражи.
};


instance DIA_VLK_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_16_PEOPLE_Condition;
	information = DIA_VLK_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто здесь самые влиятельные люди?";
};


func int DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Кто здесь самые влиятельные люди?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Паладины, которые живут в верхнем квартале.
};


instance DIA_VLK_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_16_LOCATION_Condition;
	information = DIA_VLK_16_LOCATION_Info;
	permanent = TRUE;
	description = "Что здесь интересного?";
};


func int DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Что интересного можно найти здесь?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//На рынке ты можешь купить практически любые товары.
};


instance DIA_VLK_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_16_STANDARD_Condition;
	information = DIA_VLK_16_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//Надеюсь, ополчение выяснит, наконец, куда девается население Хориниса.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//Начинаешь бояться за свою жизнь, когда слышишь, сколько человек пропало.
		if(SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
			B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		};
		SC_HearedAboutMissingPeople = TRUE;
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Ты разве не слышал? Орки уже около города! Остается надеяться, что у паладинов достаточно людей.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//Интересно, почему фермеры больше не приходят на рынок?
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//Наемник, который, как все думали, убил Лотара, оказался невиновным. Нашли доказательства, что его оклеветали. Я слышала об этом на рынке.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//Это возмутительно. Наемники Онара убили уважаемого паладина Лотара прямо у всех на глазах.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Но Иннос обязательно накажет их за их грехи. Никому не позволено поднимать руку на солдата нашего Владыки.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Я слышала, что эти преступники бегут с фермы Онара. Говорят, они боятся возмездия паладинов лорда Хагена, и бегут от них назад, в Долину Рудников.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Я слышала, что паладинам удалось уничтожить всех этих ужасных драконов из Долины Рудников.
	};
};

func void B_AssignAmbientInfos_VLK_16(var C_Npc slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

