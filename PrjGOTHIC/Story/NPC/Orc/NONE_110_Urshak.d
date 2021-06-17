
instance NONE_110_Urshak(Mst_Default_OrcShaman)
{
	name[0] = "г№-иръ";
	guild = GIL_FRIENDLY_ORC;
	id = 110;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,NO_ARMOR);
	fight_tactic = FAI_ORC;
	EquipItem(self,ItMw_2H_OrcAxe_01);
	daily_routine = Rtn_PreStart_110;
};


func void Rtn_PreStart_110()
{
	TA_Stand_WP(8,0,22,0,"OW_PATH_340");
	TA_Stand_WP(22,0,8,0,"OW_PATH_340");
};

func void Rtn_Start_110()
{
	TA_Stand_WP(8,0,22,0,"OW_HOSHPAK_04");
	TA_Stand_WP(22,0,8,0,"OW_HOSHPAK_04");
};

