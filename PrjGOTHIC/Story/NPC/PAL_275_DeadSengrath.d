
instance PAL_275_DeadSengrath(Npc_Default)
{
	name[0] = "Сенграт";
	guild = GIL_PAL;
	id = 275;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_NAILED;
	CreateInvItems(self,ItRw_SengrathsArmbrust_MIS,1);
	CreateInvItems(self,ItPo_Mana_01,10);
	CreateInvItems(self,ItPo_Mana_02,5);
	CreateInvItems(self,ItSc_PalLightHeal,3);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal03,BodyTex_N,ITAR_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_275;
};


func void Rtn_Start_275()
{
	TA_Sleep(8,0,23,0,"OW_ORCBARRIER_12");
	TA_Sleep(23,0,8,0,"OW_ORCBARRIER_12");
};

