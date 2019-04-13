
instance Pal_241_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 241;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal17,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_241;
};


func void Rtn_Start_241()
{
	TA_Stand_Guarding(6,0,7,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(7,0,8,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(8,0,9,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(9,0,10,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(10,0,11,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(11,0,12,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(12,0,13,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(13,0,14,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(14,0,15,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(15,0,16,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(16,0,17,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(17,0,18,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(18,0,19,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(19,0,20,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(20,0,21,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(21,0,22,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(22,0,23,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(23,0,0,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(0,0,1,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(1,0,2,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(2,0,3,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(3,0,4,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(4,0,5,0,"NW_CITY_WAY_TO_SHIP_23");
	TA_Stand_Guarding(5,0,6,0,"NW_CITY_PALCAMP_08");
};

func void Rtn_ShipFree_241()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_PALCAMP_09");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_PALCAMP_09");
};

