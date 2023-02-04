
func int B_TeachPlayerTalentForeignLanguage(var C_Npc slf,var C_Npc oth,var int language)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_FOREIGNLANGUAGE,language);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp -= kosten;
	Log_CreateTopic(TOPIC_Language,LOG_NOTE);
	if(language == LANGUAGE_1)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_FOREIGNLANGUAGE,1);
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
		B_LogEntry(TOPIC_Language,LogText_Addon_Language_1);
		PrintScreen("»зучено: язык кресть€н",-1,-1,FONT_Screen,2);
	}
	else if(language == LANGUAGE_2)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_FOREIGNLANGUAGE,2);
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
		B_LogEntry(TOPIC_Language,LogText_Addon_Language_2);
		PrintScreen("»зучено: язык воинов",-1,-1,FONT_Screen,2);
	}
	else if(language == LANGUAGE_3)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_FOREIGNLANGUAGE,3);
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
		B_LogEntry(TOPIC_Language,LogText_Addon_Language_3);
		PrintScreen("»зучено: язык жрецов",-1,-1,FONT_Screen,2);
	};
	TOPIC_End_Stoneplates = TRUE;
	B_CheckLog();
	return TRUE;
};

