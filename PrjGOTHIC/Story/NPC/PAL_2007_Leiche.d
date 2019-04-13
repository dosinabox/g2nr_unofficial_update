
instance PAL_2007_Leiche(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 2007;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_2007;
};


func void Rtn_Start_2007()
{
	TA_Stand_Guarding(8,0,23,0,"OW_RITTER_LEICHE_02");
	TA_Stand_Guarding(23,0,8,0,"OW_RITTER_LEICHE_02");
};

