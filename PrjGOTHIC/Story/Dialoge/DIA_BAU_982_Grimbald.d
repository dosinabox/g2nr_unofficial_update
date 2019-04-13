
instance DIA_Grimbald_EXIT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 999;
	condition = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_HALLO(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_HALLO_Condition;
	information = DIA_Grimbald_HALLO_Info;
	description = "Ты чего-то ждешь?";
};


func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};


var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Ты чего-то ждешь?
	if(Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Я охочусь. По-моему, это очевидно.
		Grimbald_PissOff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Больше нет. Ты ведь уже пришел.
		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO,"Меня ждут дела.",DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO,"Что ты задумал?",DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO,"Почему я?",DIA_Grimbald_HALLO_ich);
	};
};

func void DIA_Grimbald_HALLO_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Почему я?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Похоже, ты сильный человек. Я бы не отказался от твоей помощи.
};

func void DIA_Grimbald_HALLO_Was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Что ты задумал?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Я хочу поохотиться на снепперов вон там, но боюсь, мне не справиться с ними в одиночку.
	Info_AddChoice(DIA_Grimbald_HALLO,"Можешь не рассчитывать на меня.",DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO,"Хорошо, я помогу тебе. Но ты пойдешь впереди.",DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HALLO_Was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Можешь не рассчитывать на меня.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Тогда проваливай, трус.
	Grimbald_PissOff = TRUE;
	Info_ClearChoices(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Хорошо, я помогу тебе. Но ты пойдешь впереди.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Конечно. Только не приближайся слишком близко к черному троллю. Он разорвет тебя на куски, понял?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//И я не прощу тебе, если ты решишь выйти из игры.
	B_StartOtherRoutine(self,"Jagd");
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HALLO_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//Меня ждут дела.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Не мели чепуху. Что такого важного может ждать тебя в этой глуши?
};


instance DIA_Grimbald_Jagd(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Jagd_Condition;
	information = DIA_Grimbald_Jagd_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Grimbald_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimbald_HALLO) && (Grimbald_TeachAnimalTrophy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Jagd_Info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Ты можешь научить меня охотиться?
	if((Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3)) || (Grimbald_PissOff == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Ммм. Хорошо. Ты не особенно-то помог мне, но не стоит быть слишком строгим.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Конечно. Но не бесплатно.
		B_Say_Gold(self,other,200);
		Info_ClearChoices(DIA_Grimbald_Jagd);
		Info_AddChoice(DIA_Grimbald_Jagd,"Я подумаю над этим.",DIA_Grimbald_Jagd_zuviel);
		Info_AddChoice(DIA_Grimbald_Jagd,"Хорошо.",DIA_Grimbald_Jagd_ja);
	};
};

func void DIA_Grimbald_Jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Хорошо, вот деньги.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Отлично. Скажешь, когда захочешь научиться чему-нибудь.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Принеси мне деньги, и я готов обучать тебя.
	};
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Как хочешь.
	Info_ClearChoices(DIA_Grimbald_Jagd);
};


instance DIA_Grimbald_TEACHHUNTING(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 12;
	condition = DIA_Grimbald_TEACHHUNTING_Condition;
	information = DIA_Grimbald_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};


func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if(Grimbald_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Grimbald_TEACHHUNTING_OneTime;

func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Научи меня охотиться.
	if(DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		B_StartOtherRoutine(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Что именно ты хочешь узнать?
		Info_AddChoice(DIA_Grimbald_TEACHHUNTING,Dialog_Back,DIA_Grimbald_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Жало кровавой мухи",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Grimbald_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Крылья кровавой мухи",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Grimbald_TEACHHUNTING_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Удаление когтей",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Grimbald_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grimbald_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString("Удаление панцирей краулеров",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Ты уже знаешь все, чему я мог научить тебя.
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Вырезать жало кровавой мухи довольно просто. Тебе нужно найти его основание и с силой воткнуть туда нож.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Крылья кровавой мухи можно вырвать или вырезать при помощи острого ножа.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Есть несколько способов вырезать когти. Для одних животных необходим сильный точный удар ножом, а у других их нужно вырезать очень аккуратно.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//У краулеров и полевых хищников сильные мандибулы, которые можно отделить от головы сильным точным ударом.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Панцири с краулеров снять нелегко, но это все же можно сделать при помощи острого прочного предмета.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};


instance DIA_Grimbald_NovChase(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_NovChase_Condition;
	information = DIA_Grimbald_NovChase_Info;
	description = "Ты не видел здесь послушника?";
};


func int DIA_Grimbald_NovChase_Condition()
{
	if(MIS_NovizenChase == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Ты не видел здесь послушника?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Сегодня здесь прошло много разных странных личностей, включая тех двух клоунов у каменной арки.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//А недавно с ними о чем-то разговаривал послушник магов Огня.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_Trolltot(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Trolltot_Condition;
	information = DIA_Grimbald_Trolltot_Info;
	important = TRUE;
};


func int DIA_Grimbald_Trolltot_Condition()
{
	if(Npc_IsDead(Troll_Black))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//Черный тролль мертв. Отличная работа. Я не верил, что его вообще можно убить. Никогда этого не забуду.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_PICKPOCKET(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 900;
	condition = DIA_Grimbald_PICKPOCKET_Condition;
	information = DIA_Grimbald_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Grimbald_PICKPOCKET_Condition()
{
	return C_Beklauen(85,250);
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,Dialog_Back,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

