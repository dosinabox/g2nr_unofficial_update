
instance PAL_253_Wache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 253;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Pacho,BodyTex_B,ItAr_PAL_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_253;
};


func void Rtn_Start_253()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GATE_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_GATE_GUARD_01");
};

func void Rtn_Marcos_253()
{
	TA_Stand_Guarding(8,0,23,0,"OW_STAND_GUARDS");
	TA_Stand_Guarding(23,0,8,0,"OW_STAND_GUARDS");
};

