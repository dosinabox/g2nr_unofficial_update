
instance KDF_511_Daron(Npc_Default)
{
	name[0] = "Дарон";
	guild = GIL_VLK;
	id = 511;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Raven,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_511;
};


func void Rtn_Start_511()
{
	TA_Stand_Guarding(7,35,11,35,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Stand_Eating(11,35,12,5,"NW_CITY_MERCHANT_PATH_28_F");
	TA_Stand_Guarding(12,5,12,35,"MARKT");
	TA_Stand_Drinking(12,35,13,5,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Eating(13,5,13,25,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_Guarding(13,25,13,55,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Stand_Guarding(13,55,18,5,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Stand_Drinking(18,5,19,5,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Guarding(19,5,20,5,"NW_CITY_MERCHANT_PATH_29_B");
	TA_Sit_Throne(20,5,1,5,"NW_CITY_BED_ZURIS");
	TA_Sleep(1,5,7,35,"NW_CITY_BED_DARON");
};

