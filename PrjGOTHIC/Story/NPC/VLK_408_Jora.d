
instance VLK_408_Jora(Npc_Default)
{
	name[0] = "Джора";
	guild = GIL_VLK;
	id = 408;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_AlriksSword_Mis);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_408;
};


func void Rtn_Start_408()
{
	TA_Stand_ArmsCrossed(5,15,20,4,"NW_CITY_MERCHANT_PATH_38");
	TA_Smalltalk(20,4,0,6,"NW_CITY_BEER_06");
	TA_Sleep(0,6,5,15,"NW_CITY_HOTEL_BED_03");
};

