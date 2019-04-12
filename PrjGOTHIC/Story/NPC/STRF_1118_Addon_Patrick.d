
instance STRF_1118_Addon_Patrick(Npc_Default)
{
	name[0] = "Патрик";
	guild = GIL_STRF;
	id = 1118;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_NormalBart02,BodyTex_L,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1118;
};


func void Rtn_Start_1118()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_LAGER_05");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_LAGER_05");
};

func void Rtn_Flucht_1118()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_04");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_04");
};

