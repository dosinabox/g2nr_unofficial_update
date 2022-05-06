
instance VLK_4201_Wirt(Npc_Default)
{
	name[0] = "Трактирщик";
	guild = GIL_VLK;
	id = 4201;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_CreateItemToSteal(self,60,ItMi_Gold,65);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_4201;
};


func void Rtn_Start_4201()
{
	TA_Stand_Guarding(6,0,21,0,"NW_CITY_BEER_02");
	TA_Pee(21,0,21,10,"NW_CITY_KASERN_PLACE_01");
	TA_Stand_Drinking(21,10,3,30,"NW_CITY_BEER_02");
	TA_Sit_Chair(3,30,4,30,"NW_CITY_BEER_02");
	TA_Pee(4,30,4,40,"NW_CITY_KASERN_PLACE_01");
	TA_Sit_Chair(4,40,6,0,"NW_CITY_BEER_02");
};

