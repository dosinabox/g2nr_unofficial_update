
instance Sld_803_Cipher(Npc_Default)
{
	name[0] = "Сифер";
	guild = GIL_SLD;
	id = 803;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItRw_Arrow,50);
	CreateInvItems(self,ItRw_Bow_L_02,1);
	CreateInvItems(self,ItRw_Sld_Bow,1);
	CreateInvItems(self,ItMw_2H_OrcAxe_01,1);
	CreateInvItems(self,ItLsTorch,8);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_803;
};


func void Rtn_Start_803()
{
	TA_Smalltalk(7,35,23,35,"NW_BIGFARM_PATH_04_1");
	TA_Sleep(23,35,7,35,"NW_BIGFARM_HOUSE_SLD_SLEEP");
};

func void Rtn_Tot_803()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

