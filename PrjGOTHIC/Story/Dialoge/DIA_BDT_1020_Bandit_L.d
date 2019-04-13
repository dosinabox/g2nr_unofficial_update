
instance DIA_BDT_1020_Wegelagerer_EXIT(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 999;
	condition = DIA_Wegelagerer_EXIT_Condition;
	information = DIA_Wegelagerer_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1020_Wegelagerer_Checkpoint = "NW_TROLLAREA_PATH_46";

instance DIA_BDT_1020_Wegelagerer_FirstWarn(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 1;
	condition = DIA_BDT_1020_Wegelagerer_FirstWarn_Condition;
	information = DIA_BDT_1020_Wegelagerer_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_FirstWarn_Condition()
{
	if((other.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00");	//Эй, ты, стоять!
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02");	//Если не хочешь получить по морде, тебе лучше переложить несколько монет из своего кошелька в мой - и быстро!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Сколько ты хочешь?",DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Ты шутишь.",DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Убирайся с дороги!",DIA_BDT_1020_Wegelagerer_PissOff);
	if(MIS_SCHNITZELJAGD == LOG_Running)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Скажи, ты не видел послушника?",DIA_BDT_1020_Wegelagerer_AGON);
	};
};

func void DIA_BDT_1020_Wegelagerer_AGON()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_AGON_15_00");	//Скажи, ты не видел послушника?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01");	//(удивленно) Э-э... что? Хммм... (думает) Может быть.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02");	//Дай мне 20 золотых, и я скажу тебе!
	Wegelagerer_Surprise = TRUE;
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Хорошо, вот деньги.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Извини, у меня  нет денег.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Прочь с моей дороги!",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");	//(ухмыляется) 20 золотых, и мы можем стать друзьями.
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Хорошо, вот деньги.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Извини, у меня  нет денег.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Прочь с моей дороги!",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Joke()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");	//Ты шутишь.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01");	//Я похож на шутника?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02");	//Если я не увижу 20 золотых до того, как ты сделаешь шаг вперед...
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03");	//Я прикончу тебя. Так что давай сюда денежки.
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Хорошо, вот деньги.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Извини, у меня  нет денег.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Прочь с моей дороги!",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_PissOff()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_PissOff_15_00");	//Убирайся с дороги!
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01");	//Ох, какие громкие слова от такого худосочного юноши.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02");	//Пришло время подрезать твой язык.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00");	//Хорошо, вот деньги.
	if(Wegelagerer_Surprise == FALSE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01");	//(насмешливо) Скажу тебе, 20 золотых - это не такая уж большая плата за жизнь. Ты можешь проходить.
	};
	if(Wegelagerer_Surprise == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02");	//Хорошо, этот послушник прошел здесь около часа назад.
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03");	//По-моему, он немного торопился, все время оглядывался... А теперь проваливай.
	};
	B_GiveInvItems(other,self,ItMi_Gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00");	//Извини, у меня  нет денег.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01");	//Да уж, воистину тяжелые времена настали.
	if(Npc_HasEquippedMeleeWeapon(other))
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02");	//Тогда давай поступим так - отдай мне свое оружие. И я пропущу тебя.
		Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Забудь об этом.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"Вот, возьми мое оружие.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03");	//Скажу тебе так: возвращайся, когда у тебя будут деньги. Нет денег - нет моста.
		self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
		AI_StopProcessInfos(self);
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Never()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00");	//Прочь с моей дороги!
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01");	//То есть, ты по-хорошему не хочешь?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00");	//Забудь об этом.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01");	//Ладно, по-плохому, так по-плохому.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00");	//Вот, возьми мое оружие.
	AI_DrawWeapon(other);
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");	//Отойди от этого оружия. Ну подожди!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_BDT_1020_Wegelagerer_SecondWarn(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 2;
	condition = DIA_BDT_1020_Wegelagerer_SecondWarn_Condition;
	information = DIA_BDT_1020_Wegelagerer_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00");	//Ты действительно хочешь испытать судьбу? Как знаешь.
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_SecondWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn,"Вот твои деньги.",DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn,"Я не дам тебе ни цента.",DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00");	//Вот твои деньги.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01");	//Ах, как мы заговорили.
	B_GiveInvItems(other,self,ItMi_Gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00");	//Я не дам тебе ни цента.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01");	//Тогда я сам их возьму.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_BDT_1020_Wegelagerer_Attack(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1020_Wegelagerer_Attack_Condition;
	information = DIA_BDT_1020_Wegelagerer_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

