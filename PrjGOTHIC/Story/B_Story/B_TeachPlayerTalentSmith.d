
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	if(PremiumTeachersEnabled == TRUE)
	{
		if(!B_GiveInvItems(oth,slf,ItMi_Gold,kosten * PremiumTeachersPrice))
		{
			PrintScreen(Print_NotEnoughGold,-1,-1,FONT_Screen,2);
			DIA_Common_WeWillGetToThatLater();
			return FALSE;
		};
	};
	oth.lp -= kosten;
	if(Npc_GetTalentSkill(oth,NPC_TALENT_SMITH) == 0)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentSmith,PRINT_LearnSmithLog);
	};
	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для простого кованого меча мне не нужны никакие дополнительные ресурсы.");
	}
	else if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для длинного рудного меча мне нужен 1 кусок руды.");
	}
	else if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для двуручного рудного меча мне нужны 2 куска руды.");
	}
	else if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для полуторного рудного меча мне нужны 2 куска руды.");
	}
	else if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для тяжелого двуручного рудного меча мне нужны 3 куска руды.");
	}
	else if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для боевого рудного меча мне нужны 3 куска руды.");
	}
	else if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для тяжелого боевого рудного меча мне нужны 4 куска руды.");
	}
	else if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для рудного 'Убийцы драконов' мне нужны 4 куска руды и 5 флаконов крови дракона.");
	}
	else if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Для большого рудного 'Убийцы драконов' мне нужны 5 кусков руды и 5 флаконов крови дракона.");
	}
	else if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Теперь я могу выковать изысканный меч.");
	}
	else if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Теперь я могу выковать изысканный длинный меч.");
	}
	else if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Теперь я могу выковать рубиновый клинок.");
	}
	else if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"Гарад передал мне секрет ковки 'Эль-бастардо' - одного из лучших клинков в мире!");
	};
	if((Opened_Banditenaxt == TRUE) && (Knows_Banditenaxt == FALSE))
	{
		B_LogEntry(TOPIC_TalentSmith,"Для бандитского топора мне нужен 1 кусок руды, 3 зуба и 1 дополнительная стальная заготовка.");
		Knows_Banditenaxt = TRUE;
	};
	PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
	return TRUE;
};

