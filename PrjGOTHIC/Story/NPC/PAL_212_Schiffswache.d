
instance PAL_212_Schiffswache(Npc_Default)
{
	name[0] = NAME_Schiffswache;
	guild = GIL_PAL;
	id = 212;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Scatty,BodyTex_L,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_212;
};


func void Rtn_Start_212()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITY_SHIP_GUARD_02");
	TA_Guard_Passage(23,0,8,0,"NW_CITY_SHIP_GUARD_02");
};

func void Rtn_ShipFree_212()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_PALCAMP_01");
	TA_Smalltalk(23,0,8,0,"NW_CITY_PALCAMP_01");
};

