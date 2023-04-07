
instance PAL_2003_Leiche(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 2003;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart01,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_2003;
};


func void Rtn_Start_2003()
{
	TA_Stand_Guarding(8,0,23,0,"OW_MINE3_LEICHE_04");
	TA_Stand_Guarding(23,0,8,0,"OW_MINE3_LEICHE_04");
};

