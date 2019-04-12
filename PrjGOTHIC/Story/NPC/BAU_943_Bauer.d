
instance BAU_943_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_OUT;
	id = 943;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_943;
};


func void Rtn_Start_943()
{
	TA_Rake_FP(5,0,12,0,"NW_FARM2_FIELD_05");
	TA_Sit_Campfire(12,0,14,0,"NW_FARM2_FIELD_04_C");
	TA_Rake_FP(14,0,20,52,"NW_FARM2_FIELD_05");
	TA_Sit_Campfire(20,52,5,0,"NW_FARM2_OUT_09");
};

