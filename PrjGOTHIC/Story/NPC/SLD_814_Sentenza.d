
instance SLD_814_Sentenza(Npc_Default)
{
	name[0] = "Сентенза";
	guild = GIL_SLD;
	id = 814;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_FollowTime] = 60;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	CreateInvItems(self,ItFo_Apple,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Tough_Okyl,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_814;
};


func void Rtn_Start_814()
{
	TA_Stand_Eating(8,0,22,0,"NW_BIGFARM_ALLEE_01");
	TA_Stand_Eating(22,0,8,0,"NW_BIGFARM_ALLEE_01");
};

func void Rtn_Follow_814()
{
	TA_Follow_Player(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_02");
	TA_Follow_Player(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_02");
};

