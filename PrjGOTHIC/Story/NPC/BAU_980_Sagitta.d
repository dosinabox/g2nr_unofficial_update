
instance BAU_980_Sagitta(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_NONE;
	id = 980;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateItemToSteal(self,103,ItMi_Gold,360);
//	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_PinkHair,BodyTexBabe_N,ITAR_BauBabe_L);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabeExtra01,BodyTexBabe_P,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_980;
};


func void Rtn_Start_980()
{
	TA_Sit_Throne(8,0,23,0,"NW_SAGITTA_CAVE_IN_02");
	TA_Potion_Alchemy(23,0,8,0,"NW_SAGITTA_CAVE_IN_03");
};

