
instance BAU_964_Bauer(Npc_Default)
{
	name[0] = "Фермер";
	guild = GIL_OUT;
	id = 964;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart11,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_964;
};


func void Rtn_Start_964()
{
	TA_Saw(8,0,21,0,"NW_FARM3_STABLE_OUT_01");
	TA_Sit_Campfire(21,0,8,0,"NW_FARM3_STABLE_REST_02");
};

func void Rtn_FleeFromPass_964()
{
	TA_Sit_Campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_05");
	TA_Sit_Campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_05");
};

