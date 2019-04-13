
instance BDT_1078_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1078;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_TAL_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1H_Mace_L_01);
	EquipItem(self,ItRw_Bow_M_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Richter,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,-0.75);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1078;
};


func void Rtn_Start_1078()
{
	TA_Sit_Campfire(20,0,12,5,"ADW_BANDIT_VP1_08_B");
	TA_Stand_Guarding(12,5,20,0,"ADW_BANDIT_VP1_07_B");
};

