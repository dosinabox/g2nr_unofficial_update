
instance BDT_1030_Morgahard(Npc_Default)
{
	name[0] = "Моргахард";
	guild = GIL_OUT;
	id = 1030;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,73,ItMi_Gold,45);
	CreateInvItems(self,ItWr_RichterKomproBrief_MIS,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Bartholo,BodyTex_N,ITAR_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1030;
};


func void Rtn_Start_1030()
{
	TA_Smalltalk(8,0,23,0,"NW_BIGFARM_HOUSE_OUT_05");
	TA_Smalltalk(23,0,8,0,"NW_BIGFARM_HOUSE_OUT_05");
};

