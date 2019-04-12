
instance BAU_938_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_OUT;
	id = 938;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Orry,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_938;
};


func void Rtn_Start_938()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM4_FIELD_02");
	TA_Sit_Campfire(22,0,8,0,"NW_FARM4_REST_01");
};

func void Rtn_FleeDMT_938()
{
	TA_Rake_FP(8,0,22,0,"NW_FARM4_FIELD_02");
	TA_Rake_FP(22,0,8,0,"NW_FARM4_FIELD_02");
};

