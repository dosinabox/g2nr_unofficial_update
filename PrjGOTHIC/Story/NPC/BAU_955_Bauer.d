
instance BAU_955_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_OUT;
	id = 955;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal06,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_955;
};


func void Rtn_Start_955()
{
	TA_Pick_FP(8,10,12,10,"NW_FARM1_FIELD_07");
	TA_Pick_FP(12,10,15,10,"NW_FARM1_FIELD_02");
	TA_Pick_FP(15,10,18,10,"NW_FARM1_FIELD_07");
	TA_Pick_FP(18,10,22,10,"NW_FARM1_FIELD_02");
	TA_Sit_Campfire(22,10,8,10,"NW_FARM1_MILL_05");
};

func void Rtn_BugsThere_955()
{
	TA_Sit_Campfire(8,10,22,10,"NW_FARM1_MILL_05");
	TA_Sit_Campfire(22,10,8,10,"NW_FARM1_MILL_05");
};

