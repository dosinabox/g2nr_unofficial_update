
instance SLD_800_Lee_DI(Npc_Default)
{
	name[0] = "ห่";
	guild = GIL_SLD;
	id = 8000;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lee,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_8000;
};


func void Rtn_Start_8000()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_CREW_01");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void Rtn_UNDEADDRAGONDEAD_8000()
{
	TA_Stand_Guarding(8,0,23,0,"DI_ORKAREA_14");
	TA_Stand_Guarding(23,0,8,0,"DI_ORKAREA_14");
};

