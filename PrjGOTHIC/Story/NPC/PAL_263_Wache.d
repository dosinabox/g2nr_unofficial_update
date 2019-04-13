
instance PAL_263_Wache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 263;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Bloodwyn,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_263;
};


func void Rtn_Start_263()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_02");
};

