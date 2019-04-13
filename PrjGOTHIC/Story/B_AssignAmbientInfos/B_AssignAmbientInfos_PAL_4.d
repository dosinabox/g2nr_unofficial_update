
instance DIA_PAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_4_EXIT_Condition;
	information = DIA_PAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_4_JOIN_Condition;
	information = DIA_PAL_4_JOIN_Info;
	permanent = TRUE;
	description = "Как мне стать паладином?";
};


func int DIA_PAL_4_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//Как мне стать паладином?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//Если у тебя действительно серьезные намерения, то сначала ты должен поступить в услужение паладинам.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//Иди в казармы и поговори с лордом Андрэ. Попробуй вступить в ополчение.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//Возможно, там у тебя появится шанс проявить себя.
};


instance DIA_PAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_4_PEOPLE_Condition;
	information = DIA_PAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_PAL_4_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//Лорд Хаген - главнокомандующий всеми войсками на этом острове. Он занимает дом губернатора, пока мы расквартированы здесь.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//Но он очень занят. Если тебе что-то нужно, иди в казармы и поговори с лордом Андрэ.
};


instance DIA_PAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_4_LOCATION_Condition;
	information = DIA_PAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "Что вы, паладины, делаете здесь, в Хоринисе?";
};


func int DIA_PAL_4_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//Что вы, паладины, делаете здесь, в Хоринисе?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//Я не уполномочен сообщать тебе это.
};


instance DIA_PAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_4_STANDARD_Condition;
	information = DIA_PAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//Что новенького?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//Теперь, когда мы знаем, что имеем дело с драконами, наш командующий наверняка вскоре что-то предпримет.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//У на все еще нет никаких новостей от нашего отряда в Долине Рудников. Это тревожный знак.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//Слава Инносу! Драконы больше не угрожают нам. Теперь нам осталось только разобраться с орками, чтобы начать спокойно добывать руду.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//У меня нет времени на обсуждение слухов, ходящих в городе.
	};
};

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

