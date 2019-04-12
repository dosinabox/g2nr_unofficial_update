
instance BDT_1098_Addon_Snaf(Npc_Default)
{
	name[0] = "—Ì‡Ù";
	guild = GIL_BDT;
	id = 1098;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItFo_Addon_LousHammer,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Snaf,BodyTex_N,ITAR_Barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_1098;
};


func void Rtn_Start_1098()
{
	TA_Stand_Sweeping(7,0,10,0,"BL_INN_BAR_02");
	TA_Stand_WP(10,0,15,0,"BL_INN_BAR_05");
	TA_Cook_Cauldron(15,0,21,0,"BL_INN_BAR_05");
	TA_Stand_WP(21,0,7,0,"BL_INN_BAR_05");
};

