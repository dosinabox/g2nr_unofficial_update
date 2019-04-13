
instance Sld_807_Bullco(Npc_Default)
{
	name[0] = "Булко";
	guild = GIL_SLD;
	id = 807;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Olli_Kahn,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_807;
};


func void Rtn_Start_807()
{
	TA_Sit_Chair(8,0,22,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_KITCHEN_SYLVIO");
};

func void Rtn_Pee_807()
{
	TA_Pee(8,0,8,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(8,15,10,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(10,0,10,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(10,15,12,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(12,0,12,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(12,15,14,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(14,0,14,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(14,15,16,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(16,0,16,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(16,15,18,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(18,0,18,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(18,15,20,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(20,0,20,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(20,15,8,0,"NW_BIGFARM_KITCHEN_SYLVIO");
};

func void Rtn_Tot_807()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

