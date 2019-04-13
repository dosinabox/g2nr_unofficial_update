
instance MIL_312_Wulfgar(Npc_Default)
{
	name[0] = "Âףכüפדאנ";
	guild = GIL_MIL;
	id = 312;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart06,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_PreStart_312;
};


func void Rtn_PreStart_312()
{
	TA_Stand_ArmsCrossed(6,55,21,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Sit_Throne(21,0,5,0,"NW_CITY_KASERN_BARRACK02_02");
	TA_Practice_Sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};

func void Rtn_Start_312()
{
	TA_Stand_ArmsCrossed(6,55,21,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	TA_Sit_Throne(21,0,0,7,"NW_CITY_KASERN_BARRACK02_02");
	TA_Smalltalk(0,7,5,0,"NW_CITY_HABOUR_KASERN_OFFICE");
	TA_Practice_Sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};

