
instance Pal_219_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_OUT;
	id = 218;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBald01,BodyTex_L,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_219;
};


func void Rtn_Start_219()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_264");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_264");
};

