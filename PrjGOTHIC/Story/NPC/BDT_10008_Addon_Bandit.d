
instance BDT_10008_Addon_Bandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 10008;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2H_OrcAxe_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Tough_Silas,BodyTex_B,ITAR_Prisoner);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_10008;
};


func void Rtn_Start_10008()
{
	TA_Cook_Cauldron(8,0,12,0,"BL_DOWN_CENTER_07");
	TA_Pee(12,0,12,5,"BL_DOWN_CENTER_07_C");
	TA_Cook_Cauldron(12,5,16,0,"BL_DOWN_CENTER_07");
	TA_Pee(16,0,16,5,"BL_DOWN_CENTER_07_C");
	TA_Cook_Cauldron(16,5,0,0,"BL_DOWN_CENTER_07");
	TA_Pee(0,0,0,5,"BL_DOWN_CENTER_07_C");
	TA_Sit_Bench(0,5,8,0,"BL_DOWN_RING_05");
};

