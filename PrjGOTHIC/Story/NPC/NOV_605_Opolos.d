
instance NOV_605_Opolos(Npc_Default)
{
	name[0] = "Ополос";
	guild = GIL_NOV;
	id = 605;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Silas,BodyTex_B,ItAr_NOV_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_605;
};


func void Rtn_Start_605()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_SHEEP_05");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_SHEEP_05");
};

func void Rtn_Favour_605()
{
	TA_Read_Bookstand(8,0,23,0,"NW_MONASTERY_RUNEMAKER_07");
	TA_Read_Bookstand(23,0,8,0,"NW_MONASTERY_RUNEMAKER_07");
};

