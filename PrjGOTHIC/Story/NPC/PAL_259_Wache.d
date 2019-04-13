
instance PAL_259_Wache(Npc_Default)
{
	name[0] = NAME_Wache;
	guild = GIL_PAL;
	id = 259;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_ToughBald_Nek,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_259;
};


func void Rtn_Start_259()
{
	TA_Stand_Guarding(8,0,23,0,"OC_OPEN_ROOM_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_OPEN_ROOM_GUARD_01");
};

