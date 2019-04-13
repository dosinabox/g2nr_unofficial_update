
instance Pal_289_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 289;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal_Kirgo,BodyTex_B,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_289;
};


func void Rtn_Start_289()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_PALCAMP_15");
	TA_Smalltalk(23,0,8,0,"NW_CITY_PALCAMP_15");
};

