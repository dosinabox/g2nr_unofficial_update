
instance STRF_1127_Addon_Pardos_NW(Npc_Default)
{
	name[0] = "������";
	guild = GIL_OUT;
	id = 1127;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
//	EquipItem(self,ItMw_2H_Axe_L_01);
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,85,ItMi_Gold,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1127;
};


func void Rtn_Start_1127()
{
	TA_Sit_Throne(0,0,12,0,"NW_FARM3_HOUSE_IN_NAVI_2");
	TA_Sit_Throne(12,0,0,0,"NW_FARM3_HOUSE_IN_NAVI_2");
};

