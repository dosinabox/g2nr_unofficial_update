
instance Pal_208_Paladin(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 208;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Drax,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_208;
};


func void Rtn_Start_208()
{
	TA_Smalltalk(8,0,19,2,"NW_CITY_UPTOWN_PATH_05_B");
	TA_Smalltalk(19,2,23,0,"NW_CITY_UPTOWN_HUT_03_04");
	TA_Sleep(23,0,7,0,"NW_CITY_LEOMAR_BED_06");
};

