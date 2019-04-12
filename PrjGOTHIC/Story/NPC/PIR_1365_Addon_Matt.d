
instance PIR_1365_Addon_Matt(Npc_Default)
{
	name[0] = "Матт";
	guild = GIL_PIR;
	id = 1365;
	voice = 10;
	flags = FALSE;
	npcType = npctype_main;
	aivar[AIV_FollowDist] = 500;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal14,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1365;
};


func void Rtn_Start_1365()
{
	TA_Smalltalk(7,5,16,5,"ADW_PIRATECAMP_BEACH_11");
	TA_Stand_Drinking(16,5,20,5,"ADW_PIRATECAMP_BEACH_11");
	TA_Smalltalk(20,5,21,5,"ADW_PIRATECAMP_BEACH_11");
	TA_Stand_Drinking(21,5,7,5,"ADW_PIRATECAMP_BEACH_11");
};

func void Rtn_Follow_1365()
{
	TA_Follow_Player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

