
instance Mil_325_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 325;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Tough_Silas,BodyTex_B,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_325;
};


func void Rtn_Start_325()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITY_MERCHANT_PATH_02");
	TA_Guard_Passage(23,0,8,0,"NW_CITY_MERCHANT_PATH_02");
};

