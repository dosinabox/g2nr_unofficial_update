
instance VLK_420_Coragon(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_VLK;
	id = 420;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_NPCIsTrader] = TRUE;
	B_SetFightSkills(self,40);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateItemToSteal(self,40,ItMi_Gold,45);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Blade,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_SetAttributesToChapter(self,3);
	B_GiveNpcTalents(self);
	daily_routine = Rtn_Start_420;
};


func void Rtn_Start_420()
{
	TA_Sit_Chair(8,0,12,0,"TAVERN02_B");
	TA_Stand_ArmsCrossed(12,0,8,0,"NW_CITY_TAVERN_IN_03");
};

