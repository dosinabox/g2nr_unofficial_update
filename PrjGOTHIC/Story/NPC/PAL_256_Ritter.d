
instance PAL_256_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 256;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBart_Cronos,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_256;
};


func void Rtn_Start_256()
{
	TA_Practice_Sword(8,0,19,0,"OC_TRAIN_02");
	TA_Sit_Campfire(19,0,8,0,"OC_CAMPFIRE_OUT_02");
};

