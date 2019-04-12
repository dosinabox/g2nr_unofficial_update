
instance VLK_451_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 451;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Lefty,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_451;
};


func void Rtn_Start_451()
{
	TA_Smalltalk(6,10,13,0,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	TA_Smalltalk(13,0,14,2,"NW_CITY_MAINSTREET_05");
	TA_Smalltalk(14,2,17,0,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	TA_Smalltalk(17,0,18,2,"NW_CITY_MAINSTREET_05");
	TA_Smalltalk(18,2,20,10,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	TA_Sit_Chair(20,10,6,10,"NW_CITY_TAVERN_IN_05");
};

