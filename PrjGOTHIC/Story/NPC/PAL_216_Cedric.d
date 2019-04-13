
instance Pal_216_Cedric(Npc_Default)
{
	name[0] = "Седрик";
	guild = GIL_PAL;
	id = 216;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_216;
};


func void Rtn_Start_216()
{
	TA_Practice_Sword(7,0,19,0,"NW_CITY_TRAIN_01");
	TA_Sleep(19,0,7,0,"NW_CITY_LEOMAR_BED_03");
};

