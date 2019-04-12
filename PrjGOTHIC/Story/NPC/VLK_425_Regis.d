
instance VLK_425_Regis(Npc_Default)
{
	name[0] = "Регис";
	guild = GIL_VLK;
	id = 425;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mordrag,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_425;
};


func void Rtn_Start_425()
{
	TA_Sit_Bench(5,30,20,30,"NW_CITY_REGIS");
	TA_Smalltalk(20,30,0,30,"NW_CITY_MERCHANT_PATH_14_A");
	TA_Sit_Chair(0,30,5,30,"NW_CITY_TAVERN_IN_04");
};

