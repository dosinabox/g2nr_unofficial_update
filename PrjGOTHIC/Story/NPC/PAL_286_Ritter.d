
instance Pal_286_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 286;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart06,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_286;
};


func void Rtn_Start_286()
{
	TA_Practice_Sword(8,0,23,0,"NW_CITY_PALCAMP_02");
	TA_Practice_Sword(23,0,8,0,"NW_CITY_PALCAMP_02");
};

