
instance VLK_422_Salandril(Npc_Default)
{
	name[0] = "Саландрил";
	guild = GIL_VLK;
	id = 422;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,2);
	attribute[ATR_DEXTERITY] = 1;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
//	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,30,ItKe_Salandril,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_422;
};


func void Rtn_Start_422()
{
	TA_Stand_ArmsCrossed(8,0,10,0,"NW_CITY_SALANDRIL");
	TA_Potion_Alchemy(10,0,13,0,"NW_CITY_SALANDRIL");
	TA_Read_Bookstand(13,0,15,0,"NW_CITY_SHOP_SALANDRIL_03");
	TA_Stand_ArmsCrossed(15,0,17,0,"NW_CITY_SALANDRIL");
	TA_Potion_Alchemy(17,0,19,0,"NW_CITY_SALANDRIL");
	TA_Read_Bookstand(19,0,22,0,"NW_CITY_SHOP_SALANDRIL_03");
	TA_Sleep(22,0,8,0,"NW_CITY_SHOP_SALANDRIL_BED");
};

func void Rtn_KlosterUrteil_422()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"ALTAR");
	TA_Stand_ArmsCrossed(22,0,8,0,"ALTAR");
};

