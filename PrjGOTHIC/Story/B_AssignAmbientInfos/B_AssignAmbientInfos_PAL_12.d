
instance DIA_PAL_12_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_12_EXIT_Condition;
	information = DIA_PAL_12_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_12_JOIN_Condition;
	information = DIA_PAL_12_JOIN_Info;
	permanent = TRUE;
	description = "Я хочу стать паладином!";
};


func int DIA_PAL_12_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Я хочу стать паладином!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ты? Не смеши меня! Да ты даже не служишь в городской страже.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Если бы я не видел, что передо мной просто тупая деревенщина, я бы подумал, что ты издеваешься надо мной.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Только лучшие из лучших, самые преданные последователи короля и нашего Владыки Инноса могут быть приняты в паладины.
};


instance DIA_PAL_12_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_12_PEOPLE_Condition;
	information = DIA_PAL_12_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_PAL_12_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Достопочтенный лорд Хаген. Но лорд Андрэ отвечает за все дела, касающиеся простого народа.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Ты найдешь его в казармах. Может, тебе повезет, и он уделит тебе несколько минут своего драгоценного времени.
};


instance DIA_PAL_12_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_12_LOCATION_Condition;
	information = DIA_PAL_12_LOCATION_Info;
	permanent = TRUE;
	description = "Что вы, паладины, делаете здесь, в Хоринисе?";
};


func int DIA_PAL_12_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Что вы, паладины, делаете здесь, в Хоринисе?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Люди, задающие такие вопросы, кончают свою жизнь на виселице еще до того, как узнают это.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//ЕДИНСТВЕННОЕ, что лорд Андрэ не может себе позволить, это допустить, чтобы информация о наших задачах попала в руки шпионов.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//Так что лучше следи за своими вопросами.
};


instance DIA_PAL_12_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_12_STANDARD_Condition;
	information = DIA_PAL_12_STANDARD_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Теперь, когда мы знаем, что имеем дело с драконами, наш командующий наверняка вскоре что-то предпримет.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//У нас все еще нет никаких новостей от нашего отряда в Долине Рудников. Это тревожный знак.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Слава Инносу! Драконы больше не угрожают нам. Теперь, нам осталось только разобраться с орками, чтобы начать спокойно добывать руду.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Ты что, действительно рассчитываешь, что я отвечу на этот вопрос, юноша?!
	};
};

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

