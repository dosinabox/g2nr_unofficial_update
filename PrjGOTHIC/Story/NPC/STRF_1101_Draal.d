
instance STRF_1101_Draal(Npc_Default)
{
	name[0] = "Äðààë";
	guild = GIL_STRF;
	id = 1101;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBald,BodyTex_P,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1101;
};


func void Rtn_Start_1101()
{
	TA_Sit_Campfire(8,0,23,0,"OC_PRISON_CELL_02_SIT_GROUND");
	TA_Sit_Campfire(23,0,8,0,"OC_PRISON_CELL_02_SIT_GROUND");
};

