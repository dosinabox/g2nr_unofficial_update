
instance MIL_324_Peck(Npc_Default)
{
	name[0] = "Пек";
	guild = GIL_MIL;
	id = 324;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_City_Tower_05,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Orik,BodyTex_B,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_324;
};


func void Rtn_Start_324()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_HABOUR_PUFF_PECK");
	TA_Smalltalk(23,0,8,0,"NW_CITY_HABOUR_PUFF_PECK");
};

func void Rtn_Storage_324()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_ARMORY_PECK");
	TA_Sleep(22,0,8,0,"NW_CITY_BARRACK02_BED_PECK");
};

