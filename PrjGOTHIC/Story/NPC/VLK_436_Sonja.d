
instance VLK_436_Sonja(Npc_Default)
{
	name[0] = "Соня";
	guild = GIL_VLK;
	id = 436;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe6",FaceBabe_L_Charlotte2,BodyTexBabe_L,ITAR_VlkBabe_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_436;
};


func void Rtn_Start_436()
{
	TA_Sit_Throne(8,0,23,0,"NW_CITY_PUFF_THRONE");
	TA_Sit_Throne(23,0,8,0,"NW_CITY_PUFF_THRONE");
};

