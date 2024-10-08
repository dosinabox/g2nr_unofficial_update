
func void B_WISPDETECTOR_LearnEffect(var C_Npc teacher)
{
	AI_PlayAni(teacher,"T_PRACTICEMAGIC5");
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
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	if(C_PremiumTeachersEnabled())
	{
		if(!B_GiveInvItems(oth,slf,ItMi_Gold,kosten * PremiumTeachersPrice))
		{
			PrintScreen(Print_NotEnoughGold,-1,-1,FONT_Screen,2);
			DIA_Common_WeWillGetToThatLater();
			return FALSE;
		};
	};
	oth.lp -= kosten;
	Log_CreateTopic(TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned);
	if(WispSkill == WISPSKILL_FF)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] = TRUE;
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_FF);
	}
	else if(WispSkill == WISPSKILL_NONE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] = TRUE;
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NONE);
	}
	else if(WispSkill == WISPSKILL_RUNE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] = TRUE;
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_RUNE);
	}
	else if(WispSkill == WISPSKILL_MAGIC)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_MAGIC);
	}
	else if(WispSkill == WISPSKILL_FOOD)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] = TRUE;
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_FOOD);
	}
	else if(WispSkill == WISPSKILL_POTIONS)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] = TRUE;
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_POTIONS);
	};
	B_WISPDETECTOR_LearnEffect(slf);
	PrintScreen(PRINT_LearnWispDetector,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_WISPDETECTOR,1);
	return TRUE;
};

