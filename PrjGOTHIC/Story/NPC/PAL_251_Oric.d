
instance PAL_251_Oric(Npc_Default)
{
	name[0] = "Îðèê";
	guild = GIL_PAL;
	id = 251;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Lee_ähnlich,BodyTex_N,ItAr_PAl_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_251;
};


func void Rtn_Start_251()
{
	TA_Smalltalk(8,0,21,0,"OC_EBR_HALL_CENTER");
	TA_Sleep(21,0,8,0,"OC_EBR_ROOM_02_SLEEP");
};

