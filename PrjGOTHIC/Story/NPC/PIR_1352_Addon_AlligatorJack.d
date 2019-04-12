
instance PIR_1352_Addon_AlligatorJack(Npc_Default)
{
	name[0] = "Аллигатор Джек";
	guild = GIL_PIR;
	id = 1352;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_FollowDist] = 800;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	CreateInvItems(self,ItPo_Health_02,4);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_CorAngar,BodyTex_B,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_PreStart_1352;
};


func void Rtn_PreStart_1352()
{
	TA_Stand_Eating(5,0,20,0,"ADW_ENTRANCE_2_PIRATECAMP_01");
	TA_Stand_Eating(20,0,5,0,"ADW_ENTRANCE_2_PIRATECAMP_01");
};

func void Rtn_Start_1352()
{
	TA_Sleep(23,0,6,0,"ADW_PIRATECAMP_AJ_04");
	TA_Cook_Pan(6,0,8,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire(8,30,12,0,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed(12,30,19,0,"ADW_PIRATECAMP_WAY_07");
	TA_Cook_Pan(19,0,20,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire(20,30,23,0,"AD_PIRATECAMP_AJ_03");
};

func void Rtn_Hunt1_1352()
{
	TA_Guide_Player(1,0,13,0,"ADW_PIRATECAMP_WAY_16");
	TA_Guide_Player(13,0,1,0,"ADW_PIRATECAMP_WAY_16");
};

func void Rtn_Hunt2_1352()
{
	TA_Guide_Player(1,0,13,0,"ADW_PIRATECAMP_WATERHOLE_07");
	TA_Guide_Player(13,0,1,0,"ADW_PIRATECAMP_WATERHOLE_07");
};

func void Rtn_Hunt3_1352()
{
	TA_Guide_Player(1,0,13,0,"ADW_PIRATECAMP_WAY_16");
	TA_Guide_Player(13,0,1,0,"ADW_PIRATECAMP_WAY_16");
};

func void Rtn_Hunt4_1352()
{
	TA_Guide_Player(1,0,13,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Guide_Player(13,0,1,0,"ADW_CANYON_TELEPORT_PATH_06");
};

func void Rtn_PIRATECAMP_1352()
{
	TA_Guide_Player(1,0,13,0,"ADW_PIRATECAMP_WAY_07");
	TA_Guide_Player(13,0,1,0,"ADW_PIRATECAMP_WAY_07");
};

func void Rtn_GregIsBack_1352()
{
	TA_Sleep(3,0,6,0,"ADW_PIRATECAMP_AJ_04");
	TA_Cook_Pan(6,0,7,0,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed(7,0,10,0,"ADW_PIRATECAMP_WAY_07");
	TA_Sit_Campfire(10,0,11,0,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed(11,30,16,0,"ADW_PIRATECAMP_WAY_07");
	TA_Cook_Pan(16,0,17,0,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed(17,0,20,0,"ADW_PIRATECAMP_WAY_07");
	TA_Sit_Campfire(20,0,21,0,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed(21,0,0,0,"ADW_PIRATECAMP_WAY_07");
	TA_Sit_Campfire(0,0,1,0,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed(1,0,3,0,"ADW_PIRATECAMP_WAY_07");
};

func void Rtn_Follow_1352()
{
	TA_Follow_Player(5,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player(20,0,5,0,"ADW_CANYON_TELEPORT_PATH_06");
};

