
instance VLK_4007_Agon(Npc_Default)
{
	name[0] = "Агон";
	guild = GIL_VLK;
	id = 4007;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Pir_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal01,BodyTex_N,ITAR_VLK_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4007;
};


func void Rtn_Start_4007()
{
	TA_Sit_Throne(11,0,15,0,"NW_CITY_UPTOWN_JUDGE_THRONE_02");
	TA_Sit_Chair(15,0,17,0,"NW_CITY_RICHTER");
	TA_Sit_Chair(17,0,22,0,"NW_CITYHALL_UPSTAIRS_01");
	TA_Sit_Throne(22,0,3,0,"NW_CITYHALL_PRIVATE_THRONE");
	TA_Sleep(3,0,11,0,"NW_CITY_LARIUS_BED");
};

