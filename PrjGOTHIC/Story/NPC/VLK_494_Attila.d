
instance VLK_494_Attila(Npc_Default)
{
	name[0] = "Аттил";
	guild = GIL_VLK;
	id = 494;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_DropDeadAndKill] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Mil_Crossbow);
	CreateInvItem(self,ItKe_ThiefGuildKey_MIS);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough_Santino,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_494;
};


func void Rtn_Start_494()
{
	TA_Stand_Guarding(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
	TA_Stand_Guarding(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
};

func void Rtn_After_494()
{
	TA_Stand_Guarding(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Stand_Guarding(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};

