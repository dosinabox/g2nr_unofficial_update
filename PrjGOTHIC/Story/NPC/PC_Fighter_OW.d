
instance PC_Fighter_OW(Npc_Default)
{
	name[0] = "Горн";
	guild = GIL_NONE;
	id = 3;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Gorn,BodyTex_B,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_3;
};


func void Rtn_Start_3()
{
	TA_Sit_Campfire(8,0,23,0,"OC_PRISON_CELL_03_SIT_GROUND");
	TA_Sit_Campfire(23,0,8,0,"OC_PRISON_CELL_03_SIT_GROUND");
};

func void Rtn_Free_3()
{
	TA_Smalltalk(8,0,23,0,"OC_MAGE_LIBRARY_IN");
	TA_Smalltalk(23,0,8,0,"OC_MAGE_LIBRARY_IN");
};

func void Rtn_Tot_3()
{
	TA_Sit_Campfire(8,0,23,0,"TOT");
	TA_Sit_Campfire(23,0,8,0,"TOT");
};

