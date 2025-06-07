
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
	/*if(CurrentStoryPoint < SP_C1_P1)
	{
		Info_AddChoice(DIA_StoryHelper_StoryPoints,B_GetStoryPointName(SP_C1_P1),StoryHelper_StoryPoints_SP_C1_P1);
	};*/
};

/*func void StoryHelper_StoryPoints_SP_C1_P1()
{
	B_SetStoryPoint(SP_C1_P1);
	B_Build_StoryPoints_Diag();
};*/

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

func void B_Build_AddonStoryPoints_Diag()
{
	Info_ClearChoices(DIA_StoryHelper_AddonStoryPoints);
	Info_AddChoice(DIA_StoryHelper_AddonStoryPoints,Dialog_Back,StoryHelper_AddonStoryPoints_BACK);
	if(CurrentAddonStoryPoint < SP_A5)
	{
		Info_AddChoice(DIA_StoryHelper_AddonStoryPoints,B_GetAddonStoryPointName(SP_A5),StoryHelper_AddonStoryPoints_SP_A5);
	};
	if(CurrentAddonStoryPoint < SP_A4)
	{
		Info_AddChoice(DIA_StoryHelper_AddonStoryPoints,B_GetAddonStoryPointName(SP_A4),StoryHelper_AddonStoryPoints_SP_A4);
	};
	if(CurrentAddonStoryPoint < SP_A3)
	{
		Info_AddChoice(DIA_StoryHelper_AddonStoryPoints,B_GetAddonStoryPointName(SP_A3),StoryHelper_AddonStoryPoints_SP_A3);
	};
	if(CurrentAddonStoryPoint < SP_A2)
	{
		Info_AddChoice(DIA_StoryHelper_AddonStoryPoints,B_GetAddonStoryPointName(SP_A2),StoryHelper_AddonStoryPoints_SP_A2);
	};
	if(STORYPOINT_ADDON[SP_A1] == FALSE)
	{
		Info_AddChoice(DIA_StoryHelper_AddonStoryPoints,B_GetAddonStoryPointName(SP_A1),StoryHelper_AddonStoryPoints_SP_A1);
	};
};

func void StoryHelper_AddonStoryPoints_SP_A1()
{
	B_SetAddonStoryPoint(SP_A1);
	B_Build_AddonStoryPoints_Diag();
};

func void StoryHelper_AddonStoryPoints_SP_A2()
{
	B_SetAddonStoryPoint(SP_A2);
	B_Build_AddonStoryPoints_Diag();
};

func void StoryHelper_AddonStoryPoints_SP_A3()
{
	B_SetAddonStoryPoint(SP_A3);
	B_Build_AddonStoryPoints_Diag();
};

func void StoryHelper_AddonStoryPoints_SP_A4()
{
	B_SetAddonStoryPoint(SP_A4);
	B_Build_AddonStoryPoints_Diag();
};

func void StoryHelper_AddonStoryPoints_SP_A5()
{
	B_SetAddonStoryPoint(SP_A5);
	B_Build_AddonStoryPoints_Diag();
};

func void StoryHelper_AddonStoryPoints_BACK()
{
	Info_ClearChoices(DIA_StoryHelper_AddonStoryPoints);
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
	if(STORYPOINT[SP_C1_P1] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_StoryHelper_StoryPoints_Info()
{
	B_Build_StoryPoints_Diag();
};


instance DIA_StoryHelper_AddonStoryPoints(C_Info)
{
	npc = SH;
	nr = 2;
	condition = DIA_StoryHelper_AddonStoryPoints_Condition;
	information = DIA_StoryHelper_AddonStoryPoints_Info;
	permanent = TRUE;
	description = "Перемотка сюжета аддона";
};


func int DIA_StoryHelper_AddonStoryPoints_Condition()
{
	if(STORYPOINT[SP_C1_P1] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_StoryHelper_AddonStoryPoints_Info()
{
	B_Build_AddonStoryPoints_Diag();
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

