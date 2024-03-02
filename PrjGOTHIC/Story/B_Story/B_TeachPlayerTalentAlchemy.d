
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
	if(!Npc_GetTalentSkill(oth,NPC_TALENT_ALCHEMY))
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAlchemy,"„тобы сварить зелье, мне нужна пуста€ мензурка и необходимые дл€ этого зель€ ингредиенты. »з этих ингредиентов € могу приготовить зелье на алхимическом столе.");
	};
	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ… Ё——≈Ќ÷»»': 2 лечебные травы и 1 луговой горец.");
	}
	else if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ√ќ Ё —“–ј “ј': 2 лечебных растени€ и 1 луговой горец.");
	}
	else if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ√ќ ЁЋ» —»–ј': 2 лечебных корн€ и 1 луговой горец.");
	}
	else if(potion == POTION_Health_04)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ '„»—“ќ√ќ «ƒќ–ќ¬№я': 1 луговой горец и 3 лечебные эссенции.");
	}
	else if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ё——≈Ќ÷»» ћјЌџ': 2 огненные крапивы и 1 луговой горец.");
	}
	else if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ё —“–ј “ј ћјЌџ': 2 огненные травы и 1 луговой горец.");
	}
	else if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј ћјЌџ': 2 огненных корн€ и 1 луговой горец.");
	}
	else if(potion == POTION_Mana_04)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ '„»—“ќ… ћјЌџ': 1 луговой горец и 3 эссенции маны.");
	}
	else if(potion == POTION_MegaDrink)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁћЅј–Ћј ‘»–√ј—“ќ': 10 драконьих €иц, 1 черна€ жемчужина и 1 сера.");
	}
	else if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ '«≈Ћ№я ”— ќ–≈Ќ»я': 1 снеппер-трава и 1 луговой горец.");
	}
	else if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј —»Ћџ': 1 драконий корень и 1 царский щавель.");
	}
	else if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј Ћќ¬ ќ—“»': 1 гоблинска€ €года и 1 царский щавель.");
	}
	else if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј ƒ”’ј': 1 огненный корень и 1 царский щавель.");
	}
	else if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁЋ» —»–ј ∆»«Ќ»': 1 лечебный корень и 1 царский щавель.");
	};
	if((Opened_LousHammer == TRUE) && (Knows_LousHammer == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ћќЋќ“ј Ћ”': 1 вода, 2 репы, 1 болотна€ трава, 1 зуб болотной акулы и 1 ром.");
		Knows_LousHammer = TRUE;
	};
	if((Opened_Schlafhammer == TRUE) && (Knows_Schlafhammer == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ двойного 'ћќЋќ“ј Ћ”': 1 'ћолот Ћу' и 1 ром.");
		Knows_Schlafhammer = TRUE;
	};
	if((Opened_SchnellerHering == TRUE) && (Knows_SchnellerHering == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'Ѕџ—“–ќ… —≈Ћ≈ƒ »': 1 вода, 1 ром, 1 рыба и 1 снеппер-трава.");
		Knows_SchnellerHering = TRUE;
	};
	if((Opened_MushroomMana == TRUE) && (Knows_MushroomMana == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ '√–»ЅЌќ√ќ Ё —“–ј “ј': 50 черных грибов и 1 лугова€ €года.");
		Knows_MushroomMana = TRUE;
	};
	if((Opened_AppleSTR == TRUE) && (Knows_AppleSTR == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'яЅЋќ„Ќќ√ќ Ё —“–ј “ј': 25 €блок и 1 лесна€ €года.");
		Knows_AppleSTR = TRUE;
	};
	if((Opened_MegaDrink == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"»нгредиенты дл€ 'ЁћЅј–Ћј ‘»–√ј—“ќ': 10 драконьих €иц, 1 черна€ жемчужина и 1 сера.");
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
	};
	PrintScreen(PRINT_LearnAlchemy,-1,-1,FONT_Screen,2);
	return TRUE;
};

