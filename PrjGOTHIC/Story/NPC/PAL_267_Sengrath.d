
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
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal03,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PreStart_267;
};


func void Rtn_PreStart_267()
{
	TA_Stand_Guarding(8,0,23,0,"OC_RAMP_17");
	TA_Stand_Guarding(23,0,8,0,"OC_RAMP_17");
};

func void Rtn_Start_267()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_GUARD_02");
};

func void Rtn_Tot_267()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

