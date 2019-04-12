
instance BDT_10014_Addon_Thorus(Npc_Default)
{
	name[0] = "Торус";
	guild = GIL_BDT;
	id = 10014;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ITKE_Addon_Thorus,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Thorus,BodyTex_B,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PReStart_10014;
};


func void Rtn_PReStart_10014()
{
	TA_Stand_Guarding(0,0,12,0,"BL_STAIRS_03");
	TA_Stand_Guarding(12,0,0,0,"BL_STAIRS_03");
};

func void Rtn_Start_10014()
{
	TA_Read_Bookstand(0,0,12,0,"BL_BLOODWYN_BOOK");
	TA_Stand_Guarding(12,0,20,0,"BL_BLOODWYN_04");
	TA_Stand_Guarding(20,0,0,0,"BL_STAIRS_03");
};

func void Rtn_TALK_10014()
{
	TA_Stand_WP(0,0,12,0,"BL_UP_PLACE_03");
	TA_Stand_WP(12,0,0,0,"BL_UP_PLACE_03");
};

