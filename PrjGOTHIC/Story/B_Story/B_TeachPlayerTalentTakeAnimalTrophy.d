
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Теперь я могу:");
	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать клыки из мертвых животных.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать когти из мертвых животных.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с мертвых животных.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с рептилий.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать сердца из мертвых големов и демонов.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать рог у мертвых мракорисов.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать язык у мертвых огненных ящеров.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать крылья у мертвых кровавых мух.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вынимать жало у мертвых кровавых мух.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать мандибулы у мертвых животных.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать панцири с мертвых краулеров.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать рога у мертвых драконих снепперов.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		CreateInvItems(SwampDragon,ItAt_DragonScale,12);
		CreateInvItems(RockDragon,ItAt_DragonScale,12);
		CreateInvItems(FireDragon,ItAt_DragonScale,12);
		CreateInvItems(IceDragon,ItAt_DragonScale,12);
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... снимать чешую с мертвых драконов.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		CreateInvItems(SwampDragon,ItAt_DragonBlood,2);
		CreateInvItems(RockDragon,ItAt_DragonBlood,2);
		CreateInvItems(FireDragon,ItAt_DragonBlood,2);
		CreateInvItems(IceDragon,ItAt_DragonBlood,2);
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... собирать кровь из мертвых драконов.");
	};
	PrintScreen(PRINT_LearnTakeAnimalTrophy,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	return TRUE;
};

