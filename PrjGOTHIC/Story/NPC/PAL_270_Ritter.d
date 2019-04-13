
instance PAL_270_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 270;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBart_Quentin,BodyTex_L,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_270;
};


func void Rtn_Start_270()
{
	TA_Stand_Guarding(8,0,23,0,"OC_EBR_STAND_THRONE_02");
	TA_Stand_Guarding(23,0,8,0,"OC_EBR_BASE_TO_FLOOR");
};

