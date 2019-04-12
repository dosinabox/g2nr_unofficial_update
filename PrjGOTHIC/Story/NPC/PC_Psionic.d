
instance PC_Psionic(Npc_Default)
{
	name[0] = "Лестер";
	guild = GIL_NONE;
	id = 4;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_Kriegshammer2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Lester,BodyTex_P,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4;
};


func void Rtn_Start_4()
{
	TA_Sit_Campfire(8,0,23,0,"NW_XARDAS_TOWER_LESTER");
	TA_Sit_Campfire(23,0,8,0,"NW_XARDAS_TOWER_LESTER");
};

func void Rtn_Xardas_4()
{
	TA_Sleep(8,0,23,0,"NW_XARDAS_TOWER_IN1_31");
	TA_Sleep(23,0,8,0,"NW_XARDAS_TOWER_IN1_31");
};

func void Rtn_XardasWeg_4()
{
	TA_Stand_Guarding(8,0,23,0,"NW_XARDAS_TOWER_02");
	TA_Stand_Guarding(23,0,8,0,"NW_XARDAS_TOWER_02");
};

func void Rtn_WaitForPlayer_4()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"LEVELCHANGE");
	TA_Stand_ArmsCrossed(23,0,8,0,"LEVELCHANGE");
};

func void Rtn_WaitForShip_4()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_WAY_TO_SHIP_19");
	TA_Smalltalk(23,0,8,0,"NW_CITY_WAY_TO_SHIP_19");
};

func void Rtn_ShipOff_4()
{
	TA_Stand_Guarding(8,0,23,0,"NW_XARDAS_TOWER_02");
	TA_Stand_Guarding(23,0,8,0,"NW_XARDAS_TOWER_02");
};

func void Rtn_Ship_4()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_19");
};

