
instance PAL_267_Sengrath(Npc_Default)
{
	name[0] = "Сенграт";
	guild = GIL_PAL;
	id = 267;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal03,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_267;
};


func void Rtn_Start_267()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_GUARD_01");
};

func void Rtn_ORCBARRIER_267()
{
	TA_Sleep(8,0,23,0,"OW_ORCBARRIER_12");
	TA_Sleep(23,0,8,0,"OW_ORCBARRIER_12");
};

