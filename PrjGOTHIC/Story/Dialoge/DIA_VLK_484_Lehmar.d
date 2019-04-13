
instance DIA_Lehmar_EXIT(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 999;
	condition = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_ENTSCHULDIGUNG(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 2;
	condition = DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information = DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Lehmar_ENTSCHULDIGUNG_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//(скучая) Сколько ты хочешь?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Что значит 'сколько'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Я ростовщик и ты пришел ко мне. Что тебе еще может быть нужно от меня? Деньги, конечно.
};


instance DIA_Lehmar_GELDLEIHEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_GELDLEIHEN_Condition;
	information = DIA_Lehmar_GELDLEIHEN_Info;
	permanent = TRUE;
	description = "Одолжи мне денег!";
};


var int DIA_Lehmar_GELDLEIHEN_noPerm;

func int DIA_Lehmar_GELDLEIHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) && (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Одолжи мне денег!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Конечно! Сколько ты хочешь? Я беру 20 процентов!
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"Я подумаю над этим.",DIA_Lehmar_GELDLEIHEN_back);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"1000 золотых.",DIA_Lehmar_GELDLEIHEN_1000);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN," 200 золотых.",DIA_Lehmar_GELDLEIHEN_200);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"  50 золотых.",DIA_Lehmar_GELDLEIHEN_50);
};

func void DIA_Lehmar_GELDLEIHEN_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Думай же быстрее! Не трать мое время попусту!
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_GELDLEIHEN_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Мелочь, да? Я хочу, чтобы ты вернул их завтра, понятно?
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 50;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//Это большая сумма денег. Я хочу видеть тебя завтра, и деньги тоже, понятно?
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 200;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//У тебя с головой все в порядке?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//Я дам тебе 100. И не забудь вернуть их завтра!
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 100;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};


instance DIA_Lehmar_WARUMGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_WARUMGELD_Condition;
	information = DIA_Lehmar_WARUMGELD_Info;
	permanent = FALSE;
	description = "Ты всегда так легко раздаешь деньги?";
};


func int DIA_Lehmar_WARUMGELD_Condition()
{
	if(Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Ты всегда так легко раздаешь деньги?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//Не волнуйся. Ты вернешься. Или я найду тебя и убью. Все просто.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//У тебя такая запоминающаяся внешность, что мне не составит труда найти тебя.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Так что даже не думай обмануть меня.
};


var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_GELDEINTREIBEN_Condition;
	information = DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_GELDEINTREIBEN_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//Ты не вернул долг, ублюдок! Верни мне мои деньги! А так как мне пришлось напоминать тебе об этом, процент возрастает.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Теперь это обойдется тебе в 30 процентов вместо обычных 20.
	Info_ClearChoices(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"Я верну свой долг.",DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"Я ничего тебе не дам.",DIA_Lehmar_GELDEINTREIBEN_kannstmich);
};

func void DIA_Lehmar_GELDEINTREIBEN_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Я ничего тебе не дам.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//Ох, нет, дашь!
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Я верну свой долг.
	if(Lehmar_GeldGeliehen == 50)
	{
		Lehmar_GeldGeliehen_MitZinsen = 65;
	};
	if(Lehmar_GeldGeliehen == 200)
	{
		Lehmar_GeldGeliehen_MitZinsen = 260;
	};
	if(Lehmar_GeldGeliehen == 100)
	{
		Lehmar_GeldGeliehen_MitZinsen = 130;
	};
	IntToFloat(Lehmar_GeldGeliehen_MitZinsen);
	if(Npc_HasItems(other,ItMi_Gold) >= Lehmar_GeldGeliehen_MitZinsen)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//Тебе повезло! А теперь проваливай!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//У тебя с собой нет столько денег! Ладно. Похоже, мне придется преподать тебе урок.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Ничего личного - мне просто нужно поддерживать свою репутацию.
		Lehmar_vorbei = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Lehmar_GELDZURUECK(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 6;
	condition = DIA_Lehmar_GELDZURUECK_Condition;
	information = DIA_Lehmar_GELDZURUECK_Info;
	permanent = TRUE;
	description = "Вот твои деньги!";
};


func int DIA_Lehmar_GELDZURUECK_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) && (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Вот твои деньги!
	if((RangerHelp_LehmarKohle == TRUE) && (Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Оставь их. Ларес уже обо всем позаботился.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//Похоже, вы с этим мошенником приятели, а? Ладно, это не мое дело. Удачи.
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Lehmar_GeldGeliehen == 50)
		{
			Lehmar_GeldGeliehen_MitZinsen = 60;
		};
		if(Lehmar_GeldGeliehen == 200)
		{
			Lehmar_GeldGeliehen_MitZinsen = 240;
		};
		if(Lehmar_GeldGeliehen == 100)
		{
			Lehmar_GeldGeliehen_MitZinsen = 120;
		};
		IntToFloat(Lehmar_GeldGeliehen_MitZinsen);
		if(Npc_HasItems(other,ItMi_Gold) >= Lehmar_GeldGeliehen_MitZinsen)
		{
			B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen);
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Превосходно! Приятно иметь с тобой дело.
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Здесь недостаточно! Возвращайся, когда у тебя будет вся сумма. У тебя еще есть время. Помни, 20 процентов!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Lehmar_NOCHMALGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 8;
	condition = DIA_Lehmar_NOCHMALGELD_Condition;
	information = DIA_Lehmar_NOCHMALGELD_Info;
	permanent = TRUE;
	description = "Могу я занять у тебя денег?";
};


func int DIA_Lehmar_NOCHMALGELD_Condition()
{
	if((Lehmar_GeldGeliehen == 0) && (Lehmar_GeldGeliehen_MitZinsen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_NOCHMALGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Могу я занять у тебя денег?
	if(Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//Ты думаешь, я идиот? Проваливай!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Больше не можешь! Я понес большие издержки и теперь у меня на счету каждый цент.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Заходи через несколько дней!
	};
};


instance DIA_Lehmar_PICKPOCKET(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 900;
	condition = DIA_Lehmar_PICKPOCKET_Condition;
	information = DIA_Lehmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть его книгу будет легче легкого)";
};


func int DIA_Lehmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItWr_Schuldenbuch) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,Dialog_Back,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self,other,ItWr_Schuldenbuch,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};


instance DIA_Lehmar_BuchWeg(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_BuchWeg_Condition;
	information = DIA_Lehmar_BuchWeg_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_BuchWeg_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_BuchWeg_Info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//(с сожалением) Какой-то гнусный вор украл мой гроссбух...
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Ты случайно не имеешь к этому отношения, нет?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//(усмехается) Я? Нет.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Да-да, хорошо. Уходи отсюда...
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_verhauen(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_verhauen_Condition;
	information = DIA_Lehmar_verhauen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lehmar_verhauen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg) || (Lehmar_vorbei == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lehmar_verhauen_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

