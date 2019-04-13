
instance Pal_205_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_PAL;
	id = 205;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_NewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_205;
};


func void Rtn_Start_205()
{
	TA_Guard_Passage(8,0,23,0,"NW_CITYHALL_GUARD_02");
	TA_Guard_Passage(23,0,8,0,"NW_CITYHALL_GUARD_02");
};

