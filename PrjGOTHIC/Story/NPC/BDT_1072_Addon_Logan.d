
instance BDT_1072_Addon_Logan(Npc_Default)
{
	name[0] = "Логан";
	guild = GIL_BDT;
	id = 1072;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Bow_M_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Cipher_neu,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,-0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1072;
};


func void Rtn_Start_1072()
{
	TA_Stand_Guarding(9,0,21,0,"ADW_BANDIT_VP3_03");
	TA_Stand_Guarding(21,0,9,0,"ADW_BANDIT_VP3_03");
};

func void Rtn_Jagd_1072()
{
	TA_Stand_Guarding(9,0,21,0,"ADW_BANDIT_VP3_05");
	TA_Stand_Guarding(21,0,9,0,"ADW_BANDIT_VP3_05");
};

func void Rtn_Lager_1072()
{
	TA_Stand_Drinking(9,0,21,0,"BL_INN_03_C");
	TA_Stand_Drinking(21,0,9,0,"BL_INN_03_C");
};

func void Rtn_Mine_1072()
{
	TA_Pick_Ore(10,0,20,0,"ADW_MINE_PICK_08");
	TA_Pick_Ore(20,0,10,0,"ADW_MINE_PICK_08");
};

