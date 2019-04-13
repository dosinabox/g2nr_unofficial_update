
instance VLK_4109_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4109;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Ricelord,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4109;
};


func void Rtn_Start_4109()
{
	TA_Sit_Campfire(8,0,22,0,"OC_PRISON_TO_KITCHEN");
	TA_Sit_Campfire(22,0,8,0,"OC_PRISON_TO_KITCHEN");
};

