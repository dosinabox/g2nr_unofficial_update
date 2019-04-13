
instance PAL_2006_Leiche(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 2006;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Pacho,BodyTex_B,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_2006;
};


func void Rtn_Start_2006()
{
	TA_Stand_Guarding(8,0,23,0,"OW_RITTER_LEICHE_01");
	TA_Stand_Guarding(23,0,8,0,"OW_RITTER_LEICHE_01");
};

