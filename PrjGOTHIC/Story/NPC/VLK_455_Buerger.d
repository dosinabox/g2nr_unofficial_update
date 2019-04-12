
instance VLK_455_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 455;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart06,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_455;
};


func void Rtn_Start_455()
{
	TA_Stand_ArmsCrossed(5,20,20,20,"NW_CITY_MERCHANT_PATH_14_C");
	TA_Smalltalk(20,20,5,20,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
};

func void Rtn_VatrasAway_455()
{
	TA_Sit_Bench(7,20,20,20,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Smalltalk(20,20,7,20,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
};

