
instance BDT_10030_Addon_Buddler(Npc_Default)
{
	name[0] = NAME_Addon_Buddler;
	guild = GIL_BDT;
	id = 10030;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart_Cronos,BodyTex_P,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10030;
};


func void Rtn_Start_10030()
{
	TA_Stand_Drinking(6,0,12,0,"ADW_MINE_22");
	TA_Stand_Drinking(12,0,6,0,"ADW_MINE_22");
};

