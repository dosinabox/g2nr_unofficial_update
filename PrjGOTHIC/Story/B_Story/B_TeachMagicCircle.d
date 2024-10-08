
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
	if(!Npc_GetTalentSkill(oth,NPC_TALENT_MAGE))
	{
		Log_CreateTopic(TOPIC_TalentMagicCircle,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentMagicCircle,"���������� ����, � ������� � ���� ������, �������������� �� ������. � �� ���� ������������ ����������, ��������� ����� �������� �����, ������ ��������� ����.");
	};
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	if(circle == 1)
	{
		PrintScreen(PRINT_LearnCircle_1,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"���������� 1-�� �����: ����, �������� ������, ����� ������, ������� ������ ������� � ����� ������� �������.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LearnCircle_2,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"���������� 2-�� �����: �������� ���, ������� ������, ����� �����, ����� ����� � ���.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LearnCircle_3,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"���������� 3-�� �����: ������� ������� �������, ������� ������, ����� �������� ����, ����� �������, ����� � ������� ����.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LearnCircle_4,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"���������� 4-�� �����: ������, ����� ������, ����������� ������ � ������� �������� ���.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LearnCircle_5,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"���������� 5-�� �����: ������� �������� ����, ������� �����, ����� ������, ������� ������� ������� � ���������� �������.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LearnCircle_6,-1,-1,FONT_Screen,2);
		B_LogEntry(TOPIC_TalentMagicCircle,"���������� 6-�� �����: �������� �����, ������� ������, ����� ������ � ����� ����.");
		return TRUE;
	};
	return FALSE;
};

