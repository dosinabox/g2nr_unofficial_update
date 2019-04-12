
instance VLK_486_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 486;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Lilo,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_486;
};


func void Rtn_Start_486()
{
	TA_Stand_ArmsCrossed(5,30,6,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Smalltalk(6,0,8,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_ArmsCrossed(8,0,9,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Smalltalk(9,0,11,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_ArmsCrossed(11,0,12,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Smalltalk(12,0,14,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_ArmsCrossed(14,0,15,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Smalltalk(15,0,17,0,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_ArmsCrossed(17,0,17,30,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Cook_Stove(17,30,20,0,"NW_CITY_ZURIS_FRAU_COOK");
	TA_Sit_Chair(20,0,23,30,"NW_CITY_MERCHANT_HUT_02_IN_02");
	TA_Sleep(23,30,5,30,"NW_CITY_BED_ZURIS_FRAU");
};

