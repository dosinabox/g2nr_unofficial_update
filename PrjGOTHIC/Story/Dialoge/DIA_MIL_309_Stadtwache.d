
instance DIA_Mil_309_Stadtwache_EXIT(C_Info)
{
	npc = Mil_309_Stadtwache;
	nr = 999;
	condition = DIA_Mil_309_Stadtwache_EXIT_Condition;
	information = DIA_Mil_309_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_309_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mil_309_Stadtwache_Hallo(C_Info)
{
	npc = Mil_309_Stadtwache;
	nr = 2;
	condition = DIA_Mil_309_Stadtwache_Hallo_Condition;
	information = DIA_Mil_309_Stadtwache_Hallo_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Mil_309_Stadtwache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_Hallo_Info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//В чем дело?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Все в порядке. Но мы должны быть настороже.
	}
	else if((Stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIl_309_News < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Послушай. Мы не можем пропустить тебя в город.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//Но я дам тебе совет, и совершенно бесплатно.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Держись подальше от этого леса впереди - там бродят полчища ужасных монстров.
		MIl_309_News = 1;
	}
	else if((Stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIl_309_News == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Возвращайся туда, откуда выполз, подонок!
	};
	if((Stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIl_309_News < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Послушай, ты имеешь право находиться в городе. Но это не означает, что ты можешь делать здесь все, что тебе заблагорассудится.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//Если ты не придерживаешься общепринятых правил, ты потеряешь свои права здесь!
		MIl_309_News = 2;
	}
	else if((Stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIl_309_News == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//Давай - проходи!
	};
	AI_StopProcessInfos(self);
};

