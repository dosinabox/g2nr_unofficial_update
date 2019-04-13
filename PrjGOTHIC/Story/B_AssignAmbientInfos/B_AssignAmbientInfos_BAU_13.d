
instance DIA_BAU_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_13_EXIT_Condition;
	information = DIA_BAU_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_13_JOIN_Condition;
	information = DIA_BAU_13_JOIN_Info;
	permanent = TRUE;
	description = "Расскажи мне подробнее об этих наемниках!";
};


func int DIA_BAU_13_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_13_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Расскажи мне подробнее об этих наемниках!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Если у тебя с ними какие-то проблемы, иди к Ли. Мы, фермеры, всегда так делаем. Он держит своих людей в ежовых рукавицах.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Если кто-то из них ведет себя неправильно, он рискует нарваться на неприятности.
};


instance DIA_BAU_13_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_13_PEOPLE_Condition;
	information = DIA_BAU_13_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Если тебе интересно мое мнение - то наемники. Конечно, Онар платит им, но только Иннос знает, сколько еще они будут повиноваться его приказам.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//Я не хотел бы оказаться в его шкуре, если до наемников вдруг дойдет, что без него можно обойтись.
};


instance DIA_BAU_13_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_13_LOCATION_Condition;
	information = DIA_BAU_13_LOCATION_Info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне об этом квартале?";
};


func int DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Что ты можешь сказать об этом районе?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//Здесь есть три фермы. Ферма Онара к востоку и Секоба к северу в конце долины.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//На юго-западе есть проход на высокогорное плато. Там находится ферма Бенгара.
};


instance DIA_BAU_13_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_13_STANDARD_Condition;
	information = DIA_BAU_13_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Войска из города больше не забирают наш урожай и скот! Они не захотели играть в эту игру, когда мы начали защищаться!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Паладинов из города не волнует судьба фермеров. Если нападут орки, мы будем брошены на произвол судьбы.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//Драконы! Ходят слухи, что в Долине Рудников появились драконы. Они скоро доберутся до Прохода!
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//Говорят, даже, что бандиты с гор направились в Долину Рудников. Ну, по мне - так это слишком опасно.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//Когда налоги будут снижены, и нам будут достойно платить за нашу работу, тогда мы опять будем торговать с городом.
	};
};

func void B_AssignAmbientInfos_BAU_13(var C_Npc slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

