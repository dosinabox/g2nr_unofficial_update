
instance BAU_917_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 917;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal03,BodyTex_P,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_917;
};


func void Rtn_Start_917()
{
	TA_Smalltalk(8,5,22,5,"NW_BIGFARM_KITCHEN_02");
	TA_Smalltalk(22,5,8,5,"NW_BIGFARM_KITCHEN_02");
};

