
instance SLD_801_Torlof(Npc_Default)
{
	name[0] = "Торлоф";
	guild = GIL_SLD;
	id = 801;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Torlof,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_PreStart_801;
};


func void Rtn_PreStart_801()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BIGFARM_TORLOF");
	TA_Stand_Guarding(22,0,8,0,"NW_BIGFARM_TORLOF");
};

func void Rtn_Start_801()
{
	TA_Stand_Guarding(8,0,19,0,"NW_BIGFARM_TORLOF");
	TA_Sit_Chair(19,0,23,0,"NW_BIGFARM_HOUSE_UP2_07");
	TA_Sleep(23,0,8,0,"NW_BIGFARM_HOUSE_UP2_02");
};

func void Rtn_WaitForShipCaptain_801()
{
	TA_Sit_Bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	TA_Sit_Bench(20,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void Rtn_AllOnBoard_801()
{
	TA_Stand_WP(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

