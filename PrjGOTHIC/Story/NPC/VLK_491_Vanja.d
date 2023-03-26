
instance VLK_491_Vanja(Npc_Default)
{
	name[0] = "Ваня";
	guild = GIL_VLK;
	id = 491;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,20,ItMi_Gold,10);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_B_RedLocks,BodyTexBabe_B,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_491;
};


func void Rtn_Start_491()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	TA_Smalltalk(23,0,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

func void Rtn_Alone_491()
{
	TA_Stand_Sweeping(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	TA_Sleep(23,0,8,0,"NW_CITY_HABOUR_PUFF_PECK");
};

