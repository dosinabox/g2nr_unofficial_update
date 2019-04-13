
instance BDT_10006_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10006;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Normal02,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10006;
};


func void Rtn_Start_10006()
{
	TA_Sit_Bench(2,0,16,0,"BL_MID_10_C");
	TA_Cook_Pan(16,0,20,0,"BL_DOWN_RING_05");
	TA_Stand_Eating(20,0,2,0,"BL_DOWN_RING_01");
};

