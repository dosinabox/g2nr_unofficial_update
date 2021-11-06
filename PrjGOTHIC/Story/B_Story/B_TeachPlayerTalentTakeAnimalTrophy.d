
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;
	var int talent;
	var string text;
	if(trophy == TROPHY_Fur)
	{
		kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALFUR,trophy);
		talent = NPC_TALENT_TAKEANIMALFUR;
		text = PRINT_LearnTakeAnimalFur;
	}
	else if(trophy == TROPHY_ReptileSkin)
	{
		kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALFUR,trophy);
		talent = NPC_TALENT_TAKEANIMALFUR;
		text = PRINT_LearnTakeReptileSkin;
	}
	else
	{
		kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
		talent = NPC_TALENT_TAKEANIMALTROPHY;
		text = PRINT_LearnTakeAnimalTrophy;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp -= kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	Log_AddEntry(TOPIC_TalentAnimalTrophy,"Теперь я могу:");
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с мертвых животных.");
	}
	else if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать кожу с мертвых рептилий.");
	}
	else if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать клыки у мертвых животных.");
	}
	else if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать когти у мертвых животных.");
	}
	else if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать сердца у мертвых големов и демонов.");
	}
	else if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать рога у мертвых мракорисов.");
	}
	else if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать язык у мертвых огненных ящеров.");
	}
	else if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать крылья у мертвых кровавых мух.");
	}
	else if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать жало у мертвых кровавых мух.");
	}
	else if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать мандибулы у мертвых краулеров и полевых хищников.");
	}
	else if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать панцири с мертвых краулеров.");
	}
	else if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать рога у мертвых драконьих снепперов.");
	}
	else if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		if(CurrentLevel == OLDWORLD_ZEN)
		{
			CreateInvItems(SwampDragon,ItAt_DragonScale,12);
			CreateInvItems(RockDragon,ItAt_DragonScale,12);
			CreateInvItems(FireDragon,ItAt_DragonScale,12);
			CreateInvItems(IceDragon,ItAt_DragonScale,12);
		}
		else
		{
			DragonScaleLearnedOutsideOW = TRUE;
		};
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать чешую с мертвых драконов.");
	}
	else if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		if(CurrentLevel == OLDWORLD_ZEN)
		{
			CreateInvItems(SwampDragon,ItAt_DragonBlood,2);
			CreateInvItems(RockDragon,ItAt_DragonBlood,2);
			CreateInvItems(FireDragon,ItAt_DragonBlood,2);
			CreateInvItems(IceDragon,ItAt_DragonBlood,2);
		}
		else
		{
			DragonBloodLearnedOutsideOW = TRUE;
		};
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...собирать кровь из мертвых драконов.");
	};
	PrintScreen(text,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,talent,1);
	return TRUE;
};

