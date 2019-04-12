
instance STRF_1106_Fed(Npc_Default)
{
	name[0] = "‘Â‰";
	guild = GIL_OUT;
	id = 1106;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Gilbert,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1106;
};


func void Rtn_Start_1106()
{
	TA_Pick_Ore(8,0,23,0,"OW_NEWMINE_06_B");
	TA_Pick_Ore(23,0,8,0,"OW_NEWMINE_06_B");
};

