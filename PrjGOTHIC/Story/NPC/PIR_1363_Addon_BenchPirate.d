
instance PIR_1363_Addon_Pirat(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PIR;
	id = 1363;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_FollowDist] = 600;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR2hSword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1363;
};


func void Rtn_Start_1363()
{
	TA_Sit_Bench(7,7,16,7,"ADW_PIRATECAMP_BENCH_01");
	TA_Smalltalk(16,7,20,3,"ADW_PIRATECAMP_CENTER");
	TA_Sit_Campfire(20,3,22,7,"WP_PIR_03");
	TA_Stand_Drinking(20,7,23,7,"WP_PIR_03");
	TA_Pee(23,7,23,12,"WP_PIR_03");
	TA_Sit_Campfire(23,12,2,7,"WP_PIR_03");
	TA_Stand_Drinking(2,7,3,7,"WP_PIR_03");
	TA_Sit_Campfire(3,7,7,7,"WP_PIR_03");
};

func void Rtn_Follow_1363()
{
	TA_Follow_Player(5,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player(20,0,5,0,"ADW_CANYON_TELEPORT_PATH_06");
};

