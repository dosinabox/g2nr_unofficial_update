
instance BDT_10018_Addon_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_BDT;
	id = 10018;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Jackal,BodyTex_L,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10018;
};


func void Rtn_Start_10018()
{
	TA_Guard_Passage(0,0,12,0,"BL_RAVEN_GUARD_01");
	TA_Guard_Passage(12,0,0,0,"BL_RAVEN_GUARD_01");
};

