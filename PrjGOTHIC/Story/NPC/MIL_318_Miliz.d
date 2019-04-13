
instance Mil_318_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 318;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart16,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_318;
};


func void Rtn_Start_318()
{
	TA_Stand_Guarding(6,45,21,5,"NW_CITY_HABOUR_KASERN_OFFICE");
	TA_Smalltalk(21,5,23,59,"NW_CITY_HABOUR_KASERN_BARRACK02_IN");
	TA_Sleep(23,59,6,45,"NW_CITY_BARRACK02_BED_WULFGAR");
};

