
instance PIR_1355_Addon_Skip(Npc_Default)
{
	name[0] = "Скип";
	guild = GIL_PIR;
	id = 1355;
	voice = 8;
	flags = FALSE;
	npcType = npctype_main;
	aivar[AIV_FollowDist] = 300;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ShortSword2);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItPo_Health_03,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Pirat01,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_PreStart_1355;
};


func void Rtn_PreStart_1355()
{
	TA_Stand_WP(8,0,21,0,"ADW_PIRATECAMP_HUT3_01");
	TA_Stand_WP(21,0,8,0,"ADW_PIRATECAMP_HUT3_01");
};

func void Rtn_Start_1355()
{
	TA_Stand_WP(7,30,11,30,"ADW_PIRATECAMP_HUT3_01");
	TA_Sit_Bench(11,30,20,30,"ADW_PIRATECAMP_HUT3_BENCH");
	TA_Sit_Campfire(20,30,1,30,"ADW_PIRATECAMP_BEACH_17");
	TA_Stand_Drinking(1,30,2,30,"ADW_PIRATECAMP_BEACH_17");
	TA_Sleep(2,30,7,30,"ADW_PIRATECAMP_HUT3_02");
};

func void Rtn_Follow_1355()
{
	TA_Follow_Player(8,0,20,0,"ADW_CANYON_TELEPORT_PATH_06");
	TA_Follow_Player(20,0,8,0,"ADW_CANYON_TELEPORT_PATH_06");
};

