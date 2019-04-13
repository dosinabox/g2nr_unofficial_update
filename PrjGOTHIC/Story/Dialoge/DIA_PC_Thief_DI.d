
instance DIA_PC_Thief_DI_EXIT(C_Info)
{
	npc = PC_Thief_DI;
	nr = 999;
	condition = DIA_PC_Thief_DI_EXIT_Condition;
	information = DIA_PC_Thief_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PC_Thief_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PC_Thief_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_Thief_DI_Hallo(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_Hallo_Condition;
	information = DIA_PC_Thief_DI_Hallo_Info;
	description = "Мы прибыли.";
};


func int DIA_PC_Thief_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//Мы прибыли.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//Этот остров, похоже, находится совсем недалеко от Хориниса.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//Я не знал об этом. Но теперь многие вещи стали для меня очевидными.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//Я все время задавал себе вопрос - как оркам так быстро удавалось доставлять провизию и подкрепление.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//Имея такой аванпост, это было для них легче легкого.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//На пути вглубь острова, ты, вероятно, наткнешься на ловушку-другую.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//Если тебе покажется, что ты не знаешь, что делать дальше, вернись ко мне. Возможно, мой опыт сможет помочь тебе.
};


instance DIA_PC_Thief_DI_RAT(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_RAT_Condition;
	information = DIA_PC_Thief_DI_RAT_Info;
	permanent = TRUE;
	description = "Мне нужен твой совет.";
};


func int DIA_PC_Thief_DI_RAT_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && Npc_KnowsInfo(other,DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};


var int DIA_PC_Thief_DI_RAT_OneTime;
var int DIA_PC_Thief_DI_RAT_OneTime2;

func void DIA_PC_Thief_DI_RAT_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//Мне нужен твой совет.
	if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//У полковника орков здесь есть штаб-квартира. Я не могу продвинуться вглубь острова дальше этой точки.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//Орки хитрые создания. Зачастую их недооценивают. Я полагаю, у них там что-то вроде секретного прохода. Осмотри стены на предмет скрытых выключателей.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//Помни, впрочем - эти выключатели обычно нужно нажимать в определенном порядке, чтобы механизм сработал.
	}
	else if(Npc_IsDead(FireDragonIsland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//Я сражался с драконом и теперь застрял перед пропастью с подъемным мостом. Этот мост поднят, и я не знаю, как опустить его.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//Ммм. А ты не пробовал дальнобойное оружие? Может быть, механизм можно активировать при помощи выстрела.
	}
	else if(Npc_IsDead(Skeleton_Lord_Archol) && (Npc_KnowsInfo(other,DIA_Schwarzmagier_HELLO) == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//Я встречаю на своем пути полчища нежити и их изощренные ловушки.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//Извини, но я никогда не имел дела с нежитью. Здесь тебе придется изобретать что-то самому.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//Приходи ко мне, если у тебя возникнет проблема, которую мой опыт может помочь разрешить.
		if((ORkSturmDI == TRUE) && (DIA_PC_Thief_DI_RAT_OneTime2 == FALSE))
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//Еще одно. Я бы предпочел, чтобы ты не приводил всех этих тварей, что бродят здесь, к кораблю. Я надеюсь, этот рейд орков был последней атакой, которую нам пришлось отражать здесь!
			B_GivePlayerXP(XP_Ambient);
			DIA_PC_Thief_DI_RAT_OneTime2 = TRUE;
		};
	};
};


instance DIA_Diego_DI_TRADE(C_Info)
{
	npc = PC_Thief_DI;
	nr = 12;
	condition = DIA_Diego_DI_TRADE_Condition;
	information = DIA_Diego_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Мне нужна амуниция.";
};


func int DIA_Diego_DI_TRADE_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Diego_DI_TRADE_Info()
{
	var int McBolzenAmount;
	var int McArrowAmount;
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//Мне нужна амуниция.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
	McBolzenAmount = Kapitel * 50;
	CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
	Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
	McArrowAmount = Kapitel * 50;
	CreateInvItems(self,ItRw_Arrow,McArrowAmount);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Возможно, я смогу помочь тебе.
};


instance DIA_PC_Thief_DI_Training_Talente(C_Info)
{
	npc = PC_Thief_DI;
	nr = 10;
	condition = DIA_PC_Thief_DI_Training_Talente_Condition;
	information = DIA_PC_Thief_DI_Training_Talente_Info;
	permanent = TRUE;
	description = "Обучи меня.";
};


func int DIA_PC_Thief_DI_Training_Talente_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && Npc_KnowsInfo(other,DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Training_Talente_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Обучи меня.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//Что тебе нужно?
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,"Использование отмычек",DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//Тебе будет значительно легче, если ты будешь держаться подальше от линии огня.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,"Использование отмычек",DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//Когда ты двигаешься, всегда помни о том, как легко передвигаются коты. Остальное придет само собой.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,"Использование отмычек",DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Combat_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//Для достижения лучшего результата побольше тренируйся.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,"Использование отмычек",DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Combat_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//Чтобы твоя рука не дрожала, во время прицеливания старайся дышать пореже.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,"Использование отмычек",DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Talente_PICKLOCK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//Лучше поздно, чем никогда. Странно что ты не изучил эту способность раньше.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,"Использование отмычек",DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Talente_BACK()
{
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
};


instance DIA_PC_Thief_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Thief_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Все кончено. Теперь мы можем убираться отсюда.";
};


func int DIA_PC_Thief_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_PC_Thief_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Thief_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//Все кончено. Теперь мы можем убираться отсюда.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//Ты только посмотри на это. В жизни не видел такого сооружения.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//Как тебе, черт возьми, удалось пройти там?
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//Мне просто повезло, я думаю.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//(смеется) Ну, если ты так думаешь...
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//Отлично.
	};
	if(DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//Что ты собираешься делать дальше?
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//Хороший вопрос. Я думаю, сначала нужно вернуться в Хоринис.
		if((Diebesgilde_Verraten == TRUE) || (MIS_Andre_GuildOfThieves == LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//Там больше нет гильдии воров. Это открывает новые интересные возможности.
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//Ммм. Ну, или, может быть, я просто продолжу бизнес Бромора. Это очень неплохие деньги. Честные деньги.
		DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//Иди к капитану. Пусть он поднимает якорь.
	AI_StopProcessInfos(self);
	if(Lares_IsOnBoard != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_Thief_DI_PICKPOCKET(C_Info)
{
	npc = PC_Thief_DI;
	nr = 900;
	condition = DIA_Thief_DI_PICKPOCKET_Condition;
	information = DIA_Thief_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Thief_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET,Dialog_Back,DIA_Thief_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_DI_PICKPOCKET_DoIt);
};

func void DIA_Thief_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

func void DIA_Thief_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

