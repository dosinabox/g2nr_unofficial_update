
instance VLK_4151_Leiche(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4151;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4151;
};


func void Rtn_Start_4151()
{
	TA_Stand_Guarding(8,0,22,0,"OW_SPAWN_TRACK_LEICHE_00");
	TA_Stand_Guarding(22,0,8,0,"OW_SPAWN_TRACK_LEICHE_00");
};

