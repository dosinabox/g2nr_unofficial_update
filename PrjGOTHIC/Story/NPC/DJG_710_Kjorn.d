
instance DJG_710_Kjorn(Npc_Default)
{
	name[0] = "Êימנם";
	guild = GIL_DJG;
	id = 710;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal02,BodyTex_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PreStart_710;
};


func void Rtn_PreStart_710()
{
	TA_Smalltalk(8,0,23,0,"OW_PATH_1_5_3A");
	TA_Smalltalk(23,0,8,0,"OW_PATH_1_5_3A");
};

func void Rtn_Start_710()
{
	TA_Sit_Bench(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	TA_Sit_Bench(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

