
instance PAL_262_Wache(Npc_Default)
{
	name[0] = NAME_Wache;
	guild = GIL_PAL;
	id = 262;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart17,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_262;
};


func void Rtn_Start_262()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_01");
};

