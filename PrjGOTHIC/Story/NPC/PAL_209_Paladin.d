
instance Pal_209_Paladin(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 209;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Normal_Fletcher,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_209;
};


func void Rtn_Start_209()
{
	TA_Practice_Sword(7,10,19,2,"NW_CITY_TRAIN_02");
	TA_Smalltalk(19,2,23,6,"NW_CITY_UPTOWN_HUT_03_01_B");
	TA_Sleep(23,6,7,10,"NW_CITY_LEOMAR_BED_04");
};

