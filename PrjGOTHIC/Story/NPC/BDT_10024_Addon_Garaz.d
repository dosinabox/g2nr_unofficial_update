
instance BDT_10024_Addon_Garaz(Npc_Default)
{
	name[0] = "Гараз";
	guild = GIL_BDT;
	id = 10024;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal16,BodyTex_N,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10024;
};


func void Rtn_Start_10024()
{
	TA_Stand_Guarding(6,0,12,0,"ADW_MINE_TO_MC_04");
	TA_Stand_Guarding(12,0,6,0,"ADW_MINE_TO_MC_04");
};

func void Rtn_Attack_10024()
{
	TA_Guide_Player(6,0,12,0,"ADW_MINE_MC_07");
	TA_Guide_Player(12,0,6,0,"ADW_MINE_MC_07");
};

func void Rtn_Gold_10024()
{
	TA_Stand_Guarding(6,0,12,0,"ADW_MINE_MC_GARAZ");
	TA_Stand_Guarding(12,0,6,0,"ADW_MINE_MC_GARAZ");
};

