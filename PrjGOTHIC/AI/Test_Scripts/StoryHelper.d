
instance SH(Npc_Default)
{
	name[0] = "Помощник по сюжету";
	guild = GIL_NONE;
	id = 9999;
	voice = 15;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_Sequel,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_9999;
};


func void Rtn_Start_9999()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,8,0,"XXX");
};


instance StoryHelper_EXIT(C_Info)
{
	npc = SH;
	nr = 999;
	condition = StoryHelper_EXIT_Condition;
	information = StoryHelper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int StoryHelper_EXIT_Condition()
{
	return TRUE;
};

func void StoryHelper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_Build_StoryPoints_Diag()
{
	Info_ClearChoices(DIA_StoryHelper_StoryPoints);
	Info_AddChoice(DIA_StoryHelper_StoryPoints,Dialog_Back,StoryHelper_StoryPoints_BACK);
	if(CurrentStoryPoint < SP_C6_P3)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C6_P3),StoryHelper_StoryPoints_SP_C6_P3);
	};
	if(CurrentStoryPoint < SP_C6_P2)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C6_P2),StoryHelper_StoryPoints_SP_C6_P2);
	};
	if(CurrentStoryPoint < SP_C6_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C6_P1),StoryHelper_StoryPoints_SP_C6_P1);
	};
	if(CurrentStoryPoint < SP_C5_P3)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C5_P3),StoryHelper_StoryPoints_SP_C5_P3);
	};
	if(CurrentStoryPoint < SP_C5_P2)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C5_P2),StoryHelper_StoryPoints_SP_C5_P2);
	};
	if(CurrentStoryPoint < SP_C5_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C5_P1),StoryHelper_StoryPoints_SP_C5_P1);
	};
	if(CurrentStoryPoint < SP_C4_P2)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C4_P2),StoryHelper_StoryPoints_SP_C4_P2);
	};
	if(CurrentStoryPoint < SP_C4_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C4_P1),StoryHelper_StoryPoints_SP_C4_P1);
	};
	if(CurrentStoryPoint < SP_C3_P3)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C3_P3),StoryHelper_StoryPoints_SP_C3_P3);
	};
	if(CurrentStoryPoint < SP_C3_P2)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C3_P2),StoryHelper_StoryPoints_SP_C3_P2);
	};
	if(CurrentStoryPoint < SP_C3_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C3_P1),StoryHelper_StoryPoints_SP_C3_P1);
	};
	if(CurrentStoryPoint < SP_C2_P2)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C2_P2),StoryHelper_StoryPoints_SP_C2_P2);
	};
	if(CurrentStoryPoint < SP_C2_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C2_P1),StoryHelper_StoryPoints_SP_C2_P1);
	};
	if(CurrentStoryPoint < SP_C1_P3)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C1_P3),StoryHelper_StoryPoints_SP_C1_P3);
	};
	if(CurrentStoryPoint < SP_C1_P2)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C1_P2),StoryHelper_StoryPoints_SP_C1_P2);
	};
	if(CurrentStoryPoint < SP_C1_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C1_P1),StoryHelper_StoryPoints_SP_C1_P1);
	};
};

