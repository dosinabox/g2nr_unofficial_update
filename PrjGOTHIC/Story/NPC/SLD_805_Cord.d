
instance SLD_805_Cord(Npc_Default)
{
	name[0] = "����";
	guild = GIL_SLD;
	id = 805;
	voice = 14;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_SubGuild] = GIL_SUB_Ranger;
	aivar[AIV_Teeth] = 1;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,65,ItMi_Gold,75);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Cord,BodyTex_N,ITAR_SLD_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetTeacherFightSkills(self,TeachLimit_1H_Cord,TeachLimit_2H_Cord,70,70);
	daily_routine = Rtn_Start_805;
};


func void Rtn_Start_805()
{
	TA_Practice_Sword(7,40,22,40,"NW_BIGFARM_CORD");
	TA_Sleep(22,40,7,40,"NW_BIGFARM_HOUSE_15");
};

func void Rtn_PreRangerMeeting_805()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_04");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_04");
};

func void Rtn_RangerMeeting_805()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_805()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_ArmsCrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

