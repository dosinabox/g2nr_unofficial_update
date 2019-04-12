
instance VLK_426_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 426;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_426;
};


func void Rtn_Start_426()
{
	TA_Stand_ArmsCrossed(5,5,20,5,"NW_CITY_MERCHANT_PATH_15");
	TA_Smalltalk(20,5,3,55,"NW_CITY_MERCHANT_TAVERN01_01");
	TA_Smalltalk(3,55,5,5,"NW_CITY_TAVERN_IN_05");
};

func void Rtn_VatrasAway_426()
{
	TA_Smalltalk(5,5,20,0,"NW_CITY_MERCHANT_STAND_01");
	TA_Smalltalk(20,0,5,5,"NW_CITY_MERCHANT_TAVERN01_01");
};

