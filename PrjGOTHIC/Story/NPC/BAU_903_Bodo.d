
instance Bau_903_Bodo(Npc_Default)
{
	name[0] = "Бодо";
	guild = GIL_BAU;
	id = 903;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal16,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_903;
};


func void Rtn_Start_903()
{
	TA_Smalltalk(7,45,21,45,"NW_BIGFARM_HOUSE_OUT_04");
	TA_Sit_Bench(21,45,7,45,"NW_BIGFARM_PATH_03");
};

