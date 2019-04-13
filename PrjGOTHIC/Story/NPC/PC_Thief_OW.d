
instance PC_ThiefOW(Npc_Default)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 1;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_FollowDist] = 300;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Bow_M_03);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_03,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1;
};


func void Rtn_Start_1()
{
	TA_Sit_Bench(8,0,23,0,"LOCATION_02_05");
	TA_Sit_Bench(23,0,8,0,"LOCATION_02_05");
};

func void Rtn_Follow_1()
{
	TA_Follow_Player(8,0,23,0,"LOCATION_02_05");
	TA_Follow_Player(23,0,8,0,"LOCATION_02_05");
};

func void Rtn_Tot_1()
{
	TA_Sit_Bench(8,0,23,0,"TOT");
	TA_Sit_Bench(23,0,8,0,"TOT");
};

func void Rtn_Xardas_1()
{
	TA_Stand_Eating(8,0,23,0,"OW_PATH_129");
	TA_Stand_Eating(23,0,8,0,"OW_PATH_129");
};

func void Rtn_Fajeth_1()
{
	TA_Stand_Eating(8,0,23,0,"OW_ORC_LOOKOUT_2_03");
	TA_Stand_Eating(23,0,8,0,"OW_ORC_LOOKOUT_2_03");
};

func void Rtn_Silvestro_1()
{
	TA_Stand_Eating(8,0,23,0,"SPAWN_OW_SCAVENGER_01_DEMONT5");
	TA_Stand_Eating(23,0,8,0,"SPAWN_OW_SCAVENGER_01_DEMONT5");
};

func void Rtn_Grimes_1()
{
	TA_Smoke_Joint(8,0,23,0,"OW_PATH_155");
	TA_Smoke_Joint(23,0,8,0,"OW_PATH_155");
};

func void Rtn_Pass_1()
{
	TA_Sit_Campfire(8,0,23,0,"START");
	TA_Sit_Campfire(23,0,8,0,"START");
};

