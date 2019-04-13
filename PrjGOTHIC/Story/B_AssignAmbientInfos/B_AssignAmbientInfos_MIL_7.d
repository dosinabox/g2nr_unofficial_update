
instance DIA_MIL_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_7_EXIT_Condition;
	information = DIA_MIL_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_MIL_7_JOIN_Condition;
	information = DIA_MIL_7_JOIN_Info;
	permanent = TRUE;
	description = "Я хочу вступить в ополчение!";
};


func int DIA_MIL_7_JOIN_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_MIL_7_JOIN_Info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//Я хочу вступить в ополчение!
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//Ты даже не гражданин Хориниса! С чего ты взял, что лорд Андрэ возьмет тебя?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//Так каждый мог бы вступить, получить оружие и доспехи бесплатно, а затем исчезнуть с ними!
		if(C_NpcIsInQuarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//Но у меня серьезные намерения!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//Не надо объяснять это мне, попробуй объяснить это лорду Андрэ. Ты найдешь его в казармах.
		};
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_MIL_7_PEOPLE_Condition;
	information = DIA_MIL_7_PEOPLE_Info;
	permanent = TRUE;
	description = "Что ты знаешь о паладинах?";
};


func int DIA_MIL_7_PEOPLE_Condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MIL_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//Не многое. Никто точно не знает, зачем они здесь. Даже те, кто входит в городскую стражу.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//Они взяли всю власть в городе в свои руки. Выгнали губернатора из зала заседаний и судью из его палаты.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//Если тебя интересует мое мнение - то это даже хорошо. Этим напыщенным ослам стоило преподать урок.
};


instance DIA_MIL_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_MIL_7_LOCATION_Condition;
	information = DIA_MIL_7_LOCATION_Info;
	permanent = TRUE;
	description = "А чем я могу заняться в городе?";
};


func int DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//А чем я могу заняться в городе?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//Если ты не хочешь закончить жизнь в сточной канаве в порту, найди постоянную работу. Поспрашивай в нижней части города - возможно, тебе повезет.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//Если ты планируешь остаться в городе надолго, тебе стоит подумать о вступлении в ополчение или, по крайней мере, потренироваться в боевых искусствах.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//Инструкторы боя в казармах тренируют и гражданских.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//Скоро придут орки, и тогда ты будешь рад каждому часу, проведенному на плацу.
};


instance DIA_MIL_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_MIL_7_STANDARD_Condition;
	information = DIA_MIL_7_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_STANDARD_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_MIL_7_STANDARD_07_00");	//Горожане исчезают один за одним. Пока что нам не удалось выяснить, в чем дело. Может быть, виноваты орки?
			if(SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
				B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//Говорят, что фермеры взбунтовались. Только этого нам еще не хватало. Как раз в самый разгар войны с орками!
		};
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//Паладины должны подавить восстание фермеров. Тот, кто нарушает закон, должен быть наказан. Особенно сейчас, когда идет война.
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//Наемник, которого обвиняли в убийстве Лотара, оказался невиновным. Кто-то смог доказать, что его оклеветали.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//Один из наемников Онара убил благородного паладина Лотара. Но этого ублюдка удалось схватить и бросить за решетку.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//Часть наемников уже покинула ферму Онара. Некоторые проблемы решаются сами собой.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//С драконами покончено, но это еще не все. Следующие на очереди орки. Их мы тоже скоро уничтожим!
	};
};

func void B_AssignAmbientInfos_MIL_7(var C_Npc slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

