
instance BAU_982_Grimbald(Npc_Default)
{
	name[0] = "ֳנטלבאכüה";
	guild = GIL_OUT;
	id = 982;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Normal_Kirgo,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_982;
};


func void Rtn_Start_982()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_PATH_79");
	TA_Stand_Guarding(23,0,8,0,"NW_TROLLAREA_PATH_79");
};

func void Rtn_Jagd_982()
{
	TA_RunToWP(8,0,23,0,"NW_TROLLAREA_PATH_80");
	TA_RunToWP(23,0,8,0,"NW_TROLLAREA_PATH_80");
};

func void Rtn_JagdOver_982()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_PATH_79");
	TA_Stand_Guarding(23,0,8,0,"NW_TROLLAREA_PATH_79");
};

