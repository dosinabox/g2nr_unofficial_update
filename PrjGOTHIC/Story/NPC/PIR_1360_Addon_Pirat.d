
instance PIR_1360_Addon_PIRAT(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PIR;
	id = 1360;
	voice = 7;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Ratford,BodyTex_L,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_1360;
};


func void Rtn_PreStart_1360()
{
	TA_Repair_Hut(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Repair_Hut(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
};

func void Rtn_Start_1360()
{
	TA_Repair_Hut(6,10,19,10,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Sit_Campfire(19,10,20,10,"WP_PIR_06");
	TA_Stand_Drinking(20,10,21,10,"WP_PIR_06");
	TA_Sit_Campfire(21,10,3,10,"WP_PIR_06");
	TA_Pee(3,10,3,15,"WP_PIR_06");
	TA_Sit_Campfire(3,15,6,10,"WP_PIR_06");
};

func void Rtn_Follow_1360()
{
	TA_Follow_Player(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Follow_Player(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
};

