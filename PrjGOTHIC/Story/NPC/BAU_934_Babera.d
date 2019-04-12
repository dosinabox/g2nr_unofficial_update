
instance BAU_934_Babera(Npc_Default)
{
	name[0] = "Бабера";
	guild = GIL_OUT;
	id = 934;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BauBlonde,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_934;
};


func void Rtn_Start_934()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM4_FIELD_01");
	TA_Sit_Campfire(22,0,8,0,"NW_FARM4_REST_02");
};

func void Rtn_FleeDMT_934()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM4_FIELD_01");
	TA_Pick_FP(22,0,8,0,"NW_FARM4_FIELD_01");
};

