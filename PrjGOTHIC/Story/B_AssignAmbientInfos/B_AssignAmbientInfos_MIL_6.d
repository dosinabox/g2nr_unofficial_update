
instance DIA_MIL_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_6_EXIT_Condition;
	information = DIA_MIL_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_MIL_6_JOIN_Condition;
	information = DIA_MIL_6_JOIN_Info;
	permanent = TRUE;
	description = "Что мне нужно сделать, чтобы вступить в ополчение?";
};


func int DIA_MIL_6_JOIN_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_MIL_6_JOIN_Info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Что мне нужно сделать, чтобы вступить в ополчение?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Иди к лорду Андрэ и поговори с ним. С тех пор, как паладины пришли в город, он командует всем ополчением.
	if(C_NpcIsInQuarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Ты найдешь его в казармах. Он практически всегда там.
	};
};


instance DIA_Addon_MIL_6_MissingPeople(C_Info)
{
	nr = 2;
	condition = DIA_Addon_MIL_6_MissingPeople_Condition;
	information = DIA_Addon_MIL_6_MissingPeople_Info;
	permanent = TRUE;
	description = "Я слышал, что исчезли несколько горожан.";
};


func int DIA_Addon_MIL_6_MissingPeople_Condition()
{
	if((Kapitel == 1) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_MIL_6_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_MIL_6_MissingPeople_15_00");	//Я слышал, что исчезли несколько горожан.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_01");	//И я недавно слышал слухи об исчезновении людей.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_02");	//Не могу даже представить, чем это можно объяснить.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_03");	//И мы не можем сделать ничего кроме того, чтобы смотреть в оба и исполнять свой долг стражников.
};


instance DIA_MIL_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_MIL_6_PEOPLE_Condition;
	information = DIA_MIL_6_PEOPLE_Info;
	permanent = TRUE;
	description = "Расскажи мне об этих паладинах.";
};


func int DIA_MIL_6_PEOPLE_Condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MIL_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//Расскажи мне об этих паладинах.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//С тех пор, как паладины прибыли в Хоринис, они остановились в верхнем квартале города.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Они никого туда больше не пускают. За исключением граждан города и ополчения, конечно же.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Также несколько паладинов охраняет их корабль в гавани. Но они не особенно склонны к разговорам.
};


instance DIA_MIL_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_MIL_6_LOCATION_Condition;
	information = DIA_MIL_6_LOCATION_Info;
	permanent = TRUE;
	description = "Что мне нужно знать об этом городе?";
};


func int DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Что мне нужно знать об этом городе?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Паладины контролируют весь город. Ополчение полностью подчиняется им.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Лорд Андрэ командует ополчением, и в то же время он выступает в роли судьи.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Если тебе случится нарушить закон, тебе придется предстать перед ним.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Но он довольно снисходительный судья, насколько я знаю. Обычно провинившиеся отделываются лишь штрафом.
};


instance DIA_MIL_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_MIL_6_STANDARD_Condition;
	information = DIA_MIL_6_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//В последнее время город просто наводнен всяким сбродом.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Воровство стало просто невыносимым. Лорд Андрэ подозревает, что это дело рук банды.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Не так давно мы перевернули вверх дном весь портовый квартал, но ничего не нашли.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Похоже, мы взяли проблему с бандитами под контроль. Набеги случаются все реже и реже.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Ситуация в городе становится все хуже и хуже. И все из-за этого сброда, наводнившего город. Прошлой ночью я следил в верхнем квартале за человеком в черной рясе.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Я уверен, что он задумал что-то худое. Но когда я приблизился к нему у дома губернатора, он просто исчез. Очень подозрительная личность...
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//Говорят, что лорд Хаген нанял наемников, чтобы те сражались против драконов. Мне-то все равно, хотя я сам был бы не прочь сразиться с драконом.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//Говорят, что все драконы уничтожены! Лорд Хаген собирает свои войска, чтобы изгнать оставшихся тварей из Долины Рудников.
	};
};

func void B_AssignAmbientInfos_MIL_6(var C_Npc slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

