
instance STRF_1138_Addon_Sklave(Npc_Default)
{
	name[0] = NAME_Addon_Sklave;
	guild = GIL_STRF;
	id = 1138;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal01,BodyTex_P,ITAR_Slave);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_1138;
};


func void Rtn_Start_1138()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_PICK_03");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_PICK_03");
};

func void Rtn_Flucht_1138()
{
	TA_RunToWP(8,0,23,0,"SOME_WAYPOINT_18");
	TA_RunToWP(23,0,8,0,"SOME_WAYPOINT_18");
};

func void Rtn_TOT_1138()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

