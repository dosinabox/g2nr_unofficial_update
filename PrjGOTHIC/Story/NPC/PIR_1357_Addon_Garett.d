
instance PIR_1357_Addon_Garett(Npc_Default)
{
	name[0] = "Гаретт";
	guild = GIL_PIR;
	id = 1357;
	voice = 9;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	CreateInvItems(self,ItBe_Addon_Prot_EdgPoi,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart05,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_1357;
};


func void Rtn_Start_1357()
{
	TA_Stand_WP(8,0,20,0,"ADW_PIRATECAMP_HUT1_01");
	TA_Stand_Drinking(20,0,8,0,"ADW_PIRATECAMP_BEACH_10");
};

