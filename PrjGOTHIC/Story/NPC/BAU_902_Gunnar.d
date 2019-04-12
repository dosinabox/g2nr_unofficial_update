
instance BAU_902_Gunnar(Npc_Default)
{
	name[0] = "Гуннар";
	guild = GIL_BAU;
	id = 902;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart03,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_902;
};


func void Rtn_Start_902()
{
	TA_Smalltalk(8,0,19,59,"NW_BIGFARM_STABLE_OUT_01");
	TA_Sit_Chair(19,59,8,0,"NW_BIGFARM_STABLE_06");
};

