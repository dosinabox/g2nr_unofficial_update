
instance VLK_471_Edda(Npc_Default)
{
	name[0] = "Ýההא";
	guild = GIL_VLK;
	id = 471;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe.",FaceBabe_B_RedLocks,BodyTex_B,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_471;
};


func void Rtn_Start_471()
{
	TA_Cook_Cauldron(8,0,22,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Cook_Cauldron(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};

