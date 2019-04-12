
instance VLK_447_Cassia(Npc_Default)
{
	name[0] = "Кассия";
	guild = GIL_OUT;
	id = 447;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Meisterdegen);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_ThiefGuildKey_Hotel_MIS,1);
	CreateInvItems(self,ItKe_ThiefTreasure,1);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_N,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_447;
};


func void Rtn_Start_447()
{
	TA_Read_Bookstand(7,0,23,0,"NW_CITY_KANAL_ROOM_05_02");
	TA_Sleep(23,0,7,0,"NW_CITY_KANAL_ROOM_05_BED_01");
};

