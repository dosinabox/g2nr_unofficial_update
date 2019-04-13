
instance PC_Mage_DI(Npc_Default)
{
	name[0] = "Милтен";
	guild = GIL_KDF;
	id = 22;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_22;
};


func void Rtn_Start_22()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_19");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_19");
};

func void Rtn_UNDEADDRAGONDEAD_22()
{
	TA_Stand_WP(8,0,23,0,"SKELETTE");
	TA_Stand_WP(23,0,8,0,"SKELETTE");
};

func void Rtn_SittingShipDI_22()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_CREW_19");
	TA_Sit_Bench(23,0,8,0,"SHIP_CREW_19");
};

