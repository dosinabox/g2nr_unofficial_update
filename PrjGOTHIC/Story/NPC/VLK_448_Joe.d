
instance VLK_448_Joe(Npc_Default)
{
	name[0] = "Äæî";
	guild = GIL_OUT;
	id = 448;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_ToughBald,BodyTex_P,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_PreStart_448;
};


func void Rtn_PreStart_448()
{
	TA_Sit_Campfire(8,0,23,0,"NW_CITY_MERCHANT_TOWER_01");
	TA_Sit_Campfire(23,0,8,0,"NW_CITY_MERCHANT_TOWER_01");
};

func void Rtn_Start_448()
{
	TA_Stand_Drinking(8,0,23,0,"NW_CITY_HABOUR_TAVERN01_08");
	TA_Stand_Drinking(23,0,8,0,"NW_CITY_HABOUR_TAVERN01_08");
};

