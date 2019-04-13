
instance DIA_Rega_EXIT(C_Info)
{
	npc = BAU_933_Rega;
	nr = 999;
	condition = DIA_Rega_EXIT_Condition;
	information = DIA_Rega_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rega_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rega_HALLO(C_Info)
{
	npc = BAU_933_Rega;
	nr = 3;
	condition = DIA_Rega_HALLO_Condition;
	information = DIA_Rega_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Rega_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rega_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//Как дела?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//Ты из города, да?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//Ты один из наемников Онара, да?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//Ты маг, да?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//Ты нездешний, да?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//На твоем месте, я бы убиралась отсюда побыстрее.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Почему?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//Это место и раньше-то не было раем, но хотя бы мы жили в мире и спокойствии, пока работали на Секоба.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//Но последнее время жить здесь стало просто невыносимо.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//Бандиты повсюду, полевые хищники уничтожают наш урожай, а лендлорд совсем озверел.
	};
};


instance DIA_Rega_ONAR(C_Info)
{
	npc = BAU_933_Rega;
	nr = 4;
	condition = DIA_Rega_ONAR_Condition;
	information = DIA_Rega_ONAR_Info;
	description = "Ты боишься лендлорда?";
};


func int DIA_Rega_ONAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_ONAR_Info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//Ты боишься лендлорда?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//Конечно. Если лендлорду кто-то не понравится, он посылает своих наемников, и больше этого человека никто не видит.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//Так что мы предпочитаем помалкивать.
};


instance DIA_Rega_SLD(C_Info)
{
	npc = BAU_933_Rega;
	nr = 5;
	condition = DIA_Rega_SLD_Condition;
	information = DIA_Rega_SLD_Info;
	description = "Разве наемники не должны уничтожать полевых хищников?";
};


func int DIA_Rega_SLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_SLD_Info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//Разве наемники не должны уничтожать полевых хищников?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//Я не знаю, за что им там платят, но уж точно не за то, чтобы они помогали простым людям.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//А проблему с полевыми хищниками мелким фермерам, арендующим у него землю, приходится решать самим.
};


instance DIA_Rega_BANDITEN(C_Info)
{
	npc = BAU_933_Rega;
	nr = 6;
	condition = DIA_Rega_BANDITEN_Condition;
	information = DIA_Rega_BANDITEN_Info;
	description = "Как вы защищаетесь от бандитов?";
};


func int DIA_Rega_BANDITEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_BANDITEN_Info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//Как вы защищаетесь от бандитов?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//Мы не защищаемся. Мы бежим. А что еще нам остается?
};


instance DIA_Rega_BRONKO(C_Info)
{
	npc = BAU_933_Rega;
	nr = 7;
	condition = DIA_Rega_BRONKO_Condition;
	information = DIA_Rega_BRONKO_Info;
	description = "(спросить о Бронко)";
};


func int DIA_Rega_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (MIS_Sekob_Bronko_eingeschuechtert == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Rega_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//А кто этот противный тип вон там?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//Не пойми меня неправильно, но мне не нужны проблемы. Спроси кого-нибудь еще.
	AI_StopProcessInfos(self);
};


instance DIA_Rega_PERMKAP1(C_Info)
{
	npc = BAU_933_Rega;
	nr = 7;
	condition = DIA_Rega_PERMKAP1_Condition;
	information = DIA_Rega_PERMKAP1_Info;
	permanent = TRUE;
	description = "Выше нос.";
};


func int DIA_Rega_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//Выше нос.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//Тебе легко говорить. Ты ведь живешь в городе.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//Если бы вы, наемники, не доставляли нам столько проблем, жизнь здесь была бы не такой уж плохой.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//Магов вокруг становится все меньше и меньше. Надеюсь, ты не последний из них. Вы нужны нам - и сейчас как никогда.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//Это не так-то легко, работая на этого душегуба Секоба.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rega_PICKPOCKET(C_Info)
{
	npc = BAU_933_Rega;
	nr = 900;
	condition = DIA_Rega_PICKPOCKET_Condition;
	information = DIA_Rega_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Rega_PICKPOCKET_Condition()
{
	return C_Beklauen(25,40);
};

func void DIA_Rega_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
	Info_AddChoice(DIA_Rega_PICKPOCKET,Dialog_Back,DIA_Rega_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rega_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rega_PICKPOCKET_DoIt);
};

func void DIA_Rega_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
};

func void DIA_Rega_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
};

