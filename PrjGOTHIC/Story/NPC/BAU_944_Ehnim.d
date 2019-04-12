
instance BAU_944_Ehnim(Npc_Default)
{
	name[0] = "Ёним";
	guild = GIL_OUT;
	id = 944;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal03,BodyTex_P,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_944;
};


func void Rtn_Start_944()
{
	TA_Rake_FP(5,0,12,0,"NW_FARM2_FIELD_03");
	TA_Sit_Campfire(12,0,14,0,"NW_FARM2_FIELD_03_B");
	TA_Rake_FP(14,0,21,0,"NW_FARM2_FIELD_03");
	TA_Sit_Campfire(21,0,5,0,"NW_FARM2_OUT_03");
};

