
instance PIR_1364_Addon_Pirat(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PIR;
	id = 1364;
	voice = 6;
	flags = FALSE;
	npcType = npctype_main;
	aivar[AIV_FollowDist] = 700;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dusty,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_1364;
};


func void Rtn_PreStart_1364()
{
	TA_Roast_Scavenger(8,0,20,0,"ADW_PIRATECAMP_SCAVENGER");
	TA_Roast_Scavenger(20,0,8,0,"ADW_PIRATECAMP_SCAVENGER");
};

func void Rtn_Start_1364()
{
	TA_Roast_Scavenger(7,35,16,35,"ADW_PIRATECAMP_SCAVENGER");
	TA_Stand_Drinking(16,35,17,35,"ADW_PIRATECAMP_BEACH_07");
	TA_Roast_Scavenger(17,35,20,35,"ADW_PIRATECAMP_SCAVENGER");
	TA_Stand_Drinking(20,35,7,35,"ADW_PIRATECAMP_BEACH_07");
};

func void Rtn_Follow_1364()
{
	TA_Follow_Player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

