
instance DIA_Rengaru_EXIT(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 999;
	condition = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_PICKPOCKET(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 900;
	condition = DIA_Rengaru_PICKPOCKET_Condition;
	information = DIA_Rengaru_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Rengaru_PICKPOCKET_Condition()
{
	return C_Beklauen(20,5);
};

func void DIA_Rengaru_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,Dialog_Back,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};

func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};


instance DIA_Rengaru_Hauab(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Hauab_Condition;
	information = DIA_Rengaru_Hauab_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Rengaru_Hauab_Condition()
{
	if((Jora_Dieb != LOG_Running) && (Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Hauab_Info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//Я не понимаю, какое тебе до этого дело. Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_HALLODIEB(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_HALLODIEB_Condition;
	information = DIA_Rengaru_HALLODIEB_Info;
	permanent = FALSE;
	description = "Джора говорит, что ты украл у него деньги...";
};


func int DIA_Rengaru_HALLODIEB_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Джора говорит, что ты украл у него деньги...
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Черт! Я сваливаю отсюда!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_Rengaru_GOTYOU(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 3;
	condition = DIA_Rengaru_GOTYOU_Condition;
	information = DIA_Rengaru_GOTYOU_Info;
	permanent = FALSE;
	description = "Поймал!";
};


func int DIA_Rengaru_GOTYOU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info()
{
	B_GivePlayerXP(XP_RengaruGotThief);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Поймал!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Что тебе нужно от меня?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Ты украл кошелек у Джоры средь бела дня, и он даже видел, как ты сделал это.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Поэтому я пришел сказать тебе, что ты грязный вор и что...
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"...Я заслуживаю долю от награбленного.",DIA_Rengaru_GOTYOU_Anteil);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"...тебе лучше вернуть золото Джоры. И немедленно.",DIA_Rengaru_GOTYOU_YouThief);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"...и теперь ты расскажешь мне, кто ты такой.",DIA_Rengaru_GOTYOU_WhoAreYou);
};

func void DIA_Rengaru_GOTYOU_YouThief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//...тебе лучше вернуть золото Джоры. И немедленно.
	if(Npc_HasItems(self,ItMi_Gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Вот золото, парень! Но теперь отпусти меня. Я больше никогда не буду заниматься этим.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//У меня уже нет этого золота.
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Но зачем я говорю тебе это? Ведь это ты меня обокрал!
		};
	};
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//...Я заслуживаю долю от награбленного.
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Npc_HasItems(self,ItMi_Gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Ты уже забрал все, что у меня было, после того, как вырубил меня! Пусти!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Хорошо, похоже, у меня нет выбора. Давай, разделим пополам.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"Нет, ты отдашь мне все!",DIA_Rengaru_GOTYOU_Anteil_alles);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"Хорошо, давай мне половину тогда.",DIA_Rengaru_GOTYOU_Anteil_GehtKlar);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//Нет, ты отдашь мне все!
	if(Npc_HasItems(self,ItMi_Gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Ты просто грабишь меня. Ладно, возьми это золото. А теперь оставь меня в покое.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Я бы отдал тебе золото, но у меня больше ничего нет.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//Хорошо, давай мне половину тогда.
	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Вот твоя половина! А теперь отпусти меня!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Я был бы не прочь отдать тебе половину, но у меня больше ничего нет.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_WhoAreYou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//...и теперь ты расскажешь мне, кто ты такой.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Я просто бедный человек, пытающийся свести концы с концами.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Что мне еще делать? Я не могу найти работу в городе...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//...хорошо, я понимаю. Хватит хныкать.
};


instance DIA_Rengaru_INKNAST(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 4;
	condition = DIA_Rengaru_INKNAST_Condition;
	information = DIA_Rengaru_INKNAST_Info;
	permanent = FALSE;
	description = "Я должен сдать тебя ополчению.";
};


func int DIA_Rengaru_INKNAST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//Я должен сдать тебя ополчению.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Что еще тебе нужно? У меня ничего не осталось! Отпусти меня, а?!
	Info_AddChoice(DIA_Rengaru_INKNAST,"Почему я должен отпустить тебя?",DIA_Rengaru_INKNAST_keinKnast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"Я позабочусь, чтобы тебя посадили за решетку.",DIA_Rengaru_INKNAST_Knast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"Проваливай! И чтобы больше я тебя здесь не видел!",DIA_Rengaru_INKNAST_HauAb);
};

func void DIA_Rengaru_INKNAST_HauAb()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Проваливай! И чтобы больше я тебя здесь не видел!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Ты не пожалеешь об этом! Спасибо, парень!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
};

func void DIA_Rengaru_INKNAST_Knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Я позабочусь, чтобы тебя посадили за решетку.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(устало) Я уже устал от этого всего. Если тебе кажется, что ты должен это сделать, поступай как знаешь.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(предупреждающе) Но берегись: мои друзья это дело так не оставят...
	Rengaru_InKnast = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_INKNAST_keinKnast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Почему я должен отпустить тебя?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//В городе никогда не помешают связи с нужными людьми - и хорошие отношения с ними.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Я мог бы замолвить словечко за тебя. Я не могу и не хочу говорить больше. Решать тебе.
};


instance DIA_Rengaru_LastInfoKap1(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 6;
	condition = DIA_Rengaru_LastInfoKap1_Condition;
	information = DIA_Rengaru_LastInfoKap1_Info;
	permanent = TRUE;
	description = "Как дела? У тебя все в порядке?";
};


func int DIA_Rengaru_LastInfoKap1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//Как дела? У тебя все в порядке?
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Давай, давай, дразнись. Когда-нибудь, ты поплатишься за это. Клянусь!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Что еще тебе нужно? Я больше ничего не украл, честно!
	};
};


instance DIA_Rengaru_Zeichen(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};


func int DIA_Rengaru_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Rengaru_InKnast == FALSE) && Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Эй, ты один из нас.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Я скажу тебе кое-что. Если ты намереваешься залезть в чей-нибудь карман в городе, будь особенно осторожен с торговцами!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Они очень бдительны и глаз не спускают со своих вещей. Но я могу дать тебе совет.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Попробуй взять нужный тебе предмет одной рукой, размахивая при этом другой. Это отвлечет их.
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

