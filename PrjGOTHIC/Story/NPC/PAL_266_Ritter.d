
instance PAL_266_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 266;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal01,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = Rtn_Start_266;
};


func void Rtn_Start_266()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_GUARD_04");
	TA_Sit_Campfire(23,0,8,0,"OC_GUARD_ROOM_01_FIRE");
};

