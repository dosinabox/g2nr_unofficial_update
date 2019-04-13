
instance Pal_287_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 287;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart09,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_287;
};


func void Rtn_Start_287()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_PALCAMP_08");
};

