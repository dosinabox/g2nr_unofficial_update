
instance BDT_1088_Addon_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_BDT;
	id = 1088;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Huno,BodyTex_N,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,85);
	daily_routine = Rtn_Start_1088;
};


func void Rtn_Start_1088()
{
	TA_Guard_Passage(9,0,21,0,"BL_UP_GUARD");
	TA_Guard_Passage(21,0,9,0,"BL_UP_GUARD");
};

