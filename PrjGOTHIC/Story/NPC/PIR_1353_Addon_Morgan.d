
instance PIR_1353_Addon_Morgan(Npc_Default)
{
	name[0] = "Морган";
	guild = GIL_PIR;
	id = 1353;
	voice = 7;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Doppelaxt);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough_Santino,BodyTex_L,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_START_1353;
};


func void Rtn_START_1353()
{
	TA_Sleep(5,0,20,0,"ADW_PIRATECAMP_CAVE_BED");
	TA_Sleep(20,0,5,0,"ADW_PIRATECAMP_CAVE_BED");
};

func void Rtn_GregIsBack_1353()
{
	TA_Saw(23,0,9,0,"ADW_PIRATECAMP_SAW_01");
	TA_Saw(9,0,23,0,"ADW_PIRATECAMP_SAW_01");
};

