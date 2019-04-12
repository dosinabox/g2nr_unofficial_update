
instance PIR_1366_Addon_Brandon(Npc_Default)
{
	name[0] = "Брэндон";
	guild = GIL_PIR;
	id = 1366;
	voice = 4;
	flags = FALSE;
	npcType = npctype_main;
	aivar[AIV_FollowDist] = 400;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hAxe);
	CreateInvItems(self,ItPo_Health_03,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Tough_Okyl,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1366;
};


func void Rtn_Start_1366()
{
	TA_Smalltalk(7,3,21,3,"ADW_PIRATECAMP_BEACH_06");
	TA_Stand_Drinking(21,3,22,3,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire(22,3,1,3,"ADW_PIRATECAMP_BEACH_18");
	TA_Stand_Drinking(1,3,3,3,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire(3,3,4,3,"ADW_PIRATECAMP_BEACH_18");
	TA_Pee(4,3,4,9,"ADW_PIRATECAMP_BEACH_18");
	TA_Stand_Drinking(4,9,4,14,"ADW_PIRATECAMP_BEACH_18");
	TA_Sit_Campfire(4,14,7,3,"ADW_PIRATECAMP_BEACH_18");
};

func void Rtn_Follow_1366()
{
	TA_Follow_Player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

