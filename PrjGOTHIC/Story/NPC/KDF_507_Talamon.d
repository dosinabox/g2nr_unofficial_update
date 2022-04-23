
instance KDF_507_Talamon(Npc_Default)
{
	name[0] = "Таламон";
	guild = GIL_KDF;
	id = 507;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_DexToSteal] = 87;
	aivar[AIV_GoldToSteal] = 140;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Saturas,BodyTex_B,ITAR_KDF_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_507;
};


func void Rtn_Start_507()
{
	TA_Guard_Passage(8,0,23,0,"NW_MONASTERY_CELLAR_15");
	TA_Guard_Passage(23,0,8,0,"NW_MONASTERY_CELLAR_15");
};

func void Rtn_PassGranted_507()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_CELLAR_15");
	TA_Sleep(23,0,8,0,"NW_MONASTERY_MAGE01_BED_02");
};

