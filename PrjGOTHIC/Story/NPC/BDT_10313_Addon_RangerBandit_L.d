
instance BDT_10313_Addon_RangerBandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10313;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Addon_BanditTrader);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough02,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
//	start_aistate = ZS_Bandit;
	daily_routine = Rtn_Start_10313;
};

func void Rtn_Start_10313()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FARM4_WOOD_RANGERBANDITS_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_FARM4_WOOD_RANGERBANDITS_02");
};

