
instance VLK_457_Brian(Npc_Default)
{
	name[0] = "ֱנאיאם";
	guild = GIL_VLK;
	id = 457;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal_Kirgo,BodyTex_B,ITAR_Smith);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_457;
};


func void Rtn_Start_457()
{
	TA_Smith_Sharp(7,5,20,35,"NW_CITY_SMITH_SHARP");
	TA_Smalltalk(20,35,0,25,"NW_CITY_MERCHANT_PATH_14");
	TA_Sleep(0,25,7,5,"NW_CITY_BED_BRIAN");
};

func void Rtn_Lighthouse_457()
{
	TA_Stand_Guarding(8,0,20,0,"NW_LIGHTHOUSE_IN_01");
	TA_Sit_Throne(20,0,8,0,"NW_LIGHTHOUSE_IN_03");
};

