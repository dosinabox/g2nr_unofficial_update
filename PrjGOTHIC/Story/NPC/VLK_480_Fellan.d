
instance VLK_480_Fellan(Npc_Default)
{
	name[0] = "Феллан";
	guild = GIL_VLK;
	id = 480;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal19,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_480;
};


func void Rtn_Start_480()
{
	TA_Repair_Hut(4,30,8,0,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut(8,0,12,0,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut(12,0,16,0,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut(16,0,20,0,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut(20,0,1,30,"NW_CITY_PATH_HABOUR_09");
	TA_Sleep(1,30,4,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};

func void Rtn_OhneHammer_480()
{
	TA_Sit_Bench(6,0,23,0,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sleep(23,0,6,0,"NW_CITY_HABOUR_HUT_05_BED_01");
};

