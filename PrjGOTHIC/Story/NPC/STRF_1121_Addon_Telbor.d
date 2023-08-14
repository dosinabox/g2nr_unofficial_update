
instance STRF_1121_Addon_Telbor(Npc_Default)
{
	name[0] = "Телбор";
	guild = GIL_STRF;
	id = 1121;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal01,BodyTex_B,ITAR_Slave);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1121;
};


func void Rtn_Start_1121()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_LAGER_SIDE_PICK_02");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_LAGER_SIDE_PICK_02");
};

func void Rtn_Flucht_1121()
{
	TA_RunToWP(8,0,23,0,"SOME_WAYPOINT_09");
	TA_RunToWP(23,0,8,0,"SOME_WAYPOINT_09");
};

func void rtn_tot_1121()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

