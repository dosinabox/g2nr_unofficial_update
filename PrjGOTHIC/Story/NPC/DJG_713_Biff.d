
instance DJG_713_Biff(Npc_Default)
{
	name[0] = "¡ËÙÙ";
	guild = GIL_DJG;
	id = 713;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,4);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_DJG_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PreStart_713;
};


func void Rtn_PreStart_713()
{
	TA_Smalltalk(8,0,23,0,"OW_DJG_STARTCAMP_01");
	TA_Smalltalk(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void Rtn_Start_713()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_DJG_STARTCAMP_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void Rtn_Follow_713()
{
	TA_Follow_Player(8,0,23,0,"OW_DJG_STARTCAMP_01");
	TA_Follow_Player(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void Rtn_Stay_Swamp_713()
{
	TA_Stand_Guarding(8,0,23,0,"SWAMPDRAGON");
	TA_Stand_Guarding(23,0,8,0,"SWAMPDRAGON");
};

func void Rtn_Stay_Rock_713()
{
	TA_Stand_Guarding(8,0,23,0,"LOCATION_19_01");
	TA_Stand_Guarding(23,0,8,0,"LOCATION_19_01");
};

func void Rtn_Stay_Fire_713()
{
	TA_Stand_Guarding(8,0,23,0,"CASTLE_14");
	TA_Stand_Guarding(23,0,8,0,"CASTLE_14");
};

func void Rtn_Stay_Ice_713()
{
	TA_Stand_Guarding(8,0,23,0,"OW_ICEDRAGON_09");
	TA_Stand_Guarding(23,0,8,0,"OW_ICEDRAGON_09");
};

func void Rtn_Stay_AwayFromOC_713()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_298");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_298");
};

func void Rtn_RunsToPass_713()
{
	TA_RunToWP(8,0,23,0,"START");
	TA_RunToWP(23,0,8,0,"START");
};

func void rtn_tot_713()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

