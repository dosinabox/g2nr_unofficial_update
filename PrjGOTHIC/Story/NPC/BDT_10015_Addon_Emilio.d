
instance BDT_10015_Addon_Emilio(Npc_Default)
{
	name[0] = "Ёмилио";
	guild = GIL_BDT;
	id = 10015;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart01,BodyTex_P,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10015;
};


func void Rtn_Start_10015()
{
	TA_Sit_Bench(2,0,11,0,"BL_INN_01_BENCH");
	TA_Sit_Bench(11,0,2,0,"BL_INN_01_BENCH");
};

func void Rtn_Mine_10015()
{
	TA_Pick_Ore(10,0,20,0,"ADW_MINE_09_PICK");
	TA_Pick_Ore(20,0,10,0,"ADW_MINE_09_PICK");
};

