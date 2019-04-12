
instance VLK_466_Gernod(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 466;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Ulbert,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_466;
};


func void Rtn_Start_466()
{
	TA_Sit_Bench(6,5,15,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Stand_Drinking(15,0,18,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Sit_Bench(18,0,21,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Stand_Drinking(21,0,1,10,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Sleep(1,10,6,5,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};

