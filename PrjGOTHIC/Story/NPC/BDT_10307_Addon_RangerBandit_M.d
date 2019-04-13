
instance BDT_10307_Addon_RangerBandit_M(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10307;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal03,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	start_aistate = ZS_Bandit;
};

