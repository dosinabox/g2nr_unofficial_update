
instance Pal_214_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 214;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough01,BodyTex_L,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_214;
};


func void Rtn_Start_214()
{
	TA_Smalltalk(7,5,19,5,"NW_CITY_UPTOWN_PATH_05");
	TA_Read_Bookstand(19,5,23,0,"NW_CITY_UPTOWN_HUT_03_03");
	TA_Sleep(23,0,7,5,"NW_CITY_LEOMAR_BED_05");
};

