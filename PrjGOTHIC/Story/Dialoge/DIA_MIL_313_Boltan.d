
instance DIA_Boltan_EXIT(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 999;
	condition = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent = TRUE;
	description = "Мне нужно идти.";
};


func int DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Boltan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Boltan_HALLO(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Boltan_HALLO_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Что тебе нужно?
};


instance DIA_Boltan_ToConvicts(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent = TRUE;
	description = "Я хочу увидеть заключенных.";
};


func int DIA_Boltan_ToConvicts_Condition()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Я хочу увидеть заключенных.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Да, иди попрощайся со своим приятелем.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Мы арестовали эту свинью, что убила паладина Лотара.
		};
	}
	else if((Canthar_Ausgeliefert == FALSE) && (Sarah_Ausgeliefert == FALSE) && (Rengaru_Ausgeliefert == FALSE) && (Nagur_Ausgeliefert == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//Все камеры сейчас пусты.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Хорошо, приятель.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Конечно.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Иди, но не задерживайся там слишком долго, понятно?
	};
};


instance DIA_Boltan_HalloBennet(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloBennet_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Ты ведь пришел не затем, чтобы вызволить отсюда своего приятеля, нет?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Забудь об этом! Как только я подниму тревогу, парни будут здесь в мгновение ока!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//И тогда мы сделаем из тебя котлету! (грязный смех)
};


instance DIA_Boltan_HalloCanthar(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloCanthar_Condition()
{
	if(((Kapitel != 3) || ((Kapitel == 3) && ((MIS_RescueBennet == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (Canthar_WiederRaus == TRUE) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Эй, ты тот парень, что написал жалобу на Кантара, тогровца.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//Много людей приходило, чтобы похлопотать за него. Уважаемых людей.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Должно быть, произошло какое-то недоразумение. Такое бывает.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//В будущем тебе стоит быть тщательнее выбирать, кого ты хочешь упечь в тюрьму.
};

