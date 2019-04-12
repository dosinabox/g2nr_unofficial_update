
instance VLK_4111_Grimes(Npc_Default)
{
	name[0] = "Гримс";
	guild = GIL_OUT;
	id = 4111;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_ImportantGrey,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_4111;
};


func void Rtn_Start_4111()
{
	TA_Pick_Ore(8,0,23,0,"OW_MINE2_GRIMES");
	TA_Pick_Ore(23,0,8,0,"OW_MINE2_GRIMES");
};

