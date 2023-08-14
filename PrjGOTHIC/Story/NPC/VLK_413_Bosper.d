
instance VLK_413_Bosper(Npc_Default)
{
	name[0] = "������";
	guild = GIL_VLK;
	id = 413;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	EquipItem(self,ItRw_Bow_M_02);
	B_CreateItemToSteal(self,67,ItMi_Gold,120);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough_Santino,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_413;
};


func void Rtn_Start_413()
{
	TA_Stand_Guarding(5,0,0,0,"NW_CITY_MERCHANT_SHOP01_IN_02");
	TA_Sleep(0,0,5,0,"NW_CITY_BED_GRITTA");
};

