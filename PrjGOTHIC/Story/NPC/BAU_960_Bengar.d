
instance BAU_960_Bengar(Npc_Default)
{
	name[0] = "Бенгар";
	guild = GIL_OUT;
	id = 960;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Olli_Kahn,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_960;
};


func void Rtn_Start_960()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM3_BENGAR");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM3_BENGAR");
};

func void Rtn_MilComing_960()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_BENGAR");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_BENGAR");
};

