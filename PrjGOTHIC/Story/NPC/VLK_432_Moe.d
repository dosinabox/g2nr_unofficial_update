
instance VLK_432_Moe(Npc_Default)
{
	name[0] = "Мо";
	guild = GIL_NONE;
	id = 432;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Scar,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_432;
};


func void Rtn_Start_432()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_PATH_HABOUR_02_02");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_PATH_HABOUR_02_02");
};

