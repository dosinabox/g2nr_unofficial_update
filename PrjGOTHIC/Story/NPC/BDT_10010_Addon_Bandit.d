
instance BDT_10010_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10010;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Nagelknueppel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_NormalBart_Rufus,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10010;
};


func void Rtn_Start_10010()
{
	TA_Sit_Bench(10,0,12,0,"BL_MID_09");
	TA_Sit_Bench(12,0,10,0,"BL_MID_09");
};

