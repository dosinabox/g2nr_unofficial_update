
instance Mil_333_Stadtwache(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 333;
	voice = 6;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal03,BodyTex_P,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_333;
};


func void Rtn_Start_333()
{
	TA_Guard_Passage(8,0,22,0,"NW_CITY_ENTRANCE_BACK_GUARD_02");
	TA_Guard_Passage(22,0,8,0,"NW_CITY_ENTRANCE_BACK_GUARD_02");
};

