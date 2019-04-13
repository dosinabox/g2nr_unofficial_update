
instance NOV_604_Dyrian(Npc_Default)
{
	name[0] = "Дуриан";
	guild = GIL_NOV;
	id = 604;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSc_Sleep,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Tough_Torrez,BodyTex_P,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_604;
};


func void Rtn_Start_604()
{
	TA_Stand_WP(8,0,10,0,"NW_MONASTERY_GRASS_04");
	TA_Pray_Innos_FP(10,0,11,0,"NW_MONASTERY_CHURCH_03");
	TA_Stand_WP(11,0,23,30,"NW_MONASTERY_GRASS_04");
	TA_Sleep(23,30,8,0,"NW_MONASTERY_NOVICE01_04");
};

func void Rtn_Favour_604()
{
	TA_Rake_FP(8,0,23,30,"NW_MONASTERY_HERB_05");
	TA_Sleep(23,30,8,0,"NW_MONASTERY_NOVICE01_04");
};

func void Rtn_NoFavour_604()
{
	TA_Stand_Drinking(8,0,23,30,"TAVERNE");
	TA_Stand_Drinking(23,30,8,0,"TAVERNE");
};

