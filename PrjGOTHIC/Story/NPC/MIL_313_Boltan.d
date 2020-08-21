
instance MIL_313_Boltan(Npc_Default)
{
	name[0] = "Болтан";
	guild = GIL_MIL;
	id = 313;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal01,BodyTex_B,ITAR_MIL_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,55);
	daily_routine = Rtn_Start_313;
};


func void Rtn_Start_313()
{
	TA_Sit_Chair(6,55,21,0,"NW_CITY_HABOUR_KASERN_PRISON_SIT");
	TA_Read_Bookstand(21,0,0,0,"NW_CITY_HABOUR_KASERN_PRISON_READ");
	TA_Stand_Guarding(0,0,6,55,"NW_CITY_HABOUR_KASERN_PRISON_01");
};

