
instance NOV_600_Pedro(Npc_Default)
{
	name[0] = "Педро";
	guild = GIL_NOV;
	id = 600;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,45,ItMi_Gold,60);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_L_Normal_GorNaBar,BodyTex_L,ITAR_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_600;
};


func void Rtn_Start_600()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_MILTEN");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_MILTEN");
};

func void Rtn_Tot_600()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

