
instance BDT_10012_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10012;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_TAL_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough_Santino,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10012;
};


func void Rtn_Start_10012()
{
	TA_Sit_Bench(22,2,6,0,"ADW_SWAMP_SIT_BENCH_01");
	TA_Smalltalk(6,0,22,2,"BL_FIGHT_03");
};

