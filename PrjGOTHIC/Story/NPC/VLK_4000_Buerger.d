
instance VLK_4000_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 4000;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart21,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4000;
};


func void Rtn_Start_4000()
{
	TA_Sleep(22,0,8,0,"NW_CITY_UPTOWN_HUT_05_BED_01");
	TA_Smalltalk(8,0,12,0,"NW_CITY_UPTOWN_HUT_04_ENTRY");
	TA_Sit_Bench(12,0,15,0,"NW_CITY_GUARD_01");
	TA_Smalltalk(15,0,18,0,"NW_CITY_UPTOWN_HUT_04_ENTRY");
	TA_Sit_Bench(18,0,20,0,"NW_CITY_GUARD_01");
	TA_Sit_Bench(20,0,22,0,"NW_CITY_UPTOWN_PATH_27");
};

