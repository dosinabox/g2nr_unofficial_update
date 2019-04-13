
instance DIA_Gunnar_EXIT(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 999;
	condition = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Gunnar_HalloGesagt;

instance DIA_Gunnar_Hallo(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 1;
	condition = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//Как дела?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//С тех пор, как Онар объявил, что набирает наемников, здесь все кишит бандитами.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Весь сброд, у которого раньше не хватало мужества выйти из леса, теперь собрался здесь.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Эти ублюдки приходят отовсюду...
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//Так ты теперь тоже наемник, хм?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Да пребудет с тобой Иннос!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Людей из города здесь не жалуют.
	};
	Gunnar_HalloGesagt = TRUE;
};


instance DIA_Gunnar_Everywhere(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 2;
	condition = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent = TRUE;
	description = "Наемники приходят отовсюду?";
};


func int DIA_Gunnar_Everywhere_Condition()
{
	if(Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Everywhere_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Наемники приходят отовсюду?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Большинство из них пришло из колонии.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Еще одна группа наемников пришла с юга, там они, вероятно, охотились на орков.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//И я готов поклясться, что несколько бандитов с гор тоже пришли сюда, чтобы получить бесплатную еду!
};


instance DIA_Gunnar_South(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 3;
	condition = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent = TRUE;
	description = "Что ты знаешь о наемниках с юга?";
};


func int DIA_Gunnar_South_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_South_Info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Что ты знаешь о наемниках с юга?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Немногое. Насколько мне известно, они охотились там на орков.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Их босс - Сильвио. Булко, Сентенза, Рауль и еще несколько парней работают на него...
};


instance DIA_Gunnar_Colony(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 4;
	condition = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent = TRUE;
	description = "А кто пришел из колонии?";
};


func int DIA_Gunnar_Colony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Colony_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//А кто пришел из колонии?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Ли и его люди. Торлоф, Корд, Джарвис, Вольф и кое-кто еще.
};


instance DIA_Gunnar_Bandits(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 5;
	condition = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent = TRUE;
	description = "А что это за бандиты, о которых ты говоришь?";
};


func int DIA_Gunnar_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Bandits_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//А что это за бандиты, о которых ты говоришь?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//А, это я просто так. Если честно, я не совсем уверен в этом.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//К югу от этой долины находятся горы с заброшенными шахтами. Там прячутся какие-то бандиты.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Они тоже каторжники из колонии, как и большинство наемников здесь.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Единственная разница - что там совсем отъявленные головорезы. Они убивают всех, кто подходит слишком близко.
};


instance DIA_Gunnar_PICKPOCKET(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 900;
	condition = DIA_Gunnar_PICKPOCKET_Condition;
	information = DIA_Gunnar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Gunnar_PICKPOCKET_Condition()
{
	return C_Beklauen(45,70);
};

func void DIA_Gunnar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET,Dialog_Back,DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

