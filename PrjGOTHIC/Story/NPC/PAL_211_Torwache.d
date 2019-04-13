
instance Pal_211_Torwache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 211;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Wolf,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_211;
};


func void Rtn_Start_211()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_CITYHALL_WARROOM_04");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_CITYHALL_WARROOM_04");
};

