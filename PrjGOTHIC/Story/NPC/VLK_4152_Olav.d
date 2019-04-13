
instance VLK_4152_Olav(Npc_Default)
{
	name[0] = "Юырт";
	guild = GIL_MIL;
	id = 4152;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItSe_Olav,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart22,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4152;
};


func void Rtn_Start_4152()
{
	TA_Stand_Guarding(8,0,23,0,"OW_WOLFHUT_01");
	TA_Stand_Guarding(23,0,8,0,"OW_WOLFHUT_01");
};

