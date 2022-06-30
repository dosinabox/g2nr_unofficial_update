
instance PAL_252_Parcival(Npc_Default)
{
	name[0] = "Парсиваль";
	guild = GIL_PAL;
	id = 252;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,84,ItMi_Gold,460);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_P_Tough_Drago,BodyTex_P,ITAR_PAL_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_252;
};


func void Rtn_Start_252()
{
	TA_Smalltalk(8,0,21,0,"OC_EBR_HALL_CENTER");
	TA_Sit_Chair(21,0,23,0,"OC_EBR_ROOM_01_SIT");
	TA_Sleep(23,0,8,0,"OC_EBR_ROOM_01_SLEEP");
};

