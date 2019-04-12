
instance BDT_1097_Addon_Fisk(Npc_Default)
{
	name[0] = "Фиск";
	guild = GIL_BDT;
	id = 1097;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Cavalorn,BodyTex_B,ITAR_Diego);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PreStart_1097;
};


func void Rtn_PreStart_1097()
{
	TA_Stand_WP(8,0,20,0,"BL_MID_05");
	TA_Stand_WP(20,0,8,0,"BL_MID_05");
};

func void Rtn_Start_1097()
{
	TA_Stand_Guarding(8,0,20,0,"BL_MERCHANT_01");
	TA_Stand_Guarding(20,0,8,0,"BL_MERCHANT_01");
};

func void Rtn_Meeting_1097()
{
	TA_Stand_Guarding(8,0,20,0,"BL_INN_UP_06");
	TA_Stand_Guarding(20,0,8,0,"BL_INN_UP_06");
};

func void Rtn_Ambush_1097()
{
	TA_Stand_WP(8,0,20,0,"BL_INN_07");
	TA_Stand_WP(20,0,8,0,"BL_INN_07");
};

