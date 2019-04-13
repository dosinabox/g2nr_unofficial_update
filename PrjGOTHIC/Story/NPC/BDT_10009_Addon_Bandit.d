
instance BDT_10009_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10009;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Nagelknueppel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Cutter,BodyTex_P,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10009;
};


func void Rtn_Start_10009()
{
	TA_Pee(10,0,10,10,"BL_UP_PEE");
	TA_Smalltalk(10,10,12,0,"BL_UP_RING_02");
	TA_Stand_Drinking(12,0,12,10,"BL_UP_RING_02");
	TA_Smalltalk(12,10,10,0,"BL_UP_RING_04");
};

