
instance BAU_911_Elena(Npc_Default)
{
	name[0] = "Елена";
	guild = GIL_BAU;
	id = 911;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,2);
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateItemToSteal(self,30,ItMi_Gold,35);
//	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_GreyCloth,BodyTexBabe_N,ITAR_BauBabe_L);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe7",FaceBabe_N_GreyCloth,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_911;
};


func void Rtn_Start_911()
{
	TA_Stand_ArmsCrossed(7,30,22,30,"NW_BIGFARM_STABLE_OUT_04");
	TA_Sit_Throne(22,30,7,30,"NW_BIGFARM_HOUSE_UP1_SESSEL");
};

