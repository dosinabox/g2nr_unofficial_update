
instance BAU_918_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 918;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal17,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_918;
};


func void Rtn_Start_918()
{
	TA_Smalltalk(8,5,22,5,"NW_BIGFARM_KITCHEN_09");
	TA_Smalltalk(22,5,8,5,"NW_BIGFARM_KITCHEN_09");
};

