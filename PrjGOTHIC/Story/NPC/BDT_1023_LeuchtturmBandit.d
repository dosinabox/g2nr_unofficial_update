
instance BDT_1023_LeuchtturmBandit(Npc_Default)
{
	name[0] = "Бандит";
	guild = GIL_BDT;
	id = 1023;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart03,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	start_aistate = ZS_Bandit;
};

