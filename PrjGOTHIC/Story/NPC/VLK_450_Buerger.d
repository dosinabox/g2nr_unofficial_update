
instance VLK_450_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 450;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_450;
};


func void Rtn_Start_450()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_CITY_MERCHANT_PATH_15");
	TA_Smalltalk(20,0,3,50,"NW_CITY_MERCHANT_STAND_01");
	TA_Smalltalk(3,50,5,0,"NW_CITY_TAVERN_IN_06");
};

func void Rtn_VatrasAway_450()
{
	TA_Smalltalk(5,0,20,0,"NW_CITY_MERCHANT_PATH_14");
	TA_Smalltalk(20,0,5,0,"NW_CITY_MERCHANT_STAND_01");
};

