
instance BAU_974_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_OUT;
	id = 974;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dexter,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_974;
};


func void Rtn_Start_974()
{
	TA_Play_Lute(8,0,22,0,"NW_TAVERNE_IN_07");
	TA_Play_Lute(22,0,8,0,"NW_TAVERNE_IN_07");
};

func void Rtn_GregInTaverne_974()
{
	TA_Sit_Chair(8,0,22,0,"NW_TAVERNE_IN_05");
	TA_Sit_Chair(22,0,8,0,"NW_TAVERNE_IN_05");
};

