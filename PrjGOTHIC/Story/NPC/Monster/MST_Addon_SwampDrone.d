
prototype Mst_Default_SwampDrone(C_Npc)
{
	name[0] = "Болотный дрон";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPDRONE;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_SwampDrone()
{
	Mdl_SetVisual(self,"SwampDrone.mds");
	Mdl_SetVisualBody(self,"SwampDrone_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SwampDrone(Mst_Default_SwampDrone)
{
	B_SetVisuals_SwampDrone();
	Npc_SetToFistMode(self);
};

