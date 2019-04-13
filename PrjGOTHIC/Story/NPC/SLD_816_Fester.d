
instance Sld_816_Fester(Npc_Default)
{
	name[0] = "Фестер";
	guild = GIL_SLD;
	id = 816;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart05,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	B_AddFightSkill(self,NPC_TALENT_BOW,30);
	daily_routine = Rtn_Start_816;
};


func void Rtn_Start_816()
{
	TA_Practice_Sword(5,0,6,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(6,0,7,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(7,0,8,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(8,0,9,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(9,0,10,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(10,0,11,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(11,0,12,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(12,0,13,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(13,0,14,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(14,0,15,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(15,0,16,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(16,0,17,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(17,0,18,0,"NW_BIGFARM_ALLEE_04");
	TA_Practice_Sword(18,0,19,0,"NW_BIGFARM_ALLEE_02");
	TA_Practice_Sword(19,0,20,0,"NW_BIGFARM_ALLEE_04");
	TA_Sit_Campfire(20,0,6,0,"NW_BIGFARM_VORPOSTEN1_01");
};

func void Rtn_Guide_816()
{
	TA_Guide_Player(8,0,20,0,"NW_BIGFARM_FELDREUBER4");
	TA_Guide_Player(20,0,8,0,"NW_BIGFARM_FELDREUBER4");
};

