
instance PAL_271_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 271;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart21,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_271;
};


func void Rtn_Start_271()
{
	TA_Stand_Guarding(8,0,23,0,"OC_EBR_FLOOR_STAND");
	TA_Stand_Guarding(23,0,8,0,"OC_EBR_FLOOR_STAND");
};

