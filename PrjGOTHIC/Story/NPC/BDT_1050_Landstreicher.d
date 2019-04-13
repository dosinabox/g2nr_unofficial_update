
instance BDT_1050_Landstreicher(Npc_Default)
{
	name[0] = "Ѕрод€га";
	guild = GIL_NONE;
	id = 1050;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal02,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	start_aistate = ZS_Stand_ArmsCrossed;
};

