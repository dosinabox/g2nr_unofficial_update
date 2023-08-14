
instance NOV_602_Ulf(Npc_Default)
{
	name[0] = "”Î¸Ù";
	guild = GIL_VLK;
	id = 602;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,34,ItMi_Gold,50);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ITAR_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_602;
};


func void Rtn_Start_602()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_BEER_04");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_BEER_04");
};

func void Rtn_Suche_602()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_PATH_42");
};

func void Rtn_Wait_602()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_PATH_22");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_PATH_22");
};

func void Rtn_Follow_602()
{
	TA_Follow_Player(8,0,20,0,"NW_TROLLAREA_PATH_13");
	TA_Follow_Player(20,0,8,0,"NW_TROLLAREA_PATH_13");
};

func void Rtn_BackToMonastery_602()
{
	TA_Stand_Sweeping(8,0,23,0,"NW_MONASTERY_MAGE03_01");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_NOVICE03_06");
};

func void Rtn_Tot_602()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

