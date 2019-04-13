
instance VLK_4108_Engor(Npc_Default)
{
	name[0] = "Ёнгор";
	guild = GIL_MIL;
	id = 4108;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Jackal,BodyTex_L,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4108;
};


func void Rtn_Start_4108()
{
	TA_Read_Bookstand(8,0,22,0,"OC_COUNT_01");
	TA_Sleep(22,0,8,0,"OC_GUARD_ROOM_03_SLEEP");
};

