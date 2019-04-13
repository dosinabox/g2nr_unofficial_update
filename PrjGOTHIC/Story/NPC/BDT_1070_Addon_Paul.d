
instance BDT_1070_Addon_Paul(Npc_Default)
{
	name[0] = "Поль";
	guild = GIL_BDT;
	id = 1070;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Nugget,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Drax,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_PreStart_1070;
};


func void Rtn_PreStart_1070()
{
	TA_Saw(6,0,13,0,"BL_SMITH_YARD_SAW");
	TA_Saw(13,0,6,0,"BL_SMITH_YARD_SAW");
};

func void Rtn_Away_1070()
{
	TA_Stand_Drinking(10,0,20,0,"BL_SMITH_STAIRS");
	TA_Stand_Drinking(20,0,10,0,"BL_SMITH_STAIRS");
};

func void Rtn_Start_1070()
{
	TA_Saw(6,0,13,0,"BL_SMITH_YARD_SAW");
	TA_Smith_Anvil(13,0,17,0,"BL_UP_02");
	TA_Saw(17,0,19,0,"BL_SMITH_YARD_SAW");
	TA_Smith_Sharp(19,0,23,0,"BL_SMITH_YARD_02");
	TA_Stand_Drinking(23,0,6,0,"BL_UP_10");
};

func void Rtn_Mine_1070()
{
	TA_Pick_Ore(10,0,20,0,"ADW_MINE_PICK_07");
	TA_Pick_Ore(20,0,10,0,"ADW_MINE_PICK_07");
};

