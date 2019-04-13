
instance KDF_500_Pyrokar(Npc_Default)
{
	name[0] = "Пирокар";
	guild = GIL_KDF;
	id = 500;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ItAr_KDF_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_500;
};


func void Rtn_Start_500()
{
	TA_Sit_Throne(8,0,23,0,"NW_MONASTERY_THRONE_01");
	TA_Sit_Throne(23,0,8,0,"NW_MONASTERY_THRONE_01");
};

func void Rtn_RitualInnosEyeRepair_500()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	TA_Stand_Guarding(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

func void Rtn_RitualInnosEye_500()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_02");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_02");
};

