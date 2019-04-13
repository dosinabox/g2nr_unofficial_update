
instance StandardBrief(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseStandardBrief;
	scemeName = "MAP";
//	description = "Стандартное письмо";
	description = "Переменные массива aivar";
};


func void UseStandardBrief()
{
	var int nDocID;
	var string aiv;
	var string txt;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
//	Doc_PrintLine(nDocID,0,"Стандартное письмо");
	Doc_PrintLine(nDocID,0,"Реальные атрибуты и навыки");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
//	Doc_PrintLines(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	txt = "";
/*	aiv = ConcatStrings("AIV_LastFightAgainstPlayer:",IntToString(self.aivar[AIV_LastFightAgainstPlayer]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_NpcSawPlayerCommit:",IntToString(self.aivar[AIV_NpcSawPlayerCommit]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_NpcSawPlayerCommitDay:",IntToString(self.aivar[AIV_NpcSawPlayerCommitDay]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_NpcStartedTalk:",IntToString(self.aivar[AIV_NpcStartedTalk]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_INVINCIBLE:",IntToString(self.aivar[AIV_INVINCIBLE]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_TalkedToPlayer:",IntToString(self.aivar[AIV_TalkedToPlayer]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_PlayerHasPickedMyPocket:",IntToString(self.aivar[AIV_PlayerHasPickedMyPocket]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LASTTARGET:",IntToString(self.aivar[AIV_LASTTARGET]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_PursuitEnd:",IntToString(self.aivar[AIV_PursuitEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_ATTACKREASON:",IntToString(self.aivar[AIV_ATTACKREASON]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_RANSACKED:",IntToString(self.aivar[AIV_RANSACKED]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_DeathInvGiven:",IntToString(self.aivar[AIV_DeathInvGiven]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_Guardpassage_Status:",IntToString(self.aivar[AIV_Guardpassage_Status]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LastDistToWP:",IntToString(self.aivar[AIV_LastDistToWP]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_PASSGATE:",IntToString(self.aivar[AIV_PASSGATE]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_PARTYMEMBER:",IntToString(self.aivar[AIV_PARTYMEMBER]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_VictoryXPGiven:",IntToString(self.aivar[AIV_VictoryXPGiven]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_Gender:",IntToString(self.aivar[AIV_Gender]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_Food:",IntToString(self.aivar[AIV_Food]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_TAPOSITION:",IntToString(self.aivar[AIV_TAPOSITION]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_SelectSpell:",IntToString(self.aivar[AIV_SelectSpell]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_SeenLeftRoom:",IntToString(self.aivar[AIV_SeenLeftRoom]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_HitByOtherNpc:",IntToString(self.aivar[AIV_HitByOtherNpc]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_WaitBeforeAttack:",IntToString(self.aivar[AIV_WaitBeforeAttack]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LastAbsolutionLevel:",IntToString(self.aivar[AIV_LastAbsolutionLevel]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_ToughGuyNewsOverride:",IntToString(self.aivar[AIV_ToughGuyNewsOverride]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_ThreatenBeforeAttack:",IntToString(self.aivar[AIV_MM_ThreatenBeforeAttack]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_FollowTime:",IntToString(self.aivar[AIV_MM_FollowTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_FollowInWater:",IntToString(self.aivar[AIV_MM_FollowInWater]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_PRIORITY:",IntToString(self.aivar[AIV_MM_PRIORITY]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_SleepStart:",IntToString(self.aivar[AIV_MM_SleepStart]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_SleepEnd:",IntToString(self.aivar[AIV_MM_SleepEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_RestStart:",IntToString(self.aivar[AIV_MM_RestStart]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_RestEnd:",IntToString(self.aivar[AIV_MM_RestEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_RoamStart:",IntToString(self.aivar[AIV_MM_RoamStart]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_RoamEnd:",IntToString(self.aivar[AIV_MM_RoamEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_EatGroundStart:",IntToString(self.aivar[AIV_MM_EatGroundStart]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_EatGroundEnd:",IntToString(self.aivar[AIV_MM_EatGroundEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_WuselStart:",IntToString(self.aivar[AIV_MM_WuselStart]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_WuselEnd:",IntToString(self.aivar[AIV_MM_WuselEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_OrcSitStart:",IntToString(self.aivar[AIV_MM_OrcSitStart]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_OrcSitEnd:",IntToString(self.aivar[AIV_MM_OrcSitEnd]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_ShrinkState:",IntToString(self.aivar[AIV_MM_ShrinkState]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_REAL_ID:",IntToString(self.aivar[AIV_MM_REAL_ID]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LASTBODY:",IntToString(self.aivar[AIV_LASTBODY]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_ArenaFight:",IntToString(self.aivar[AIV_ArenaFight]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_CrimeAbsolutionLevel:",IntToString(self.aivar[AIV_CrimeAbsolutionLevel]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LastPlayerAR:",IntToString(self.aivar[AIV_LastPlayerAR]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_DuelLost:",IntToString(self.aivar[AIV_DuelLost]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_ChapterInv:",IntToString(self.aivar[AIV_ChapterInv]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MM_Packhunter:",IntToString(self.aivar[AIV_MM_Packhunter]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MagicUser:",IntToString(self.aivar[AIV_MagicUser]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_DropDeadAndKill:",IntToString(self.aivar[AIV_DropDeadAndKill]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_FreezeStateTime:",IntToString(self.aivar[AIV_FreezeStateTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_IGNORE_Murder:",IntToString(self.aivar[AIV_IGNORE_Murder]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_IGNORE_Theft:",IntToString(self.aivar[AIV_IGNORE_Theft]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_IGNORE_Sheepkiller:",IntToString(self.aivar[AIV_IGNORE_Sheepkiller]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_ToughGuy:",IntToString(self.aivar[AIV_ToughGuy]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_NewsOverride:",IntToString(self.aivar[AIV_NewsOverride]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_MaxDistToWp:",IntToString(self.aivar[AIV_MaxDistToWp]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_OriginalFightTactic:",IntToString(self.aivar[AIV_OriginalFightTactic]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_EnemyOverride:",IntToString(self.aivar[AIV_EnemyOverride]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_SummonTime:",IntToString(self.aivar[AIV_SummonTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_FightDistCancel:",IntToString(self.aivar[AIV_FightDistCancel]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LastFightComment:",IntToString(self.aivar[AIV_LastFightComment]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_LOADGAME:",IntToString(self.aivar[AIV_LOADGAME]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_DefeatedByPlayer:",IntToString(self.aivar[AIV_DefeatedByPlayer]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_KilledByPlayer:",IntToString(self.aivar[AIV_KilledByPlayer]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_StateTime:",IntToString(self.aivar[AIV_StateTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_Dist:",IntToString(self.aivar[AIV_Dist]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_IgnoresFakeGuild:",IntToString(self.aivar[AIV_IgnoresFakeGuild]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_NoFightParker:",IntToString(self.aivar[AIV_NoFightParker]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_NPCIsRanger:",IntToString(self.aivar[AIV_NPCIsRanger]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_IgnoresArmor:",IntToString(self.aivar[AIV_IgnoresArmor]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_StoryBandit:",IntToString(self.aivar[AIV_StoryBandit]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_StoryBandit_Esteban:",IntToString(self.aivar[AIV_StoryBandit_Esteban]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_WhirlwindStateTime:",IntToString(self.aivar[AIV_WhirlwindStateTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_InflateStateTime:",IntToString(self.aivar[AIV_InflateStateTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_SwarmStateTime:",IntToString(self.aivar[AIV_SwarmStateTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_SuckEnergyStateTime:",IntToString(self.aivar[AIV_SuckEnergyStateTime]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_FollowDist:",IntToString(self.aivar[AIV_FollowDist]));
	txt = ConcatStrings(txt,aiv);*/
	aiv = ConcatStrings(" REAL_STRENGTH:",IntToString(self.aivar[REAL_STRENGTH]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_DEXTERITY:",IntToString(self.aivar[REAL_DEXTERITY]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_MANA_MAX:",IntToString(self.aivar[REAL_MANA_MAX]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_TALENT_1H:",IntToString(self.aivar[REAL_TALENT_1H]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_TALENT_2H:",IntToString(self.aivar[REAL_TALENT_2H]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_TALENT_BOW:",IntToString(self.aivar[REAL_TALENT_BOW]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_TALENT_CROSSBOW:",IntToString(self.aivar[REAL_TALENT_CROSSBOW]));
	txt = ConcatStrings(txt,aiv);
/*	aiv = ConcatStrings(" AIV_SpellLevel:",IntToString(self.aivar[AIV_SpellLevel]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" AIV_GetBonusFood:",IntToString(self.aivar[AIV_GetBonusFood]));
	txt = ConcatStrings(txt,aiv);
	aiv = ConcatStrings(" REAL_LEVEL:",IntToString(self.aivar[REAL_LEVEL]));
	txt = ConcatStrings(txt,aiv);*/
	Doc_PrintLines(nDocID,0,txt);
	Doc_Show(nDocID);
};


instance StandardBuch(C_Item)
{
	name = "Книга";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Стандартная книга";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseStandardBuch;
};


func void UseStandardBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Страница 1");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Страница 2");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(nDocID);
};


instance ItWr_Map_NewWorld(C_Item)
{
	name = "Карта земель Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_Map_NewWorld_City(C_Item)
{
	name = "Карта города Хоринис";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_City;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_City()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_City);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-6900,11800,21600,-9400);
	Doc_Show(Document);
};


