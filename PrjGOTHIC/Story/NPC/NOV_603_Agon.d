
instance NOV_603_Agon(Npc_Default)
{
	name[0] = "Агон";
	guild = GIL_NOV;
	id = 603;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal01,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_603;
};


func void Rtn_Start_603()
{
	TA_Rake_FP(8,0,9,0,"NW_MONASTERY_HERB_05");
	TA_Pray_Innos_FP(9,0,10,0,"NW_MONASTERY_CHURCH_03");
	TA_Rake_FP(10,0,22,10,"NW_MONASTERY_HERB_05");
	TA_Sleep(22,10,8,0,"NW_MONASTERY_NOVICE03_07");
};

func void Rtn_GolemLives_603()
{
	TA_Stand_Guarding(8,0,23,10,"NW_TROLLAREA_PATH_02");
	TA_Stand_Guarding(23,10,8,0,"NW_TROLLAREA_PATH_02");
};

func void Rtn_GolemDead_603()
{
	TA_Stand_Guarding(8,0,23,10,"NW_MAGECAVE_RUNE");
	TA_Stand_Guarding(23,10,8,0,"NW_MAGECAVE_RUNE");
};

func void Rtn_StillAlive_603()
{
	TA_Stand_Guarding(8,0,23,10,"TAVERN");
	TA_Stand_Guarding(23,10,8,0,"TAVERN");
};

