
instance PIR_1361_Addon_PIRAT(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PIR;
	id = 1361;
	voice = 9;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_ToughBart01,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_1361;
};


func void Rtn_PreStart_1361()
{
	TA_Saw(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
	TA_Saw(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
};

func void Rtn_Start_1361()
{
	TA_Saw(6,15,19,15,"ADW_PIRATECAMP_ENTRANCE_SAW");
	TA_Sit_Campfire(19,15,21,15,"WP_PIR_02");
	TA_Stand_Drinking(21,15,22,15,"WP_PIR_02");
	TA_Pee(22,15,22,20,"WP_PIR_02");
	TA_Sit_Campfire(22,20,2,15,"WP_PIR_02");
	TA_Stand_Drinking(2,15,3,15,"WP_PIR_02");
	TA_Sit_Campfire(3,15,6,15,"WP_PIR_02");
};

func void Rtn_Follow_1361()
{
	TA_Follow_Player(8,0,20,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
	TA_Follow_Player(20,0,8,0,"ADW_PIRATECAMP_ENTRANCE_SAW");
};

