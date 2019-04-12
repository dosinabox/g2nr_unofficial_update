
instance BAU_945_Egill(Npc_Default)
{
	name[0] = "Ёгилл";
	guild = GIL_OUT;
	id = 945;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_Normal03,BodyTex_P,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_945;
};


func void Rtn_Start_945()
{
	TA_Pick_FP(5,0,21,0,"NW_FARM2_FIELD_02");
	TA_Stand_Drinking(21,0,0,2,"NW_FARM2_OUT_10");
	TA_Sit_Bench(0,2,5,0,"NW_FARM2_OUT_06");
};

