
instance BAU_935_Bronko(Npc_Default)
{
	name[0] = "Бронко";
	guild = GIL_NONE;
	id = 935;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Bau_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Gold,35);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Kirgo,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_PreStart_935;
};


func void Rtn_PreStart_935()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM4_BRONKO");
	TA_Sit_Campfire(22,0,8,0,"NW_FARM4_REST_02");
};

func void Rtn_Start_935()
{
	TA_Pick_FP(8,0,22,0,"NW_FARM4_FIELD_01");
	TA_Pick_FP(22,0,8,0,"NW_FARM4_FIELD_01");
};

