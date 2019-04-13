
instance Mil_305_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_MIL;
	id = 305;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal01,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_305;
};


func void Rtn_Start_305()
{
	TA_Guard_Passage(8,0,22,0,"NW_CITY_UPTOWN_GUARD_02");
	TA_Guard_Passage(22,0,8,0,"NW_CITY_UPTOWN_GUARD_02");
};

