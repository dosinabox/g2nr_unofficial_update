
instance STRF_1115_Geppert(Npc_Default)
{
	name[0] = "Гепперт";
	guild = GIL_STRF;
	id = 1115;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1115;
};


func void Rtn_Start_1115()
{
	TA_Roast_Scavenger(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	TA_Roast_Scavenger(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

func void Rtn_Tot_1115()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

