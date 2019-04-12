
prototype Mst_Default_StonePuma(C_Npc)
{
	name[0] = "Пантера";
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Gargoyle;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 6;
	aivar[AIV_MM_SleepEnd] = 20;
	aivar[AIV_MM_RoamStart] = 20;
	aivar[AIV_MM_RoamEnd] = 6;
};

func void B_SetVisuals_StonePuma()
{
	Mdl_SetVisual(self,"StonePuma.mds");
	Mdl_SetVisualBody(self,"StonePuma_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance StonePuma(Mst_Default_StonePuma)
{
	B_SetVisuals_StonePuma();
	Npc_SetToFistMode(self);
};

