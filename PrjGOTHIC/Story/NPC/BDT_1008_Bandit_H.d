
instance BDT_1008_Bandit_H(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1008;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal01,BodyTex_B,ItAr_BDT_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	start_aistate = ZS_Bandit;
};