instance ItWr_Map_OldWorld(C_Item)
{
	name = "Карта Долины Рудников";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_OldWorld()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


var int Lerne_Einhand;
var int Lerne_Zweihand;

instance ItWr_EinhandBuch(C_Item)
{
	name = "Искусство сражения";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Южное искусство обороны";
	text[2] = "Книга, посвященная искусству";
	text[3] = "сражения одноручным оружием.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseEinhandBuch;
};


func void UseEinhandBuch()
{
	var int nDocID;
	if(Lerne_Einhand == FALSE)
	{
		B_RaiseFightTalent(self,NPC_TALENT_1H,5);
		PrintScreen(PRINT_Learn1H,-1,-1,FONT_Screen,2);
		Lerne_Einhand = TRUE;
		Snd_Play("Levelup");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Южное искусство обороны");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Южане меньше полагаются на грубую физическую силу, нежели северяне, и отдают предпочтение ловкости. В горячем климате своей родины они предпочитают носить легкие доспехи, позволяющие двигаться более свободно. Таким образом, южане разработали стиль боя, фундаментально отличающийся от того, к которому привыкли мы.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Вероятно, самый известный прием, используемый южанами - это блок одноручным оружием и шаг назад. Шаг назад позволяет бойцу ослабить атакующий удар и в то же время занять превосходную стойку, из которой можно провести контратаку.");
	Doc_Show(nDocID);
};


instance ItWr_ZweihandBuch(C_Item)
{
	name = "Тактика боя";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Двойные блоки";
	text[2] = "Книга, посвященная искусству";
	text[3] = "сражения двуручным оружием.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseZweihandBuch;
};


func void UseZweihandBuch()
{
	var int nDocID;
	if(Lerne_Zweihand == FALSE)
	{
		B_RaiseFightTalent(self,NPC_TALENT_2H,5);
		PrintScreen(PRINT_Learn2H,-1,-1,FONT_Screen,2);
		Lerne_Zweihand = TRUE;
		Snd_Play("Levelup");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Двойные блоки");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Блокировка вражеского клинка при помощи двуручного оружия - прием, используемый сильными бойцами, позволяющий остановить атаку и заставить атакующего прервать свою комбинацию.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Результатом такого блока обычно является остановка противника, что дает возможность перехватить инициативу и нанести поражение врагу несколькими выверенными ударами.");
	Doc_Show(nDocID);
};

