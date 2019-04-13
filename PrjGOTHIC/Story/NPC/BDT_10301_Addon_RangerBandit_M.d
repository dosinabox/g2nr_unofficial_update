
instance BDT_10301_Addon_RangerBandit_M(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10301;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItWr_StonePlateCommon_Addon,2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal03,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_10301;
};


func void Rtn_Start_10301()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FARM2_TO_TAVERN_06");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_FARM2_TO_TAVERN_06");
};

