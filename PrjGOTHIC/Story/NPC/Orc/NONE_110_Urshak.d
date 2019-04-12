
instance NONE_110_Urshak(Mst_Default_OrcShaman)
{
	name[0] = "г№-иръ";
	guild = GIL_FRIENDLY_ORC;
	id = 110;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_ORC;
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

