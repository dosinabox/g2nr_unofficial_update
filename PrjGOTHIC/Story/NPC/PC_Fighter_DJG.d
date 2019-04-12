
instance PC_Fighter_DJG(Npc_Default)
{
	name[0] = "Горн";
	guild = GIL_DJG;
	id = 704;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItPo_Health_02,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Gorn,BodyTex_B,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_PreStart_704;
};


func void Rtn_PreStart_704()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_DJG_STARTCAMP_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void Rtn_Start_704()
{
	TA_Sit_Campfire(8,0,23,0,"OW_DJG_ROCKCAMP_01");
	TA_Sit_Campfire(23,0,8,0,"OW_DJG_ROCKCAMP_01");
};

func void Rtn_RunToRockRuinBridge_704()
{
	TA_RunToWP(8,0,23,0,"LOCATION_19_01");
	TA_RunToWP(23,0,8,0,"LOCATION_19_01");
};

func void Rtn_Tot_704()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"TOT");
	TA_Stand_ArmsCrossed(23,0,8,0,"TOT");
};

