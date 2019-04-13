
instance VLK_4150_Leiche(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4150;
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
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal01,BodyTex_B,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4150;
};


func void Rtn_Start_4150()
{
	TA_Stand_Guarding(8,0,22,0,"OW_MINE3_LEICHE_03");
	TA_Stand_Guarding(22,0,8,0,"OW_MINE3_LEICHE_03");
};

