
instance DIA_PAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_9_EXIT_Condition;
	information = DIA_PAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_9_JOIN_Condition;
	information = DIA_PAL_9_JOIN_Info;
	permanent = TRUE;
	description = "Как мне стать паладином?";
};


func int DIA_PAL_9_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//Как мне стать паладином?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//Паладином может стать только тот, кто доказал свою приверженность служению Инносу или королю!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//Скажем проще: паладинами могут стать только лучшие из лучших. Но тебе до этого еще далеко, мой мальчик!
};


instance DIA_PAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_9_PEOPLE_Condition;
	information = DIA_PAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_PAL_9_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//Лорд Хаген.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//И?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//И больше никто. Лорд Хаген - верховный командующий всего этого острова.
};


instance DIA_PAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_9_LOCATION_Condition;
	information = DIA_PAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "Зачем паладины прибыли в Хоринис?";
};


func int DIA_PAL_9_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//Зачем паладины прибыли в Хоринис?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//Это не твое дело, приятель! Тебе достаточно знать, что мы служим Инносу и королю!
};


instance DIA_PAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_9_STANDARD_Condition;
	information = DIA_PAL_9_STANDARD_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//Теперь, когда мы знаем, что имеем дело с драконами, наш командующий наверняка скоро что-то предпримет.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//Все еще нет никаких известий от нашего отряда в Долине Рудников. Это очень странно.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//Слава Инносу! Угроза драконов ликвидирована. Теперь, чтобы спокойно добывать руду, нам нужно только разобраться с орками.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//Если тебе больше нечего сказать, иди отсюда, болван!
	};
};

func void B_AssignAmbientInfos_PAL_9(var C_Npc slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};

