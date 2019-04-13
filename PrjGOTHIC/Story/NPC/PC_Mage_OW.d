
instance PC_Mage_OW(Npc_Default)
{
	name[0] = "Милтен";
	guild = GIL_KDF;
	id = 2;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_2;
};


func void Rtn_Start_2()
{
	TA_Potion_Alchemy(8,0,23,0,"OC_MAGE_LAB_ALCHEMY");
	TA_Read_Bookstand(23,0,8,0,"OC_MAGE_LIBRARY_BOOK_01");
};

func void Rtn_GornFree_2()
{
	TA_Smalltalk(8,0,23,0,"OC_MAGE_LIBRARY_IN");
	TA_Smalltalk(23,0,8,0,"OC_MAGE_LIBRARY_IN");
};

func void Rtn_Tot_2()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

