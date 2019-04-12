
instance BAU_921_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 921;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Dusty,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_921;
};


func void Rtn_Start_921()
{
	TA_Smalltalk(7,55,19,55,"NW_BIGFARM_STABLE_OUT_01");
	TA_Smalltalk(19,55,21,55,"NW_BIGFARM_PATH_04_1");
	TA_Smalltalk(21,55,7,55,"NW_BIGFARM_STABLE_01");
};

