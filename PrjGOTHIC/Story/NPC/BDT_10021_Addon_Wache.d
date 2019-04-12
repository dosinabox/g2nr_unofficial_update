
instance BDT_10021_Addon_Wache(Npc_Default)
{
	name[0] = NAME_Addon_Guard;
	guild = GIL_BDT;
	id = 10021;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender4);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Normal02,BodyTex_P,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10021;
};


func void Rtn_Start_10021()
{
	TA_Stand_Guarding(0,0,12,0,"BL_RAVEN_GUARD_04");
	TA_Stand_Guarding(12,0,0,0,"BL_RAVEN_GUARD_04");
};

