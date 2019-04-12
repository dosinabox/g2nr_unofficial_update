
instance BDT_10029_Addon_Buddler(Npc_Default)
{
	name[0] = NAME_Addon_Buddler;
	guild = GIL_BDT;
	id = 10029;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Jackal,BodyTex_L,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_10029;
};


func void Rtn_Start_10029()
{
	TA_Stand_Drinking(6,0,12,0,"ADW_MINE_25");
	TA_Stand_Drinking(12,0,6,0,"ADW_MINE_25");
};

func void Rtn_Work_10029()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_PICK_01");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_PICK_01");
};

