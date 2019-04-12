
instance STRF_1122_Addon_Pardos(Npc_Default)
{
	name[0] = "Пардос";
	guild = GIL_STRF;
	id = 1122;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 70;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_2H_Axe_L_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1122;
};


func void Rtn_Start_1122()
{
	TA_Sit_Campfire(8,0,23,0,"ADW_MINE_LAGER_SIDE_04");
	TA_Sit_Campfire(23,0,8,0,"ADW_MINE_LAGER_SIDE_04");
};

func void Rtn_Flucht_1122()
{
	TA_RunToWP(8,0,23,0,"ADW_BL_HOEHLE_03");
	TA_RunToWP(23,0,8,0,"ADW_BL_HOEHLE_03");
};

