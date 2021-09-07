
instance DIA_VLK_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_6_EXIT_Condition;
	information = DIA_VLK_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_6_JOIN_Condition;
	information = DIA_VLK_6_JOIN_Info;
	permanent = TRUE;
	description = "Как мне стать гражданином этого города?";
};


func int DIA_VLK_6_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_6_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_00");	//Как мне стать гражданином этого города?
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_01");	//Ты хочешь осесть здесь? Сейчас? Когда все указывает на приближение конца света?
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_02");	//Я не планировал оставаться здесь навечно.
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_03");	//Хочешь совет? Тебе нужно бежать отсюда, и чем дальше, тем лучше. Но, впрочем, если ты настаиваешь, то можешь поговорить с кем-нибудь из влиятельных горожан.
};


instance DIA_VLK_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_6_PEOPLE_Condition;
	information = DIA_VLK_6_PEOPLE_Info;
	permanent = TRUE;
	description = "А где мне найти влиятельных граждан Хориниса?";
};


func int DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_6_PEOPLE_15_00");	//А где мне найти влиятельных граждан Хориниса?
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_01");	//Попробуй обратиться к кузнецу или плотнику в нижней части города. Там же ты найдешь и других уважаемых мастеров.
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_02");	//К их словам здесь прислушиваются даже паладины и городская стража.
};


instance DIA_VLK_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_6_LOCATION_Condition;
	information = DIA_VLK_6_LOCATION_Info;
	permanent = TRUE;
	description = "Как мне научиться ориентироваться в городе?";
};


func int DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_6_LOCATION_15_00");	//Как мне научиться ориентироваться в городе?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_01");	//Тебе кажется, что здесь не так-то просто найти дорогу? Даже указатели не всегда помогают?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_02");	//Если у тебя так плохо с ориентированием, тебе лучше спуститься в гавань - если ты найдешь путь туда - и поискать дом картографа.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_03");	//Он находится рядом с кабаком у причала. У Ибрагима наверняка найдется карта города для тебя.
	if(Brahim_Trade == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Ибрагим рисует карты и продает их в гавани.");
		Brahim_Trade = TRUE;
	};
};


instance DIA_VLK_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_6_STANDARD_Condition;
	information = DIA_VLK_6_STANDARD_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_6_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_01");	//С тех пор, как рухнул Барьер, город заполонили бандиты. Но паладины сидят сложа руки. Что они вообще тогда здесь делают, черт возьми?
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_02");	//Последнее время проблема с бандитами не стоит так остро. Похоже, кто-то, наконец, взялся за них.
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_03");	//Они отпустили этого грязного наемника, убившего паладина. По-моему, лучше его было все же повесить.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_04");	//Говорят, что один из наемников Онара убил паладина. Убийцу поймали и бросили за решетку. Скоро его повесят.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_05");	//Интересно, есть хоть доля правды в этих рассказах о драконах...
	}
	else if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_06");	//Говорят, что лорд Хаген собирает своих людей, чтобы освободить Долину Рудников. Наконец-то паладины зашевелились!
	};
};

func void B_AssignAmbientInfos_VLK_6(var C_Npc slf)
{
	dia_vlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

