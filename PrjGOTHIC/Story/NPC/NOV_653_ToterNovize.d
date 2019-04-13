
instance NOV_653_ToterNovize(Npc_Default)
{
	name[0] = NAME_ToterNovize;
	guild = GIL_NOV;
	id = 653;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mordrag,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_653;
};


func void Rtn_Start_653()
{
	TA_Sleep(8,0,22,0,"NW_TROLLAREA_RITUALPATH_04");
	TA_Sleep(22,0,8,0,"NW_TROLLAREA_RITUALPATH_04");
};

