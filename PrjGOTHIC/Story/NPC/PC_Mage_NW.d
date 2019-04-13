
instance PC_Mage_NW(Npc_Default)
{
	name[0] = "Милтен";
	guild = GIL_KDF;
	id = 12;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_12;
};


func void Rtn_Start_12()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_MILTEN");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_MILTEN");
};

func void Rtn_WaitForShip_12()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_WAY_TO_SHIP_19");
	TA_Smalltalk(23,0,8,0,"NW_CITY_WAY_TO_SHIP_19");
};

func void Rtn_ShipOff_12()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_ENTRY_01");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_ENTRY_01");
};

func void Rtn_Ship_12()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_19");
};

