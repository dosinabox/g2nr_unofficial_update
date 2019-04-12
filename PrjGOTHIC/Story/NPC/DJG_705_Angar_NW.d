
instance DJG_705_Angar_NW(Npc_Default)
{
	name[0] = "Ангар";
	guild = GIL_DJG;
	id = 7050;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_CorAngar,BodyTex_B,ITAR_CorAngar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_7050;
};


func void Rtn_Start_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"FARM3");
	TA_Stand_ArmsCrossed(23,0,8,0,"FARM3");
};

func void Rtn_WaitForShip_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_WAITFOR_SHIP_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_WAITFOR_SHIP_03");
};

func void Rtn_Ship_7050()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_CREW_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"SHIP_CREW_03");
};

