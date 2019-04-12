
prototype Mst_Default_Shadowbeast_Addon_Fire(C_Npc)
{
	name[0] = "Огненный дьявол";
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	level = 30;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 75;
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

func void B_SetVisuals_Shadowbeast_Fire()
{
	Mdl_SetVisual(self,"FireShadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Shadowbeast_Addon_Fire(Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};

instance Shadowbeast_Addon_Fire_CanyonLib(Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MaxDistToWp] = 900;
	aivar[AIV_OriginalFightTactic] = FAI_Gargoyle;
	effect = "SPELLFX_FIREARMOR";
};

