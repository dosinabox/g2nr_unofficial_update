
instance NONE_Addon_114_Lance_ADW(Npc_Default)
{
	name[0] = "Ланс";
	guild = GIL_NONE;
	id = 114;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsRanger] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRi_LanceRing,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_RANGER_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_PreStart_114;
};


func void Rtn_PreStart_114()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"ADW_PATH_TO_LOCH_00");
	TA_Stand_ArmsCrossed(22,0,8,0,"ADW_PATH_TO_LOCH_00");
};

