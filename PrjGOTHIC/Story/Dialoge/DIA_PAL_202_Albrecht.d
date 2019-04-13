
instance DIA_Albrecht_EXIT(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 999;
	condition = DIA_Albrecht_EXIT_Condition;
	information = DIA_Albrecht_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Albrecht_Hagen(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 1;
	condition = DIA_Albrecht_Hagen_Condition;
	information = DIA_Albrecht_Hagen_Info;
	permanent = FALSE;
	description = "Мне нужно поговорить с лордом Хагеном!";
};


func int DIA_Albrecht_Hagen_Condition()
{
	if(LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Hagen_Info()
{
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//Мне нужно поговорить с лордом Хагеном!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//Он в главном зале, иди прямо, не ошибешься.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Не знаю, что тебе нужно от него, но будь краток - он занятой человек!
};


instance DIA_Albrecht_Hallo(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 2;
	condition = DIA_Albrecht_Hallo_Condition;
	information = DIA_Albrecht_Hallo_Info;
	permanent = FALSE;
	description = "Каково это, быть паладином?";
};


func int DIA_Albrecht_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_Hallo_Info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//Каково это, быть паладином?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//Паладины - воины Инноса. Они живут ради того, чтобы служить ему, и сражаются в его честь.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//Взамен все мы наделены даром магии. Магии рун, которые даруются в знак признания наших заслуг.
};


instance DIA_Albrecht_CanTeach(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 99;
	condition = DIA_Albrecht_CanTeach_Condition;
	information = DIA_Albrecht_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Albrecht_CanTeach_Condition()
{
	if(Albrecht_TeachMANA == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//Если ты докажешь, что достоин этого, я награжу тебя магическими рунами паладинов.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Кроме того, я могу научить тебя, как повысить свои магические способности.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Паладин Альбрехт может помочь мне повысить мои магические способности.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//Я обучаю только паладинов.
	};
};


instance DIA_Albrecht_TEACHPalRunes(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 100;
	condition = DIA_Albrecht_TEACHPalRunes_Condition;
	information = DIA_Albrecht_TEACHPalRunes_Info;
	permanent = TRUE;
	description = "Я достоин получить руну?";
};


func int DIA_Albrecht_TEACHPalRunes_Condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_TEACHPalRunes_Info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Я достоин получить руну?
	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//В знак признания твоего ранга я награждаю тебя Руной Света. Это символ истины и правосудия.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Освещай путь тем, кто следует пути Инноса.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//Остальные руны ты должен заслужить. Приходи, когда сочтешь, что достоин их.
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
		CreateInvItems(self,ItRu_PalLight,1);
		B_GiveInvItems(self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Какой путь ты выбираешь?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Путь исцеления или путь битвы?
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,"Я выбираю путь исцеления.",DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,"Я выбираю путь битвы.",DIA_Albrecht_TEACHPalRunes_Combat);
	};
};

func void DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
};

func void B_Albrecht_YouAreNotWorthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Ты пока недостоин получить следующее заклинание этого пути.
};

func void DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Я выбираю путь исцеления.
	if((PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Лечение легких ранений",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE) && (Kapitel >= 5))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Лечение средних ранений",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func void DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Я выбираю путь битвы.
	if((PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Святая стрела",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE) && (Kapitel >= 5))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Изгнание зла",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func int DIA_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if(other.lp < CostForPAlSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	CreateInvItems(self,ItRu_PalLightHeal,1);
	B_GiveInvItems(self,other,ItRu_PalLightHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if(other.lp < CostForPAlSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	CreateInvItems(self,ItRu_PalMediumHeal,1);
	B_GiveInvItems(self,other,ItRu_PalMediumHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if(other.lp < CostForPAlSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	CreateInvItems(self,ItRu_PalHolyBolt,1);
	B_GiveInvItems(self,other,ItRu_PalHolyBolt,1);
	other.lp = other.lp - CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if(other.lp < CostForPAlSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	CreateInvItems(self,ItRu_PalRepelEvil,1);
	B_GiveInvItems(self,other,ItRu_PalRepelEvil,1);
	other.lp = other.lp - CostForPAlSpells;
	return TRUE;
};


instance DIA_Albrecht_Teach(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 101;
	condition = DIA_Albrecht_Teach_Condition;
	information = DIA_Albrecht_Teach_Info;
	permanent = TRUE;
	description = "Я хочу повысить свои магические способности.";
};


func int DIA_Albrecht_Teach_Condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Teach_Info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Я хочу повысить свои магические способности.
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach,Dialog_Back,DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Если ты хочешь повысить свои магические способности еще больше, тебе придется поискать другого учителя.
	};
	Info_ClearChoices(DIA_Albrecht_Teach);
};

func void DIA_Albrecht_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach,Dialog_Back,DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach,Dialog_Back,DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};


instance DIA_Albrecht_PICKPOCKET(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 900;
	condition = DIA_Albrecht_PICKPOCKET_Condition;
	information = DIA_Albrecht_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Albrecht_PICKPOCKET_Condition()
{
	return C_Beklauen(41,160);
};

func void DIA_Albrecht_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET,Dialog_Back,DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

