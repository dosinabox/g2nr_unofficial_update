
instance DIA_Sylvio_EXIT(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 999;
	condition = DIA_Sylvio_EXIT_Condition;
	information = DIA_Sylvio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sylvio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Hallo(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 1;
	condition = DIA_Sylvio_Hallo_Condition;
	information = DIA_Sylvio_Hallo_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Sylvio_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Hallo_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Sylvio_Hallo_09_01");	//Разве я давал тебе разрешение обратиться ко мне?
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Thekla(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 2;
	condition = DIA_Sylvio_Thekla_Condition;
	information = DIA_Sylvio_Thekla_Info;
	permanent = FALSE;
	description = "Текла говорит, что у нее проблемы с тобой.";
};


func int DIA_Sylvio_Thekla_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_00");	//Текла говорит, что у нее проблемы с тобой.
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_01");	//Да? И что за проблемы у этой милой леди? И почему она не пришла сама?
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_02");	//Ты прекрасно знаешь, черт побери...
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_03");	//(цинично-дружелюбно) Почему бы тебе не обсудить этот вопрос с моим другом Булко?
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Gossip(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 3;
	condition = DIA_Sylvio_Gossip_Condition;
	information = DIA_Sylvio_Gossip_Info;
	permanent = FALSE;
	description = "О тебе многие говорят...";
};


func int DIA_Sylvio_Gossip_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Gossip_15_00");	//О тебе многие говорят...
	AI_Output(self,other,"DIA_Sylvio_Gossip_09_01");	//Эти многие говорят слишком много.
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_AboutLee(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 4;
	condition = DIA_Sylvio_AboutLee_Condition;
	information = DIA_Sylvio_AboutLee_Info;
	permanent = FALSE;
	description = "Что ты думаешь о Ли?";
};


func int DIA_Sylvio_AboutLee_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info()
{
	AI_Output(other,self,"DIA_Sylvio_AboutLee_15_00");	//Что ты думаешь о Ли?
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_01");	//(слегка иронично) Ох, он хороший боец. Я бы не стал вступать в схватку с ним.
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_02");	//(холодно) Если конечно, ее можно было бы избежать.
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_MenDefeated(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 5;
	condition = DIA_Sylvio_MenDefeated_Condition;
	information = DIA_Sylvio_MenDefeated_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sylvio_MenDefeated_Condition()
{
	var int victories;
	victories = 0;
	if(Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if(Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		victories = victories + 1;
	};
	if((MIS_Jarvis_SldKO != FALSE) && (victories >= 2))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_MenDefeated_Info()
{
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_00");	//Мне кажется, ты имеешь зуб на моих парней!
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_01");	//Насколько я знаю, ты один из протеже Ли.
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_02");	//Я предупреждаю тебя! Скоро здесь многое переменится, и тогда мы вернемся к этому разговору!
	Sylvio_MenDefeated = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Asshole(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 2;
	condition = DIA_Sylvio_Asshole_Condition;
	information = DIA_Sylvio_Asshole_Info;
	permanent = FALSE;
	description = "Эй, дерьмо...";
};


func int DIA_Sylvio_Asshole_Condition()
{
	if(Sylvio_angequatscht >= 1)
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Asshole_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Asshole_15_00");	//Эй, дерьмо...
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_01");	//Ты что, действительно думаешь, что я вызову тебя на дуэль?
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_02");	//Проваливай туда, откуда ты выполз.
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SylvioSLD_PICKPOCKET(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 900;
	condition = DIA_SylvioSLD_PICKPOCKET_Condition;
	information = DIA_SylvioSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_SylvioSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(80,210);
};

func void DIA_SylvioSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
	Info_AddChoice(DIA_SylvioSLD_PICKPOCKET,Dialog_Back,DIA_SylvioSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_SylvioSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_SylvioSLD_PICKPOCKET_DoIt);
};

func void DIA_SylvioSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
};

func void DIA_SylvioSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
};

