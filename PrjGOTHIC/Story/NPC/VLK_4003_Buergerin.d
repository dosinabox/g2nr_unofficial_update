
instance VLK_4003_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 4003;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_OldBrown,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4003;
};


func void Rtn_Start_4003()
{
	TA_Sleep(22,0,7,45,"NW_CITY_REICH02_BED_02");
	TA_Cook_Stove(7,45,10,0,"NW_CITY_REICH02_COOK");
	TA_Sit_Chair(10,0,12,30,"NW_CITY_REICH02_SIT");
	TA_Stand_Sweeping(12,30,14,0,"NW_CITY_REICH02_SIT");
	TA_Cook_Stove(14,0,16,0,"NW_CITY_REICH02_COOK");
	TA_Sit_Chair(16,0,18,0,"NW_CITY_REICH02_SIT");
	TA_Stand_Sweeping(18,0,19,0,"NW_CITY_REICH02_SIT");
	TA_Smalltalk(19,0,22,0,"NW_CITY_SMALLTALK_02");
};

