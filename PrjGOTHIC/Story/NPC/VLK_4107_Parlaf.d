
instance VLK_4107_Parlaf(Npc_Default)
{
	name[0] = "Парлаф";
	guild = GIL_MIL;
	id = 4107;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Huno,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4107;
};


func void Rtn_Start_4107()
{
	TA_Smith_Sharp(8,0,20,0,"OC_SMITH_SHARP");
	TA_Sleep(20,0,8,0,"OC_GUARD_ROOM_01_SLEEP_02");
};

func void Rtn_Tot_4107()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

