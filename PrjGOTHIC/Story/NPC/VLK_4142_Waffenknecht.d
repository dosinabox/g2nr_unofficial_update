
instance VLK_4142_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4142;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_BaalNetbek,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4142;
};


func void Rtn_Start_4142()
{
	TA_Smalltalk(8,0,23,0,"OC_CENTER_02");
	TA_Sit_Campfire(23,0,8,0,"OC_KNECHTCAMP_02");
};

