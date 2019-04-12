
instance BDT_1085_Addon_Bloodwyn(Npc_Default)
{
	name[0] = "Бладвин";
	guild = GIL_BDT;
	id = 1085;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_StoryBandit] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	CreateInvItems(self,ITKE_Addon_Bloodwyn_01,1);
	CreateInvItems(self,ItMi_Addon_Bloodwyn_Kopf,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Bloodwyn,BodyTex_N,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_1085;
};


func void Rtn_Start_1085()
{
	TA_Stand_WP(8,0,16,0,"BL_RAVEN_09");
	TA_Stand_WP(16,0,8,0,"BL_RAVEN_09");
};

func void Rtn_Mine_1085()
{
	TA_Stand_WP(8,0,16,0,"ADW_MINE_TO_MC_01");
	TA_Stand_WP(16,0,8,0,"ADW_MINE_TO_MC_01");
};

func void Rtn_Gold_1085()
{
	TA_Stand_WP(8,0,16,0,"ADW_MINE_MC_07");
	TA_Stand_WP(16,0,8,0,"ADW_MINE_MC_07");
};

