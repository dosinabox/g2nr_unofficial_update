
instance BDT_1096_Addon_Lennar(Npc_Default)
{
	name[0] = "Леннар";
	guild = GIL_BDT;
	id = 1096;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Nagelknueppel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1096;
};


func void Rtn_Start_1096()
{
	TA_Stand_Drinking(1,50,19,30,"BL_DOWN_RING_03");
	TA_Roast_Scavenger(19,30,1,50,"BL_DOWN_RING_ROAST");
};

func void Rtn_Ruhe_1096()
{
	TA_Stand_Drinking(10,0,20,0,"ADW_MINE_22");
	TA_Stand_Drinking(20,0,10,0,"ADW_MINE_22");
};

func void Rtn_Mine_1096()
{
	TA_Pick_Ore(10,0,20,0,"ADW_MINE_PICK_09");
	TA_Pick_Ore(20,0,10,0,"ADW_MINE_PICK_09");
};

