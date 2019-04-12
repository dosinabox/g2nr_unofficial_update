
instance STRF_1107_Straefling(Npc_Default)
{
	name[0] = "Повар";
	guild = GIL_STRF;
	id = 1107;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart04,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1107;
};


func void Rtn_Start_1107()
{
	TA_Cook_Cauldron(8,0,23,0,"OC_EBR_KITCHEN_COOK");
	TA_Cook_Cauldron(23,0,8,0,"OC_EBR_KITCHEN_COOK");
};

