
instance Pal_207_Girion_DI(Npc_Default)
{
	name[0] = "Гирион";
	guild = GIL_PAL;
	id = 2070;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lefty,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_2070;
};


func void Rtn_Start_2070()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_18");
	TA_Sit_Bench(23,0,8,0,"SHIP_DECK_18");
};

