
instance DIA_BAU_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_16_EXIT_Condition;
	information = DIA_BAU_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_16_JOIN_Condition;
	information = DIA_BAU_16_JOIN_Info;
	permanent = TRUE;
	description = "Расскажи мне подробнее об этих наемниках!";
};


func int DIA_BAU_16_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Расскажи мне подробнее об этих наемниках!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//Они слоняются без дела по ферме, дерутся иногда и думают, что это забавно.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//Наемники, конечно.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Онар платит им, но большую часть времени они делают, что им захочется.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне об этом квартале?";
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//Что ты можешь рассказать интересного об этой местности?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//Здесь есть три фермы. Ферма Онара на востоке, а Секоба на севере долины.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//Отсюда в горы на юго-западе, ведет каменная лестница. Там находится ферма Бенгара.
};


instance DIA_BAU_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//Солдаты из города больше не забирают наш скот и урожай! Мы больше не играем в эти игры. Теперь мы способны защитить себя!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//Говорят, что в Долине Рудников собирается армия зла. Скоро они будут здесь.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//Я слышала, что в Долине Рудников появились драконы. Но мне не очень-то верится в это.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Кое-кто из наемников ушел отсюда. Я даже не знаю, хорошо это или плохо.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Паладины отправились в Долину Рудников - интересно, зачем?
	};
};

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

