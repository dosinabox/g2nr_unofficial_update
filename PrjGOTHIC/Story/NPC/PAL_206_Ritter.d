
instance Pal_206_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 206;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Kharim,BodyTex_B,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_206;
};


func void Rtn_Start_206()
{
	TA_Stand_ArmsCrossed(7,14,19,0,"NW_CITY_UPTOWN_PATH_06_B");
	TA_Smalltalk(19,0,23,1,"NW_CITY_UPTOWN_HUT_03_05");
	TA_Sleep(23,1,7,14,"NW_CITY_LEOMAR_BED_01");
};

