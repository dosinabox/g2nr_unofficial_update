
instance Mil_320_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 320;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Drax,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_320;
};


func void Rtn_Start_320()
{
	TA_Stand_Guarding(5,0,20,15,"NW_CITY_MERCHANT_PATH_27");
	TA_Stand_Guarding(20,15,22,15,"NW_CITY_MERCHANT_PATH_36");
	TA_Stand_Guarding(22,15,0,15,"NW_CITY_MERCHANT_PATH_27");
	TA_Stand_Guarding(0,15,2,15,"NW_CITY_MERCHANT_PATH_36");
	TA_Stand_Guarding(2,15,4,15,"NW_CITY_MERCHANT_PATH_27");
	TA_Stand_Guarding(4,15,5,0,"NW_CITY_MERCHANT_PATH_36");
};

