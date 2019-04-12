
instance BDT_10026_Addon_Wache(Npc_Default)
{
	name[0] = NAME_Wache;
	guild = GIL_BDT;
	id = 10026;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Erpresser,BodyTex_N,ITAR_Bloodwyn_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10026;
};


func void Rtn_Start_10026()
{
	TA_Stand_Eating(6,0,12,0,"ADW_MINE_18");
	TA_Stand_Eating(12,0,6,0,"ADW_MINE_18");
};

