
instance VLK_438_Alrik(Npc_Default)
{
	name[0] = "Альрик";
	guild = GIL_NONE;
	id = 438;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_FightDistCancel] = 600;
	aivar[AIV_MaxDistToWp] = 300;
	aivar[AIV_OriginalFightTactic] = FAI_HUMAN_NORMAL;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Bloodwyn,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_438;
};


func void Rtn_Start_438()
{
	TA_Stand_Guarding(10,55,19,15,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Drinking(19,15,3,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sit_Bench(3,30,10,55,"NW_CITY_PATH_HABOUR_16_01");
};

