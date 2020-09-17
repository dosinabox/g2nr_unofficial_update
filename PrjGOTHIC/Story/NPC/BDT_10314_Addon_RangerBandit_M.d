
instance BDT_10314_Addon_RangerBandit_M(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10314;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_BromorsGeld_Addon,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal03,BodyTex_N,ITAR_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
//	start_aistate = ZS_Bandit;
	daily_routine = Rtn_Start_10314;
};

func void Rtn_Start_10314()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FARM4_WOOD_RANGERBANDITS_05");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_FARM4_WOOD_RANGERBANDITS_05");
};

