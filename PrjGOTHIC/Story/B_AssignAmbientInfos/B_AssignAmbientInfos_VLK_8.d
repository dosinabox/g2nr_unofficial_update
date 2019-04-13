
instance DIA_VLK_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_8_EXIT_Condition;
	information = DIA_VLK_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_8_JOIN_Condition;
	information = DIA_VLK_8_JOIN_Info;
	permanent = TRUE;
	description = "Я хочу стать гражданином этого города!";
};


func int DIA_VLK_8_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Я хочу стать гражданином этого города!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//А мне ты зачем об этом говоришь? Иди к одному из мастеров ремесленников в нижней части города. Может быть, если тебе повезет, кому-нибудь из них нужен ученик.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//В противном случае, тебе придется обратиться к губернатору, чтобы он зарегистрировал тебя как гражданина.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//Но сейчас, ты можешь забыть об этом. С тех пор, как пришли паладины, губернатор больше ничего не решает.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//А у их главы, лорда Хагена, уж точно нет времени на такие пустяки.
};


instance DIA_VLK_8_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_8_PEOPLE_Condition;
	information = DIA_VLK_8_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто самые влиятельные граждане этого города?";
};


func int DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Кто самые влиятельные граждане этого города?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Кроме паладинов... мастера ремесленники из нижней части города. Они очень влиятельны.
};


instance DIA_VLK_8_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_8_LOCATION_Condition;
	information = DIA_VLK_8_LOCATION_Info;
	permanent = TRUE;
	description = "Что здесь интересного?";
};


func int DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Что интересного здесь можно увидеть?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//Большой корабль, на котором паладины приплыли в гавань. Это огромное судно! Тебе обязательно нужно взглянуть на него.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//Но я сомневаюсь, что они пустят тебя на борт. Паладины охраняют этот корабль лучше, чем королевские бриллианты.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Что неудивительно. Это единственное морское судно на многие мили вокруг.
};


instance DIA_VLK_8_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_8_STANDARD_Condition;
	information = DIA_VLK_8_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Все обеспокоены.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Мало было того, что паладины обосновались здесь, как дома, теперь еще постоянно пропадают люди самым странным образом.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Пора бы ополчению, наконец, сделать с этим что-нибудь.
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
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Все ждут, когда паладины объявят, зачем они сюда прибыли. Я полагаю, что из-за орков. Они, наверняка, скоро нападут на нас!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Паладины, может быть, и благословлены Инносом, но когда орды орков появятся здесь, я думаю, нам всем несдобровать.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//Я слышал, что паладины здесь только затем, чтобы выковырять из острова всю руду. Для войны на материке, как они говорят.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Ты понимаешь, что это означает? Король даже пальцем не пошевелит, если мы все тут погибнем во время атаки орков.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Я попробую попасть на корабль, когда паладины будут поднимать якорь.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//Говорят, что орки прилетят сюда на огромных драконах, размером с половину города! У нас нет ни единого шанса!
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Говорят, что все драконы уничтожены. Неужели это правда?
	};
};

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

