
instance PIR_1370_Addon_Angus(Npc_Default)
{
	name[0] = "Ангус";
	guild = GIL_PIR;
	id = 1370;
	voice = 6;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	CreateInvItems(self,ItRi_Addon_MorgansRing_Mission,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart21,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1370;
};


func void Rtn_Start_1370()
{
	TA_Smalltalk(5,0,20,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
	TA_Smalltalk(20,0,5,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
};

