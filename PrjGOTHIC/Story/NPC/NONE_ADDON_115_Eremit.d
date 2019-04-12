
instance NONE_ADDON_115_Eremit(Npc_Default)
{
	name[0] = "Отшельник";
	guild = GIL_NONE;
	id = 115;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Weak_BaalNetbek,BodyTex_N,NO_ARMOR);
	Mdl_SetModelFatness(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_115;
};


func void Rtn_Start_115()
{
	TA_Sit_Bench(7,0,9,0,"ADW_VALLEY_BENCH");
	TA_Cook_Pan(9,0,11,0,"ADW_VALLEY_BENCH");
	TA_Stand_Eating(11,0,13,0,"ADW_VALLEY_BENCH");
	TA_Sit_Bench(13,0,15,0,"ADW_VALLEY_BENCH");
	TA_Cook_Pan(15,0,17,0,"ADW_VALLEY_BENCH");
	TA_Stand_Eating(17,0,19,0,"ADW_VALLEY_BENCH");
	TA_Sit_Bench(19,0,1,0,"ADW_VALLEY_BENCH");
	TA_Sleep(1,0,7,0,"ADW_VALLEY_PATH_031_HUT");
};

