
instance DJG_711_Godar(Npc_Default)
{
	name[0] = "Годар";
	guild = GIL_DJG;
	id = 711;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal14,BodyTex_N,itar_djg_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PreStart_711;
};


func void Rtn_PreStart_711()
{
	TA_Smalltalk(8,0,23,0,"OW_PATH_1_5_3A");
	TA_Smalltalk(23,0,8,0,"OW_PATH_1_5_3A");
};

func void Rtn_Start_711()
{
	TA_Roast_Scavenger(8,0,23,0,"OW_DJG_VORPOSTEN_01");
	TA_Roast_Scavenger(23,0,8,0,"OW_DJG_VORPOSTEN_01");
};

