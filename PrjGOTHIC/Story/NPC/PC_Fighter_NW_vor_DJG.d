
instance PC_Fighter_NW_vor_DJG(Npc_Default)
{
	name[0] = "Горн";
	guild = GIL_SLD;
	id = 813;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Gorn,BodyTex_B,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_813;
};


func void Rtn_Start_813()
{
	TA_Sit_Chair(8,0,23,0,"NW_BIGFARM_HOUSE_14");
	TA_Sit_Chair(23,0,8,0,"NW_BIGFARM_HOUSE_14");
};

func void Rtn_Tot_813()
{
	TA_Sit_Campfire(8,0,23,0,"TOT");
	TA_Sit_Campfire(23,0,8,0,"TOT");
};

