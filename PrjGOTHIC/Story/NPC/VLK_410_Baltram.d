
instance VLK_410_Baltram(Npc_Default)
{
	name[0] = "Áאכüענאל";
	guild = GIL_VLK;
	id = 410;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsRanger] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_ShortSword2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Markus_Kark,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_410;
};


func void Rtn_Start_410()
{
	TA_Stand_ArmsCrossed(5,5,20,5,"NW_CITY_ZURIS");
	TA_Smalltalk(20,5,0,5,"NW_CITY_BEER_05");
	TA_Sleep(0,5,5,5,"NW_CITY_HOTEL_BED_02");
};

