
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"„тобы выковать оружие, прежде всего мне нужна сыра€ сталь. я должен докрасна нагреть ее в огне кузнечного горна, а затем придать форму на наковальне. ќсобое оружие зачастую требует особых материалов, придающих оружию особые свойства. ");
	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'кустарного меча' мне не нужно никаких ингредиентов.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'длинного рудного меча' мне нужен 1 кусок руды.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'двуручного рудного меча' мне нужно 2 куска руды.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'полуторного рудного меча' мне нужно 2 куска руды.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'т€желого двуручного рудного меча' мне нужно 3 куска руды.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'боевого рудного меча' мне нужно 3 куска руды.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'т€желого боевого рудного меча' мне нужно 4 куска руды.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'рудного убийцы драконов' мне нужно 4 куска руды и 5 флаконов крови дракона.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"ƒл€ 'большого рудного убийцы драконов' мне нужно 5 куска руды и 5 флаконов крови дракона.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"“еперь € могу выковать изысканный меч.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"“еперь € могу выковать изысканный длинный меч.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"“еперь € могу выковать рубиновый клинок.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"’арад передал мне секрет ковки 'Ёль Ѕастардо' - одного из лучших клинков в мире!");
	};
	PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

