
instance VLK_4108_Engor(Npc_Default)
{
	name[0] = "Ёнгор";
	guild = GIL_MIL;
	id = 4108;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	aivar[AIV_DexToSteal] = 40;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItem(self,ItWr_Map_OldWorld);
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Jackal,BodyTex_L,ITAR_MIL_M);
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


func void Rtn_OrcAttack_4108()
{
	TA_Sleep(8,0,22,0,"OC_GUARD_IN_01");
	TA_Sleep(22,0,8,0,"OC_GUARD_IN_01");
};

