
instance VLK_416_Matteo(Npc_Default)
{
	name[0] = "Маттео";
	guild = GIL_VLK;
	id = 416;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Gomez,BodyTex_N,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_Start_416;
};


func void Rtn_Start_416()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_MATTEO");
	TA_Sleep(22,0,8,0,"NW_CITY_BED_MATTEO");
};

