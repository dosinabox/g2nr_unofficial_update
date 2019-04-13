
instance Mil_329_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 329;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_329;
};


func void Rtn_Start_329()
{
	TA_Practice_Sword(7,0,20,58,"NW_CITY_HABOUR_KASERN_CENTRE_02");
	TA_Smalltalk(20,58,0,0,"NW_CITY_KASERN_BARRACK02_03");
	TA_Sleep(0,0,7,0,"NW_CITY_BARRACK01_BED_07");
};

