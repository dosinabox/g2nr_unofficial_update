
instance PAL_207_Girion(Npc_Default)
{
	name[0] = "Гирион";
	guild = GIL_PAL;
	id = 207;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,73,ItMi_Gold,280);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lefty,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
//	B_SetFightSkills(self,90);
	B_SetTeacherFightSkills(self,TeachLimit_1H_Girion,TeachLimit_2H_Girion,90,TeachLimit_Crossbow_Girion);
	daily_routine = Rtn_Start_207;
};


func void Rtn_Start_207()
{
	TA_Practice_Sword(6,0,7,3,"NW_CITY_GIRION");
	TA_Stand_ArmsCrossed(7,3,19,0,"NW_CITY_GIRION");
	TA_Sit_Throne(19,0,22,59,"NW_CITY_UPTOWN_HUT_03_SIT");
	TA_Sleep(22,59,6,0,"NW_CITY_LEOMAR_BED_02");
};

func void Rtn_WaitForShip_207()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_WAY_TO_SHIP_25");
	TA_Stand_WP(23,0,8,0,"NW_CITY_WAY_TO_SHIP_25");
};

func void Rtn_Ship_207()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_18");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_18");
};

