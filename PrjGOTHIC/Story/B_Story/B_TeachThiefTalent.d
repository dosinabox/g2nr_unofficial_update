
func int B_TeachThiefTalent(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,talent,1);
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
	{
		Print(PRINT_WrongParameter);
		return FALSE;
	};
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
	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		PrintScreen(PRINT_LearnPicklock,-1,-1,FONT_Screen,2);
		return TRUE;
	}
	else if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		PrintScreen(PRINT_LearnSneak,-1,-1,FONT_Screen,2);
		return TRUE;
	}
	else if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		PrintScreen(PRINT_LearnAcrobat,-1,-1,FONT_Screen,2);
		return TRUE;
	}
	else if(talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		PrintScreen(PRINT_LearnPickpocket,-1,-1,FONT_Screen,2);
		Log_CreateTopic(Topic_PickPocket,LOG_NOTE);
		return TRUE;
	};
	return FALSE;
};

