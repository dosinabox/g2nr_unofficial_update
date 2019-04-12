
instance VLK_473_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 473;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_473;
};


func void Rtn_Start_473()
{
	TA_Smalltalk(5,5,12,30,"NW_CITY_HABOUR_PUFF_02");
	TA_Smalltalk(12,30,18,5,"NW_CITY_WAY_TO_SHIP_01");
	TA_Stand_Sweeping(18,5,22,5,"NW_CITY_HABOUR_POOR_AREA_HUT_01_IN");
	TA_Sleep(22,5,5,5,"NW_CITY_HABOUR_POOR_AREA_HUT_01_BED_01");
};

