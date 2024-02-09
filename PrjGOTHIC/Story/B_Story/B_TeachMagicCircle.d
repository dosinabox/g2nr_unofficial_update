
func int B_TeachMagicCircle(var C_Npc slf,var C_Npc oth,var int circle)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print(PRINT_WrongParameter);
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
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
	if(!Npc_GetTalentSkill(oth,NPC_TALENT_MAGE))
	{
		Log_CreateTopic(TOPIC_TalentMagicCircle,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentMagicCircle,"ћагические руны, к которым € имею доступ, подраздел€ютс€ по кругам. я не могу использовать заклинание, требующее более высокого круга, нежели изученный мной.");
	};
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	if(circle == 1)
	{
		PrintScreen(PRINT_LearnCircle_1,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"«аклинани€ 1-го круга: свет, огненна€ стрела, мала€ молни€, лечение легких ранений и вызов скелета гоблина.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LearnCircle_2,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"«аклинани€ 2-го круга: огненный шар, лед€на€ стрела, вызов волка, кулак ветра и сон.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LearnCircle_3,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"«аклинани€ 3-го круга: лечение средних ранений, шарова€ молни€, мала€ огненна€ бур€, вызов скелета, страх и лед€ной блок.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LearnCircle_4,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"«аклинани€ 4-го круга: молни€, вызов голема, уничтожение нежити и большой огненный шар.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LearnCircle_5,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"«аклинани€ 5-го круга: больша€ огненна€ бур€, лед€на€ волна, вызов демона, лечение т€желых ранений и уменьшение монстра.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LearnCircle_6,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"«аклинани€ 6-го круга: огненный дождь, дыхание смерти, волна смерти и арми€ “ьмы.");
		return TRUE;
	};
	return FALSE;
};

