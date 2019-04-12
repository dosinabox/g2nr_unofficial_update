
instance STRF_1126_Addon_Telbor_NW(Npc_Default)
{
	name[0] = "Телбор";
	guild = GIL_BAU;
	id = 1126;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal01,BodyTex_B,ITAR_Prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1126;
};


func void Rtn_Start_1126()
{
	TA_Rake_FP(0,0,12,0,"NW_FARM2_FIELD_TELBOR");
	TA_Rake_FP(12,0,0,0,"NW_FARM2_FIELD_TELBOR");
};

