
func void B_WISPDETECTOR_LearnEffect(var C_Npc Teacher)
{
	AI_PlayAni(Teacher,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	Snd_Play("WSP_Dead_A1");
};

func int B_TeachPlayerTalentWispDetector(var C_Npc slf,var C_Npc oth,var int WispSkill)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_WISPDETECTOR,WispSkill);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned);
	if(WispSkill == WISPSKILL_FF)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_FF);
	};
	if(WispSkill == WISPSKILL_NONE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NONE);
	};
	if(WispSkill == WISPSKILL_RUNE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_RUNE);
	};
	if(WispSkill == WISPSKILL_MAGIC)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_MAGIC);
	};
	if(WispSkill == WISPSKILL_FOOD)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_FOOD);
	};
	if(WispSkill == WISPSKILL_POTIONS)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_POTIONS);
	};
	PrintScreen(PRINT_LearnWispDetector,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_WISPDETECTOR,1);
	return TRUE;
};

