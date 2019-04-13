
instance BDT_10016_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10016;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_TAL_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Fingers,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10016;
};


func void Rtn_Start_10016()
{
	TA_Sit_Chair(2,0,10,0,"ADW_SENAT_CAVE_CHAIR");
	TA_Sit_Chair(10,0,2,0,"ADW_SENAT_CAVE_CHAIR");
};

func void Rtn_Stand_10016()
{
	TA_Stand_WP(2,0,10,0,"ADW_SENAT_CAVE_CHAIR");
	TA_Stand_WP(10,0,2,0,"ADW_SENAT_CAVE_CHAIR");
};

