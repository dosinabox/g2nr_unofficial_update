
instance BDT_10004_Addon_Finn(Npc_Default)
{
	name[0] = "Финн";
	guild = GIL_BDT;
	id = 10004;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart02,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10004;
};


func void Rtn_Start_10004()
{
	TA_Stand_Eating(10,0,20,0,"BL_DOWN_RING_04");
	TA_Smalltalk(20,0,2,0,"BL_DOWN_RING_02");
	TA_Sit_Bench(2,0,10,0,"BL_DOWN_04_BENCH");
};

func void Rtn_Mine_10004()
{
	TA_Pick_Ore(10,0,20,0,"ADW_MINE_PICK_06");
	TA_Pick_Ore(20,0,10,0,"ADW_MINE_PICK_06");
};

