
instance Pal_210_Torwache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 210;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_210;
};


func void Rtn_Start_210()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_CITYHALL_ENTRY_01");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_CITYHALL_ENTRY_01");
};

