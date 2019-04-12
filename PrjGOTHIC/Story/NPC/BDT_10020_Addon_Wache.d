
instance BDT_10020_Addon_Wache(Npc_Default)
{
	name[0] = NAME_Addon_Guard;
	guild = GIL_BDT;
	id = 10020;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart21,BodyTex_N,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10020;
};


func void Rtn_Start_10020()
{
	TA_Stand_Guarding(0,0,1,0,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding(1,0,2,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP(2,0,3,0,"BL_UP_PLACE_06");
	TA_Stand_WP(3,0,4,0,"BL_UP_CHECK");
	TA_Stand_Guarding(4,0,5,0,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding(5,0,6,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP(6,0,7,0,"BL_UP_PLACE_06");
	TA_Stand_WP(7,0,8,0,"BL_UP_CHECK");
	TA_Stand_Guarding(8,0,9,0,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding(9,0,10,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP(10,0,11,0,"BL_UP_PLACE_06");
	TA_Stand_WP(11,0,12,0,"BL_UP_CHECK");
	TA_Stand_Guarding(12,0,13,0,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding(13,0,14,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP(14,0,15,0,"BL_UP_PLACE_06");
	TA_Stand_WP(15,0,16,0,"BL_UP_CHECK");
	TA_Stand_Guarding(16,0,17,0,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding(17,0,18,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP(18,0,19,0,"BL_UP_PLACE_06");
	TA_Stand_WP(19,0,20,0,"BL_UP_CHECK");
	TA_Stand_Guarding(20,0,21,0,"BL_RAVEN_GUARD_03");
	TA_Stand_Guarding(21,0,22,0,"BL_MINE_ENTRANCE_GUARD_SCATTY");
	TA_Stand_WP(22,0,23,0,"BL_UP_PLACE_06");
	TA_Stand_WP(23,0,0,0,"BL_UP_CHECK");
};

