
instance STRF_1120_Addon_Tonak(Npc_Default)
{
	name[0] = "Тонак";
	guild = GIL_STRF;
	id = 1120;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal01,BodyTex_B,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1120;
};


func void Rtn_Start_1120()
{
	TA_Pick_Ore(8,0,23,0,"ADW_MINE_LAGER_SIDE_PICK_01");
	TA_Pick_Ore(23,0,8,0,"ADW_MINE_LAGER_SIDE_PICK_01");
};

func void Rtn_Flucht_1120()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_03");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_03");
};

