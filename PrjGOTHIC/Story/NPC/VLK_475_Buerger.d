
instance VLK_475_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 475;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_475;
};


func void Rtn_Start_475()
{
	TA_Stand_ArmsCrossed(10,55,18,50,"NW_CITY_WATCH_FIGHT_02");
	TA_Smalltalk(18,50,3,5,"NW_CITY_HABOUR_04");
	TA_Stand_Drinking(3,5,5,5,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Smalltalk(5,5,10,5,"NW_CITY_HABOUR_POOR_AREA_01");
};

