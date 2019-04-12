
instance VLK_467_Buerger(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 467;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Normal_GorNaBar,BodyTex_L,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_467;
};


func void Rtn_Start_467()
{
	TA_Stand_ArmsCrossed(11,0,19,0,"NW_CITY_WATCH_FIGHT_02");
	TA_Smalltalk(19,0,3,0,"NW_CITY_HABOUR_03");
	TA_Sit_Throne(3,0,5,0,"NW_CITY_PUFF_THRONE");
	TA_Smalltalk(5,0,11,0,"NW_CITY_WAY_TO_SHIP_01");
};

