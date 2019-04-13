
instance Bau_900_Onar(Npc_Default)
{
	name[0] = "Онар";
	guild = GIL_BAU;
	id = 900;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_900;
};


func void Rtn_Start_900()
{
	TA_Sit_Throne(9,0,21,0,"NW_BIGFARM_HOUSE_ONAR_SIT");
	TA_Sleep(21,0,9,0,"NW_BIGFARM_HOUSE_UP1_04");
};

