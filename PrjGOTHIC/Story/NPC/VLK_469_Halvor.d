
instance VLK_469_Halvor(Npc_Default)
{
	name[0] = "Халвор";
	guild = GIL_VLK;
	id = 469;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Mace_L_03);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart11,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_469;
};


func void Rtn_Start_469()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
	TA_Stand_Drinking(20,0,1,0,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Sleep(1,0,5,0,"NW_CITY_BED_HALVOR");
};

func void Rtn_Prison_469()
{
	TA_Sit_Campfire(8,0,22,0,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Sit_Campfire(22,0,8,0,"NW_CITY_HABOUR_KASERN_HALVOR");
};