func void StoryHelper_StoryPoints_SP_C1_P1()
{
	B_SetStoryPoint(SP_C1_P1);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C1_P2()
{
	B_SetStoryPoint(SP_C1_P2);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C1_P3()
{
	B_SetStoryPoint(SP_C1_P3);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C2_P1()
{
	B_SetStoryPoint(SP_C2_P1);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C2_P2()
{
	B_SetStoryPoint(SP_C2_P2);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C3_P1()
{
	B_SetStoryPoint(SP_C3_P1);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C3_P2()
{
	B_SetStoryPoint(SP_C3_P2);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C3_P3()
{
	B_SetStoryPoint(SP_C3_P3);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C4_P1()
{
	B_SetStoryPoint(SP_C4_P1);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C4_P2()
{
	B_SetStoryPoint(SP_C4_P2);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C5_P1()
{
	B_SetStoryPoint(SP_C5_P1);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C5_P2()
{
	B_SetStoryPoint(SP_C5_P2);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C5_P3()
{
	B_SetStoryPoint(SP_C5_P3);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C6_P1()
{
	B_SetStoryPoint(SP_C6_P1);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C6_P2()
{
	B_SetStoryPoint(SP_C6_P2);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_SP_C6_P3()
{
	B_SetStoryPoint(SP_C6_P3);
	B_Build_StoryPoints_Diag();
};

func void StoryHelper_StoryPoints_BACK()
{
	Info_ClearChoices(DIA_StoryHelper_StoryPoints);
};

instance DIA_StoryHelper_StoryPoints(C_Info)
{
	npc = SH;
	nr = 1;
	condition = DIA_StoryHelper_StoryPoints_Condition;
	information = DIA_StoryHelper_StoryPoints_Info;
	permanent = TRUE;
	description = "Перемотка основного сюжета";
};


func int DIA_StoryHelper_StoryPoints_Condition()
{
	return TRUE;
};

func void DIA_StoryHelper_StoryPoints_Info()
{
	B_Build_StoryPoints_Diag();
};


instance StoryHelper_PatchSettings(C_Info)
{
	npc = SH;
	nr = 995;
	condition = StoryHelper_PatchSettings_Condition;
	information = StoryHelper_PatchSettings_Info;
	permanent = TRUE;
	description = "Настройки неофициального обновления";
};


func int StoryHelper_PatchSettings_Condition()
{
	return TRUE;
};

func void StoryHelper_PatchSettings_Info()
{
	B_Build_Settings_Diag();
};


/*instance StoryHelper_INFO1(C_Info)
{
	npc = SH;
	nr = 1;
	condition = StoryHelper_INFO1_Condition;
	information = StoryHelper_INFO1_Info;
	permanent = TRUE;
	description = KapWechsel_1;
};


func int StoryHelper_INFO1_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void StoryHelper_INFO1_Info()
{
	Info_ClearChoices(StoryHelper_INFO1);
	Info_AddChoice(StoryHelper_INFO1,Dialog_Back,StoryHelper_BACK1);
	Info_AddChoice(StoryHelper_INFO1,KapAnfang,StoryHelper_KAPITEL1ANFANG);
	Info_AddChoice(StoryHelper_INFO1,"АДДОН Готов к первой встрече с Сатурасом (забыть о Ларесе)",StoryHelper_SATURAS);
	Info_AddChoice(StoryHelper_INFO1,"АДДОН Баг с Кавалорном",StoryHelper_Cavalorn);
};

func void StoryHelper_SATURAS()
{
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
	CreateInvItems(other,ItMi_Ornament_Addon,1);
	SC_KnowsRanger = TRUE;
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};

func void StoryHelper_Cavalorn()
{
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	//Получено письмо для Ватраса
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
	//Найден торговец, продававший оружие бандитам
	MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
	//Где же пропавшие люди?
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	//Кольцо колец :)
	CreateInvItems(hero,ItRi_Ranger_Addon,1);
	//Найти каменные круги
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;
	//...и Кавалорн отправился в один из них
	B_StartotherRoutine(Cavalorn,"ORNAMENTSTEINRING");
	//Игрок получил карту кругов
	CreateInvItems(hero,ItWr_Map_NewWorld_Ornaments_Addon,1);
	AI_StopProcessInfos(self);
};

func void StoryHelper_BACK1()
{
	Info_ClearChoices(StoryHelper_INFO1);
};

func void StoryHelper_KAPITEL1ANFANG()
{
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO2(C_Info)
{
	npc = SH;
	nr = 2;
	condition = StoryHelper_INFO2_Condition;
	information = StoryHelper_INFO2_Info;
	permanent = TRUE;
	description = KapWechsel_2;
};


func int StoryHelper_INFO2_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void StoryHelper_INFO2_Info()
{
	Info_ClearChoices(StoryHelper_INFO2);
	Info_AddChoice(StoryHelper_INFO2,Dialog_Back,StoryHelper_BACK2);
	Info_AddChoice(StoryHelper_INFO2,KapAnfang,StoryHelper_KAPITEL2ANFANG);
};

func void StoryHelper_BACK2()
{
	Info_ClearChoices(StoryHelper_INFO2);
};

func void StoryHelper_KAPITEL2ANFANG()
{
	Torwache_305.aivar[AIV_PASSGATE] = TRUE;
	MIL_305_schonmalreingelassen = TRUE;
	B_StartOtherRoutine(Lothar,"START");
	CreateInvItems(hero,ItKe_Pass_MIS,1);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel(2,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO2);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO3(C_Info)
{
	npc = SH;
	nr = 3;
	condition = StoryHelper_INFO3_Condition;
	information = StoryHelper_INFO3_Info;
	permanent = TRUE;
	description = KapWechsel_3;
};


func int StoryHelper_INFO3_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void StoryHelper_INFO3_Info()
{
	Info_ClearChoices(StoryHelper_INFO3);
	Info_AddChoice(StoryHelper_INFO3,Dialog_Back,StoryHelper_BACK3);
	Info_AddChoice(StoryHelper_INFO3,KapAnfang,StoryHelper_KAPITEL3ANFANG);
};

func void StoryHelper_BACK3()
{
	Info_ClearChoices(StoryHelper_INFO3);
};

func void StoryHelper_KAPITEL3ANFANG()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO3);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO4(C_Info)
{
	npc = SH;
	nr = 4;
	condition = StoryHelper_INFO4_Condition;
	information = StoryHelper_INFO4_Info;
	permanent = TRUE;
	description = KapWechsel_4;
};


func int StoryHelper_INFO4_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void StoryHelper_INFO4_Info()
{
	Info_ClearChoices(StoryHelper_INFO4);
	Info_AddChoice(StoryHelper_INFO4,Dialog_Back,StoryHelper_BACK4);
	Info_AddChoice(StoryHelper_INFO4,KapAnfang,StoryHelper_KAPITEL4ANFANG);
};

func void StoryHelper_BACK4()
{
	Info_ClearChoices(StoryHelper_INFO4);
};

func void StoryHelper_KAPITEL4ANFANG()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO4);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO5(C_Info)
{
	npc = SH;
	nr = 5;
	condition = StoryHelper_INFO5_Condition;
	information = StoryHelper_INFO5_Info;
	permanent = TRUE;
	description = KapWechsel_5;
};


func int StoryHelper_INFO5_Condition()
{
	if(Kapitel < 5)
	{
		return TRUE;
	};
};

func void StoryHelper_INFO5_Info()
{
	Info_ClearChoices(StoryHelper_INFO5);
	Info_AddChoice(StoryHelper_INFO5,Dialog_Back,StoryHelper_BACK5);
	Info_AddChoice(StoryHelper_INFO5,KapAnfang,StoryHelper_KAPITEL5ANFANG);
};

func void StoryHelper_BACK5()
{
	Info_ClearChoices(StoryHelper_INFO5);
};

func void StoryHelper_KAPITEL5ANFANG()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	CreateInvItems(hero,ItAt_IcedragonHeart,1);
	MIS_AllDragonsDead = TRUE;
	B_Kapitelwechsel(5,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO5);
	AI_StopProcessInfos(self);
};*/

