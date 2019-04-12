
instance VLK_437_Brahim(Npc_Default)
{
	name[0] = "Ибрагим";
	guild = GIL_VLK;
	id = 437;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_CoolPock,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_437;
};


func void Rtn_Start_437()
{
	TA_Sit_Bench(8,0,22,0,"NW_CITY_HABOUR_HUT_01_FRONT");
	TA_Sleep(22,0,8,0,"NW_CITY_BED_BRAHIM");
};

