
instance PIR_1389_Addon_Tom(Npc_Default)
{
	name[0] = "Том";
	guild = GIL_PIR;
	id = 1389;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ElBastardo);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FIGHTER",Face_N_Normal19,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1389;
};


func void Rtn_Start_1389()
{
	TA_Stand_WP(9,0,21,0,"ADW_PIRATECAMP_BEACH_15");
	TA_Stand_WP(21,0,9,0,"ADW_PIRATECAMP_BEACH_15");
};

