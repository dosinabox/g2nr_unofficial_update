
instance BAU_953_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_OUT;
	id = 953;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart04,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_953;
};


func void Rtn_Start_953()
{
	TA_Pick_FP(8,5,12,5,"NW_FARM1_FIELD_03");
	TA_Pick_FP(12,5,15,5,"NW_FARM1_FIELD_06");
	TA_Pick_FP(15,5,18,5,"NW_FARM1_FIELD_03");
	TA_Pick_FP(18,5,22,5,"NW_FARM1_FIELD_06");
	TA_Sit_Campfire(22,5,8,5,"NW_FARM1_MILL_05");
};

func void Rtn_BugsThere_953()
{
	TA_Sit_Campfire(8,5,22,5,"NW_FARM1_MILL_05");
	TA_Sit_Campfire(22,5,8,5,"NW_FARM1_MILL_05");
};

