
instance SLD_823_Khaled(Npc_Default)
{
	name[0] = "�����";
	guild = GIL_SLD;
	id = 823;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Crossbow_H_01);
	B_CreateItemToSteal(self,78,ItMi_Gold,85);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Thorus,BodyTex_B,ITAR_SLD_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_823;
};


func void Rtn_Start_823()
{
	TA_Stand_Guarding(7,55,21,55,"NW_BIGFARM_HOUSE_12");
	TA_Stand_Eating(21,55,23,55,"NW_BIGFARM_HOUSE_UP2_06");
	TA_Sleep(23,55,7,55,"NW_BIGFARM_HOUSE_UP2_02");
};

