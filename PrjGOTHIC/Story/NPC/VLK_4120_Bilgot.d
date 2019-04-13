
instance VLK_4120_Bilgot(Npc_Default)
{
	name[0] = "Билгот";
	guild = GIL_OUT;
	id = 4120;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItPo_Health_02,4);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Weak_Ulf_Wohlers,BodyTex_P,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4120;
};


func void Rtn_Start_4120()
{
	TA_Sit_Campfire(8,0,23,0,"OW_NEWMINE_11");
	TA_Sit_Campfire(23,0,8,0,"OW_NEWMINE_11");
};

func void Rtn_FollowToOCBridge_4120()
{
	TA_Follow_Player(8,0,23,0,"START");
	TA_Follow_Player(23,0,8,0,"START");
};

func void Rtn_FleeOutOfOW_4120()
{
	TA_Sit_Campfire(8,0,23,0,"START");
	TA_Sit_Campfire(23,0,8,0,"START");
};

func void Rtn_Tot_4120()
{
	TA_Sit_Campfire(8,0,23,0,"TOT");
	TA_Sit_Campfire(23,0,8,0,"TOT");
};

