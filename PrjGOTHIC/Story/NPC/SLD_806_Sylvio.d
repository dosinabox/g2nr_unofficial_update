
instance SLD_806_Sylvio(Npc_Default)
{
	name[0] = "Сильвио";
	guild = GIL_SLD;
	id = 806;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Scar,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_806;
};


func void Rtn_Start_806()
{
	TA_Sit_Chair(8,0,22,0,"NW_BIGFARM_KITCHEN_BULLCO");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_KITCHEN_BULLCO");
};

func void Rtn_Tot_806()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

