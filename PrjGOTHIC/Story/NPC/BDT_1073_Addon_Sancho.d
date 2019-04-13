
instance BDT_1073_Addon_Sancho(Npc_Default)
{
	name[0] = "Санчо";
	guild = GIL_BDT;
	id = 1073;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Mordrag,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1073;
};


func void Rtn_Start_1073()
{
	TA_Stand_Drinking(9,0,21,0,"ADW_BANDIT_VP1_01");
	TA_Stand_Drinking(21,0,9,0,"ADW_BANDIT_VP1_01");
};

