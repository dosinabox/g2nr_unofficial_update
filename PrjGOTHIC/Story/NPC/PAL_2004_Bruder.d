
instance PAL_2004_Bruder(Npc_Default)
{
	name[0] = NAME_Paladin;
	guild = GIL_NONE;
	id = 2004;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItRu_PalLight,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ItAr_PAl_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_2004;
};


func void Rtn_Start_2004()
{
	TA_Stand_Guarding(8,0,23,0,"OW_SPAWN_BRUDER");
	TA_Stand_Guarding(23,0,8,0,"OW_SPAWN_BRUDER");
};

