
instance STRF_1116_Kervo(Npc_Default)
{
	name[0] = "Керво";
	guild = GIL_STRF;
	id = 1116;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak12,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,5);
	daily_routine = Rtn_Start_1116;
};


func void Rtn_Start_1116()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

func void Rtn_Tot_1116()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

