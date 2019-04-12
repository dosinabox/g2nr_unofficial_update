
instance VLK_4002_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 4002;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe1",FaceBabe_N_Anne,BodyTex_N,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4002;
};


func void Rtn_Start_4002()
{
	TA_Cook_Stove(6,0,8,0,"NW_CITY_RICHTER_COOK");
	TA_Stand_Sweeping(8,0,10,0,"NW_CITY_UPTOWN_JUDGE_02");
	TA_Smalltalk(10,0,14,0,"NW_CITY_UPTOWN_PATH_15");
	TA_Cook_Stove(14,0,16,0,"NW_CITY_RICHTER_COOK");
	TA_Sit_Chair(16,0,18,0,"NW_CITY_RICHTER");
	TA_Stand_Sweeping(18,0,20,0,"NW_CITY_UPTOWN_JUDGE_02");
	TA_Sit_Throne(20,0,23,0,"NW_CITY_UPTOWN_JUDGE_THRONE_01");
	TA_Sleep(23,0,6,0,"NW_CITY_RICHTER_BED_WEIB");
};

