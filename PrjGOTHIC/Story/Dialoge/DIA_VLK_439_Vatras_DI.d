
instance DIA_Vatras_DI_EXIT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 999;
	condition = DIA_Vatras_DI_EXIT_Condition;
	information = DIA_Vatras_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_DI_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Vatras_DI_HEAL(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_HEAL_Condition;
	information = DIA_Vatras_DI_HEAL_Info;
	permanent = TRUE;
	description = "Вылечи меня.";
};


func int DIA_Vatras_DI_HEAL_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Вылечи меня.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//(благоговейно) Аданос, благослови это тело. Ему предназначено восстановить баланс мира.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Твое тело сейчас не нуждается в лечении.
	};
};


instance DIA_Vatras_DI_TRADE(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 12;
	condition = DIA_Vatras_DI_TRADE_Condition;
	information = DIA_Vatras_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ты можешь продать мне что-нибудь?";
};


func int DIA_Vatras_DI_TRADE_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Ты можешь продать мне что-нибудь?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//В чем ты нуждаешься?
	Trade_IsActive = TRUE;
};


instance DIA_Vatras_DI_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 35;
	condition = DIA_Vatras_DI_OBSESSION_Condition;
	information = DIA_Vatras_DI_OBSESSION_Info;
	permanent = TRUE;
	description = "Помоги мне. Я одержим!";
};


func int DIA_Vatras_DI_OBSESSION_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && (SC_IsObsessed == TRUE))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_OBSESSION_Info_OneTime;

func void DIA_Vatras_DI_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//Помоги мне. Я одержим!
	if(Got_HealObsession_Day <= (Wld_GetDay() - 2))
	{
		if(DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1)
		{
			CreateInvItems(self,ItPo_HealObsession_MIS,1);
			DIA_Vatras_DI_OBSESSION_Info_OneTime += 1;
		};
		if(Npc_HasItems(self,ItPo_HealObsession_MIS))
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//Возьми это Зелье Освобождения. Пирокар дал мне несколько этих лечебных эликсиров по моей просьбе.
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Однако помни: мои возможности по избавлению тебя от ночных кошмаров ограничены.
			B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
			Got_HealObsession_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//Запасы Пирокара истощены. Мне очень жаль, друг мой. Я больше ничем не могу помочь тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//Я не возьму на себя риск дать тебе еще одну бутылку в столь короткое время. Возвращайся позже, друг мой.
	};
};


instance DIA_Vatras_DI_RAT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_RAT_Condition;
	information = DIA_Vatras_DI_RAT_Info;
	description = "Какой совет ты можешь дать мне?";
};


func int DIA_Vatras_DI_RAT_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && (SC_IsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_RAT_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//Какой совет ты можешь дать мне?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//Держись подальше от Ищущих. Помни, что их черный взгляд может нанести тебе серьезный урон здесь, вдали от монастыря.
	if(Npc_HasItems(other,ItAm_Prot_BlackEye_Mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//Не волнуйся, у меня есть амулет вызова душ.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//Если все же что-то произойдет с тобой, приходи ко мне. Я посмотрю, что можно сделать.
};


instance DIA_Vatras_DI_PEDROTOT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 3;
	condition = DIA_Vatras_DI_PEDROTOT_Condition;
	information = DIA_Vatras_DI_PEDROTOT_Info;
	description = "Я нашел предателя Педро.";
};


func int DIA_Vatras_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;

func void DIA_Vatras_DI_PEDROTOT_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//Я нашел предателя Педро.
	B_GivePlayerXP(XP_Ambient);
	self.flags = 0;
	if((MIS_Gorax_KillPedro == LOG_SUCCESS) && Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//Он мертв.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//Я крайне разочарован. Я не ожидал этого от тебя.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//Что ты имеешь в виду?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//Я знаю о твоем отвратительном соглашении с Серпентесом. Я глубоко потрясен тем, что так ошибался в тебе.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//Тогда приведи его сюда, на корабль. Мы передадим его властям Хориниса.
		if(Npc_IsDead(Pedro_DI))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//Для этого немного поздно. Он мертв.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//(удивленно) Ох. Какая жалость. Я буду молиться за его бедную душу.
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Vatras_DI_VatrasSucked(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 1;
	condition = DIA_Vatras_DI_VatrasSucked_Condition;
	information = DIA_Vatras_DI_VatrasSucked_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Vatras_DI_VatrasSucked_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_VatrasSucked_Info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Убирайся с глаз моих, убийца. Ты больше можешь не рассчитывать на мою помощь.
	AI_StopProcessInfos(self);
};


instance DIA_Vatras_DI_Talente(C_Info)
{
	npc = VLK_439_Vatras_DI;
	condition = DIA_Vatras_DI_Talente_Condition;
	information = DIA_Vatras_DI_Talente_Info;
	permanent = TRUE;
	description = "Научи меня магии.";
};


func int DIA_Vatras_DI_Talente_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_Talente_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Научи меня магии.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Я сделаю все, что в моих силах.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,"Круги магии",DIA_Vatras_DI_Talente_CIRCLES);
	};
	Info_AddChoice(DIA_Vatras_DI_Talente,"Алхимия - искусство приготовления зелий",DIA_Vatras_DI_Talente_ALCHIMIE);
};

