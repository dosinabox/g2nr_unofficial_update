
instance VLK_409_Zuris(Npc_Default)
{
	name[0] = "«урис";
	guild = GIL_VLK;
	id = 409;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_ImportantGrey,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_409;
};


func void Rtn_Start_409()
{
	TA_Stand_ArmsCrossed(5,30,6,25,"NW_CITY_BALTRAM");
	TA_Stand_Guarding(6,25,6,30,"NW_CITY_ZURIS_REGAL");
	TA_Stand_ArmsCrossed(6,30,8,30,"NW_CITY_BALTRAM");
	TA_Stand_ArmsCrossed(8,30,11,30,"NW_CITY_BALTRAM");
	TA_Stand_ArmsCrossed(11,30,14,30,"NW_CITY_BALTRAM");
	TA_Stand_ArmsCrossed(14,30,20,0,"NW_CITY_BALTRAM");
	TA_Sit_Throne(20,0,0,30,"NW_CITY_CHAIR_ZURIS");
	TA_Sleep(0,30,5,30,"NW_CITY_BED_ZURIS");
};

