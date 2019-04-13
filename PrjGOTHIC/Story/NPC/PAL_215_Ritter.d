
instance Pal_215_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 215;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough02,BodyTex_L,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_215;
};


func void Rtn_Start_215()
{
	TA_Practice_Sword(7,8,19,1,"NW_CITY_TRAIN_01");
	TA_Smalltalk(19,1,23,7,"NW_CITY_UPTOWN_HUT_03_01");
	TA_Sleep(23,7,7,8,"NW_CITY_LEOMAR_BED_03");
};