func void DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_1,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1)),DIA_Vatras_DI_Talente_Circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_2,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2)),DIA_Vatras_DI_Talente_Circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_3,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3)),DIA_Vatras_DI_Talente_Circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_4,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),DIA_Vatras_DI_Talente_Circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_5,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),DIA_Vatras_DI_Talente_Circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_6,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),DIA_Vatras_DI_Talente_Circle_6);
	};
};

func void DIA_Vatras_DI_Talente_ALCHIMIE()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Vatras_DI_Talente_POTION_Health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HP_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Vatras_DI_Talente_POTION_Health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Speed_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Vatras_DI_Talente_POTION_Speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_STR_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_DEX_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};

func void DIA_Vatras_DI_Talente_Circle_1()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,1);
};

func void DIA_Vatras_DI_Talente_Circle_2()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,2);
};

func void DIA_Vatras_DI_Talente_Circle_3()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,3);
};

func void DIA_Vatras_DI_Talente_Circle_4()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,4);
};

func void DIA_Vatras_DI_Talente_Circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Теперь ты маг пятого Круга. Используй заклинания, изученные тобой, во благо.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,5);
};

func void DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Ты достиг самых высоких вершин в магии.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Пусть руку твою направляет разум, а твои человеческие слабости будут под глубоким контролем. Они не смогут затмить твой взор.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,6);
};

func void DIA_Vatras_DI_Talente_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Vatras_DI_Talente_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Vatras_DI_Talente_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Vatras_DI_Talente_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Vatras_DI_Talente_BACK()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
};


instance DIA_Vatras_DI_DementorObsessionBook(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_DementorObsessionBook_Condition;
	information = DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent = TRUE;
	description = "Я принес альманах Одержимых.";
};


func int DIA_Vatras_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_DementorObsessionBook_OneTime;

func void DIA_Vatras_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//Я принес альманах Одержимых.
	if(DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//Хм. Я думаю, будет лучше всего, если я отнесу его в монастырь к Пирокару. Если, конечно, нам удастся выбраться отсюда.
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//У тебя есть еще? Принеси мне все, что найдешь.
	};
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,1);
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Vatras_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_UndeadDragonDead_Condition;
	information = DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Я сделал это.";
};


func int DIA_Vatras_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_UndeadDragonDead_OneTime;

func void DIA_Vatras_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//Я сделал это.
	if(DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//Я знаю, я чувствую это.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//Ты нанес удар Белиару, от которого он не скоро оправится.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//Могу я теперь успокоиться, или у вас, у магов, есть еще один скелет в шкафу, которого нужно изгнать из этого мира?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//Помни, что это был всего лишь эпизод в вечной битве Добра со Злом.
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//Зло всегда находит способ проникнуть в этот мир. Эта война никогда не кончится.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//Как воин Добра ты должен понимать это.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//Только один Аданос стоит между воюющими богами и хранит хрупкий баланс!
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//Лучше бы он помог мне.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//(озорно) Он так и сделал - будь уверен.
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//Скажи капитану, чтобы он поднимал якорь как можно быстрее. Кратковременный мир может быть обманом.
};


instance DIA_Addon_Vatras_PISSOFFFOREVVER_DI(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 1;
	condition = DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition;
	information = DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition()
{
	if(((VatrasPissedOffForever == TRUE) || ((MadKillerCount >= 7) && (VatrasMadKillerCount != MadKillerCount))) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};


var int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime;

func void DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info()
{
	if(DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime == FALSE)
	{
		B_LastWarningVatras();
		DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime = TRUE;
	};
	B_VatrasPissedOff();
	AI_StopProcessInfos(self);
};

