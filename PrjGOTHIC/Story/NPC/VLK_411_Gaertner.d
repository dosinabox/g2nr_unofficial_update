
instance VLK_411_Gaertner(Npc_Default)
{
	name[0] = "Садовник";
	guild = GIL_VLK;
	id = 411;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart_Graham,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_411;
};


func void Rtn_Start_411()
{
	TA_Rake_FP(6,30,8,30,"NW_CITY_CITYHALL_04");
	TA_Rake_FP(8,30,10,30,"NW_CITY_CITYHALL_10");
	TA_Rake_FP(10,30,12,30,"NW_CITY_CITYHALL_12");
	TA_Rake_FP(12,30,14,30,"NW_CITY_CITYHALL_07");
	TA_Rake_FP(14,30,16,30,"NW_CITY_CITYHALL_10");
	TA_Rake_FP(16,30,18,30,"NW_CITY_CITYHALL_12");
	TA_Rake_FP(18,30,20,30,"NW_CITY_CITYHALL_07");
	TA_Rake_FP(20,30,22,0,"NW_CITY_CITYHALL_04");
	TA_Sit_Campfire(22,0,6,30,"NW_CITY_CITYHALL_04_B");
};

