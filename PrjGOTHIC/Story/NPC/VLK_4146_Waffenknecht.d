
instance VLK_4146_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4146;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4146;
};


func void Rtn_Start_4146()
{
	TA_Practice_Sword(8,0,23,0,"OC_TRAIN_04");
	TA_Practice_Sword(23,0,8,0,"OC_TRAIN_04");
};

