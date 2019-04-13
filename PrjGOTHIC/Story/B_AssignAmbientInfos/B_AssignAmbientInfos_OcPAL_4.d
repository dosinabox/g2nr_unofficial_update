
instance DIA_OCPAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_4_EXIT_Condition;
	information = DIA_OCPAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_4_PEOPLE_Condition;
	information = DIA_OCPAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//Командующий Гаронд. Ты найдешь его в самом большом здании замка.
};


instance DIA_OCPAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_4_LOCATION_Condition;
	information = DIA_OCPAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне о Долине Рудников?";
};


func int DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//Что ты можешь рассказать мне о Долине Рудников?
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//Насколько я знаю, здесь есть несколько шахт, если они еще не захвачены орками.
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//Старатели, работающие в шахтах, - это в основном каторжники, но среди них также есть несколько паладинов.
};


instance DIA_OCPAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_4_STANDARD_Condition;
	information = DIA_OCPAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Как дела?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//Орки окружили нас! Но мы будем обороняться до последнего человека! И Иннос поможет нам против драконов!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//Я думаю, атака орков не заставит себя долго ждать. И где же это чертово подкрепление?
			if(other.guild == GIL_DJG)
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//Надеюсь, что ты не думаешь всерьез, что у вас, охотники на драконов, действительно есть шанс против ВСЕХ драконов?
			}
			else
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//Эти так называемые охотники на драконов мало на что способны!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//Слава Инносу! Эти проклятые твари были уничтожены!
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//Гибель драконов, похоже, не произвела особого впечатления на орков. И почему, во имя Инноса, они не уходят? Это какая-то дьявольщина!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//Эти чертовы ворота заклинило. Орки рвутся в замок, и ничто не остановит их.
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//Кто-то должен сообщить лорду Хагену. Он нужен ЗДЕСЬ и сейчас.
		};
	};
};

func void B_AssignAmbientInfos_OCPAL_4(var C_Npc slf)
{
	dia_ocpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

