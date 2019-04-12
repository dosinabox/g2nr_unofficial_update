
instance BAU_933_Rega(Npc_Default)
{
	name[0] = "ахур";
	guild = GIL_OUT;
	id = 933;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_OldBlonde,BodyTexBabe_N,ITAR_BauBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_933;
};


func void Rtn_Start_933()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM4_FIELD_02");
	TA_Sit_Campfire(22,0,8,0,"NW_FARM4_REST_02");
};

func void Rtn_FleeDMT_933()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM4_FIELD_02");
	TA_Pick_FP(22,0,8,0,"NW_FARM4_FIELD_02");
};

