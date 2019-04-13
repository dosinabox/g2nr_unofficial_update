
instance Mil_303_Torwache(Npc_Default)
{
	name[0] = "Стражник у двери";
	guild = GIL_MIL;
	id = 303;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Sly,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_303;
};


func void Rtn_Start_303()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITY_GUARDOFFICE_GUARD_02");
	TA_Guard_Passage(23,0,8,0,"NW_CITY_GUARDOFFICE_GUARD_02");
};

