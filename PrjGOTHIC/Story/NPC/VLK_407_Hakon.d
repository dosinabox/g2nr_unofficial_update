
instance VLK_407_Hakon(Npc_Default)
{
	name[0] = "�����";
	guild = GIL_VLK;
	id = 407;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schiffsaxt);
	B_CreateItemToSteal(self,45,ItMi_Gold,65);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart20,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_407;
};


func void Rtn_Start_407()
{
	TA_Stand_ArmsCrossed(5,10,19,50,"NW_CITY_HAKON_02");
	TA_Smoke_Waterpipe(19,50,0,10,"NW_CITY_RAUCH_02");
	TA_Sleep(0,10,5,10,"NW_CITY_HOTEL_BED_04");
};

