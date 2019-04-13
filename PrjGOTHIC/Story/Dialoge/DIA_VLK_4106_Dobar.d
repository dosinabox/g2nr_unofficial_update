
instance DIA_Dobar_EXIT(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 999;
	condition = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dobar_HALLO(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 2;
	condition = DIA_Dobar_HALLO_Condition;
	information = DIA_Dobar_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dobar_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dobar_HALLO_Info()
{
	AI_Output(self,other,"DIA_Dobar_HALLO_08_00");	//(раздражительно) Что тебе нужно?
};


instance DIA_Dobar_Talent(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Talent_Condition;
	information = DIA_Dobar_Talent_Info;
	permanent = FALSE;
	description = "Я немного знаю кузнечное дело.";
};


func int DIA_Dobar_Talent_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dobar_Talent_Info()
{
	AI_Output(other,self,"DIA_Dobar_Talent_15_00");	//Я немного знаю кузнечное дело.
	AI_Output(self,other,"DIA_Dobar_Talent_08_01");	//Хорошо... и что?
};


instance DIA_Dobar_Schmiede(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Schmiede_Condition;
	information = DIA_Dobar_Schmiede_Info;
	permanent = FALSE;
	description = "Могу я воспользоваться твоей кузницей?";
};


func int DIA_Dobar_Schmiede_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Schmiede_Info()
{
	AI_Output(other,self,"DIA_Dobar_Schmiede_15_00");	//Могу я воспользоваться твоей кузницей?
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_01");	//У меня много работы. Мы будем только мешать друг другу. Лучше дождись темноты.
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_02");	//Тогда Парлаф и я пойдем спать, и ты сможешь спокойно поработать.
};


instance DIA_Dobar_beibringen(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 2;
	condition = DIA_Dobar_beibringen_Condition;
	information = DIA_Dobar_beibringen_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Dobar_beibringen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_beibringen_Info()
{
	AI_Output(other,self,"DIA_Dobar_beibringen_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Dobar_beibringen_08_01");	//Ты уже знаешь основы. Я могу показать тебе, как улучшить твою работу.
	AI_Output(self,other,"DIA_Dobar_beibringen_08_02");	//И ты сможешь ковать более совершенное оружие.
	Dobar_Learnsmith = TRUE;
	Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC,"Добар может обучить меня ковать хорошее оружие.");
};


instance DIA_Dobar_Teach(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 3;
	condition = DIA_Dobar_Teach_Condition;
	information = DIA_Dobar_Teach_Info;
	description = B_BuildLearnString("Покажи мне, как выковать хороший меч!",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01));
	permanent = TRUE;
};


func int DIA_Dobar_Teach_Condition()
{
	if((Dobar_Learnsmith == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Teach_Info()
{
	AI_Output(other,self,"DIA_Dobar_Teach_15_00");	//Покажи мне, как выковать хороший меч!
	if(B_TeachPlayerTalentSmith(self,hero,WEAPON_1H_Special_01))
	{
		AI_Output(self,other,"DIA_Dobar_Teach_08_01");	//Разогрей сталь, чтобы она равномерно светилась по всей длине, без этого хороший меч не выковать.
		AI_Output(self,other,"DIA_Dobar_Teach_08_02");	//Если ты будешь помнить это, сделанные тобой клинки будут прочнее и острее.
		AI_Output(self,other,"DIA_Dobar_Teach_08_03");	//Это все, что тебе нужно знать. Если тебе нужна сырая сталь, поговори с Энгором.
	};
};


instance DIA_Dobar_Waffe(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 80;
	condition = DIA_Dobar_Waffe_Condition;
	information = DIA_Dobar_Waffe_Info;
	permanent = FALSE;
	description = "Ты можешь сделать оружие для меня?";
};


func int DIA_Dobar_Waffe_Condition()
{
	return TRUE;
};

func void DIA_Dobar_Waffe_Info()
{
	AI_Output(other,self,"DIA_Dobar_Waffe_15_00");	//Ты можешь сделать оружие для меня?
	AI_Output(self,other,"DIA_Dobar_Waffe_08_01");	//У меня нет времени на это. Тандор распоряжается всем оружием - я только кую его, а Парлаф затачивает.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Тандор продает оружие в замке.");
};


instance DIA_Dobar_NEWS(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 900;
	condition = DIA_Dobar_NEWS_Condition;
	information = DIA_Dobar_NEWS_Info;
	permanent = TRUE;
	description = "Как работа?";
};


func int DIA_Dobar_NEWS_Condition()
{
	return TRUE;
};

func void DIA_Dobar_NEWS_Info()
{
	AI_Output(other,self,"DIA_Dobar_NEWS_15_00");	//Как работа?
	if(Dobar_einmalig == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_01");	//Я кую оружие для рыцарей замка. С тех пор, как мы прибыли сюда, я не отхожу от кузницы.
		AI_Output(self,other,"DIA_Dobar_NEWS_08_02");	//Это оружие нам очень пригодится. Мы еще покажем этим проклятым оркам!
		if(Npc_IsDead(Parlaf) == FALSE)
		{
			B_TurnToNpc(self,Parlaf);
			AI_Output(self,other,"DIA_Dobar_NEWS_08_03");	//(зовет) Эй, Парлаф - затачивай эти мечи получше - орки чертовски сильные противники!
			B_TurnToNpc(self,other);
		};
		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_04");	//Могло бы быть и лучше. Если бы ты постоянно не отвлекал меня, работа продвигалась бы быстрее.
	};
};


instance DIA_Dobar_PICKPOCKET(C_Info)
{
	npc = VLK_4106_Dobar;
	nr = 900;
	condition = DIA_Dobar_PICKPOCKET_Condition;
	information = DIA_Dobar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть его кусок руды будет сложно)";
};


func int DIA_Dobar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItMi_Nugget) >= 1) && (other.attribute[ATR_DEXTERITY] >= (79 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Dobar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dobar_PICKPOCKET);
	Info_AddChoice(DIA_Dobar_PICKPOCKET,Dialog_Back,DIA_Dobar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dobar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dobar_PICKPOCKET_DoIt);
};

func void DIA_Dobar_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 79)
	{
		B_GiveInvItems(self,other,ItMi_Nugget,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Dobar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dobar_PICKPOCKET);
};

