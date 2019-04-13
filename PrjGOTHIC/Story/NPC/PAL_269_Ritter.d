
instance PAL_269_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 269;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Erpresser,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_269;
};


func void Rtn_Start_269()
{
	TA_Stand_Guarding(8,0,21,0,"OC_EBR_STAND_THRONE_01");
	TA_Stand_Guarding(21,0,8,0,"OC_EBR_FLOOR_02");
};

