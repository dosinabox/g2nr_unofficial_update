
func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int potion)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,potion);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp -= kosten;
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy,"Чтобы сварить зелье, мне нужна пустая мензурка и необходимые для этого зелья ингредиенты. Из этих ингредиентов я могу приготовить зелье на алхимическом столе.");
	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЛЕЧЕБНОЙ ЭССЕНЦИИ': 2 лечебные травы и 1 луговой горец.");
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЛЕЧЕБНОГО ЭКСТРАКТА': 2 лечебных растения и 1 луговой горец.");
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЛЕЧЕБНОГО ЭЛИКСИРА': 2 лечебных корня и 1 луговой горец.");
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭССЕНЦИИ МАНЫ': 2 огненных крапивы и 1 луговой горец.");
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭКСТРАКТА МАНЫ': 2 огненных травы и 1 луговой горец.");
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭЛИКСИРА МАНЫ': 2 огненных корня и 1 луговой горец");
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЗЕЛЬЯ УСКОРЕНИЯ': 1 снеппер-трава и 1 луговой горец");
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭЛИКСИРА СИЛЫ': 1 драконий корень и 1 царский щавель.");
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭЛИКСИРА ЛОВКОСТИ': 1 гоблинская ягода и 1 царский щавель.");
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭЛИКСИРА ДУХА': 1 огненный корень и 1 царский щавель.");
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭЛИКСИРА ЖИЗНИ': 1 лечебный корень и 1 царский щавель.");
	};
	if((Opened_LousHammer == TRUE) && (Knows_LousHammer == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'МОЛОТА ЛУ': 1 вода, 2 репы, 1 болотная трава, 1 зуб болотной акулы и 1 ром.");
		Knows_LousHammer = TRUE;
	};
	if((Opened_Schlafhammer == TRUE) && (Knows_Schlafhammer == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для двойного 'МОЛОТА ЛУ': 1 'Молот Лу' и 1 ром.");
		Knows_Schlafhammer = TRUE;
	};
	if((Opened_SchnellerHering == TRUE) && (Knows_SchnellerHering == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'БЫСТРОЙ СЕЛЕДКИ': 1 вода, 1 ром, 1 рыба и 1 снеппер-трава.");
		Knows_SchnellerHering = TRUE;
	};
	if((Opened_MushroomMana == TRUE) && (Knows_MushroomMana == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ГРИБНОГО ЭКСТРАКТА': 50 черных грибов и 1 луговая ягода.");
		Knows_MushroomMana = TRUE;
	};
	if((Opened_MegaDrink == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для 'ЭМБАРЛА ФИРГАСТО': 10 драконьих яиц, 1 черная жемчужина и 1 сера.");
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
	};
	PrintScreen(PRINT_LearnAlchemy,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};

