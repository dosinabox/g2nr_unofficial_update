
instance Vlk_402_Richter(Npc_Default)
{
	name[0] = "Судья";
	guild = GIL_VLK;
	id = 402;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Richter,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Richter,BodyTex_N,ITAR_Judge);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_402;
};


func void Rtn_Start_402()
{
	TA_Read_Bookstand(8,0,18,45,"NW_CITY_RICHTER_BED");
	TA_Sit_Throne(18,45,22,0,"NW_CITYHALL_PRIVATE_THRONE");
	TA_Sit_Throne(22,0,1,0,"NW_CITY_RICHTER");
	TA_Sleep(1,0,8,0,"NW_CITY_RICHTER_BED");
};

