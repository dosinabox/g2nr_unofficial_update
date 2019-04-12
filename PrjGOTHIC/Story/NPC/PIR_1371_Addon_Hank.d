
instance PIR_1371_Addon_Hank(Npc_Default)
{
	name[0] = "Хэнк";
	guild = GIL_PIR;
	id = 1371;
	voice = 6;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Lefty,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1370;
};


func void Rtn_Start_1371()
{
	TA_Smalltalk(5,0,20,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
	TA_Smalltalk(20,0,5,0,"ADW_PIRATECAMP_WATERHOLE_CAVE");
};

