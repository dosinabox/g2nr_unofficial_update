
instance PIR_1301_Addon_Skip_NW(Npc_Default)
{
	name[0] = "Скип";
	guild = GIL_PIR;
	id = 1301;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ShortSword2);
	EquipItem(self,ItRw_Sld_Bow);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Pirat01,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1301;
};


func void Rtn_Start_1301()
{
	TA_Sit_Campfire(5,0,20,0,"NW_CITY_PIRATESCAMP_04");
	TA_Sit_Campfire(20,0,5,0,"NW_CITY_PIRATESCAMP_04");
};

func void Rtn_Tot_1301()
{
	TA_Sit_Campfire(5,0,20,0,"TOT");
	TA_Sit_Campfire(20,0,5,0,"TOT");
};

