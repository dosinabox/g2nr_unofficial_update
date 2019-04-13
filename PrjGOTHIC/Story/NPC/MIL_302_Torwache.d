
instance Mil_302_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_MIL;
	id = 302;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal05,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_302;
};


func void Rtn_Start_302()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITY_GUARDOFFICE_GUARD_01");
	TA_Guard_Passage(23,0,8,0,"NW_CITY_GUARDOFFICE_GUARD_01");
};

