
instance PAL_254_Wache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 254;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBald,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_254;
};


func void Rtn_Start_254()
{
	TA_Guard_Passage(8,0,23,0,"OC_GATE_GUARD_02");
	TA_Guard_Passage(23,0,8,0,"OC_GATE_GUARD_02");
};

