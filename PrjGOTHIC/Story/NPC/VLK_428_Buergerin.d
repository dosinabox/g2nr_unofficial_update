
instance VLK_428_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 428;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe4",FaceBabe_N_VlkBlonde,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_428;
};


func void Rtn_Start_428()
{
	TA_Stand_ArmsCrossed(5,10,20,17,"NW_CITY_MERCHANT_PATH_14_C");
	TA_Smalltalk(20,17,5,10,"NW_CITY_MERCHANT_PATH_32");
};

func void Rtn_VatrasAway_428()
{
	TA_Smalltalk(5,10,20,17,"NW_CITY_MERCHANT_PATH_14_A");
	TA_Smalltalk(20,17,5,10,"NW_CITY_MERCHANT_PATH_32");
};

