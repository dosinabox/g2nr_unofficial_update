
instance VLK_4143_HaupttorWache(Npc_Default)
{
	name[0] = "Стражник у главных ворот";
	guild = GIL_VLK;
	id = 4143;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal18,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4143;
};


func void Rtn_Start_4143()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GUARD_PALISADE_09");
	TA_Stand_Guarding(23,0,8,0,"OC_GUARD_PALISADE_09");
};

