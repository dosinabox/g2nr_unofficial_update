
instance BAU_914_Baeuerin(Npc_Default)
{
	name[0] = NAME_Magd;
	guild = GIL_BAU;
	id = 914;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_914;
};


func void Rtn_Start_914()
{
	TA_Cook_Stove(7,0,20,0,"NW_BIGFARM_HOUSE_UP1_COOK");
	TA_Stand_Eating(20,0,7,0,"NW_BIGFARM_STABLE_05");
};

