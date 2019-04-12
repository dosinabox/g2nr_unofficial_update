
instance VLK_4301_Addon_Farim(Npc_Default)
{
	name[0] = "Фарим";
	guild = GIL_VLK;
	id = 4301;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	CreateInvItems(self,ItMi_Aquamarine,1);
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart08,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4301;
};


func void Rtn_Start_4301()
{
	TA_Repair_Hut(8,0,12,0,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	TA_Stand_Guarding(12,0,16,0,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Repair_Hut(16,0,20,0,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	TA_Stand_Guarding(20,0,1,30,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Sleep(1,30,8,0,"NW_CITY_WAY_TO_SHIP_FISCHER_04");
};

