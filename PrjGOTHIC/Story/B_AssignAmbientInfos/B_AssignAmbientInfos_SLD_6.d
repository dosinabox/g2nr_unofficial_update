
instance DIA_SLD_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_SLD_6_EXIT_Condition;
	information = DIA_SLD_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_SLD_6_JOIN_Condition;
	information = DIA_SLD_6_JOIN_Info;
	permanent = TRUE;
	description = "Я хочу присоединиться к вам!";
};


func int DIA_SLD_6_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_SLD_6_JOIN_Info()
{
	AI_Output(other,self,"DIA_SLD_6_JOIN_15_00");	//Я хочу присоединиться к вам!
	if(MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_01");	//Я слышал об этом деле с ополчением. Торлоф говорит, что ты прошел испытание. Ты получишь мой голос.
	}
	else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_02");	//Обирать фермеров - это одно, но вступать в бой с ополчением - это совсем другое. Если Онар найдет место для тебя, я буду не против.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_03");	//Поговори с Торлофом. Он покажет тебе... (смеется)
	};
};


instance DIA_SLD_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_SLD_6_PEOPLE_Condition;
	information = DIA_SLD_6_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_SLD_6_PEOPLE_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_SLD_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_SLD_6_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_01");	//Эта ферма принадлежит Онару, если ты это имеешь в виду. Но нами командует Ли.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_02");	//Он был генералом в королевской армии. Но он больше не на дружеской ноге с королем. (смеется)
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_03");	//Запомни его имя. Если у тебя возникнут проблемы здесь, он, пожалуй, единственный, кто может решить их. Все остальные просто снимут с тебя шкуру.
};


instance DIA_SLD_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_SLD_6_LOCATION_Condition;
	information = DIA_SLD_6_LOCATION_Info;
	permanent = TRUE;
	description = "Вы охраняете фермеров?";
};


func int DIA_SLD_6_LOCATION_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_SLD_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_SLD_6_LOCATION_15_00");	//Вы охраняете фермеров?
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_01");	//Мы охраняем не только ферму Онара, но и всю эту долину.
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_02");	//Онар хочет, чтобы мы жестко пресекали любые беспорядки. Так что постарайся вести себя как положено.
};


instance DIA_SLD_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_SLD_6_STANDARD_Condition;
	information = DIA_SLD_6_STANDARD_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//В чем дело?
	if(Kapitel <= 2)
	{
		if(EnterOW_Kapitel2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_01");	//Ты теперь один из нас, парень!
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_02");	//Чего тебе нужно?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_03");	//Когда я услышал о драконах, я сначала даже не поверил.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_04");	//Дракон - вот это настоящий противник. Это не то, что какая-то там овца или полусонный ополченец.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_05");	//Как там ваш лорд Хаген, он еще не обгадил штаны от страха перед драконами?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_06");	//Похоже, теперь ему придется оторвать свою вельможную задницу от кресла и выползти из города.
		};
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_07");	//Лорд Хаген может считать себя везунчиком. Еще несколько дней - и мы бы ворвались в город и освободили Беннета сами.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_08");	//Если Беннета не выпустят из тюрьмы,  мы сами пойдем туда и освободим его.
		};
	};
	if(Kapitel == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_09");	//Что ты все ошиваешься здесь? Разве ты не отправился в долину вместе с остальными?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_10");	//Чтоб вы там все и остались.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_11");	//Ты должен идти в Долину Рудников. Я слышал, что этим беднягам там необходима помощь.
		};
	};
	if(Kapitel >= 5)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_12");	//Когда ты появился здесь, я сразу понял, что ты все здесь перевернешь вверх дном.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_13");	//Но драконы? Это что-то! Теперь вряд ли кто-то рискнет связываться с тобой.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_14");	//Я поражен. Ты не на нашей стороне, но победа над драконами - это великий подвиг.
		};
	};
};

func void B_AssignAmbientInfos_SLD_6(var C_Npc slf)
{
	dia_sld_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_standard.npc = Hlp_GetInstanceID(slf);
};

