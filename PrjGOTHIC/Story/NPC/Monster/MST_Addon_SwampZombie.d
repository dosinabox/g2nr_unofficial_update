
/*prototype Mst_Default_SwampZombie(C_Npc)
{
	name[0] = "Болотный труп";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPZOMBIE;
	level = 25;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_SwampZombie()
{
//	Mdl_SetVisual(self,"SwampZombie.mds");
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"ZomSwamp_Body",0,0,"ZomSwamp_Head",3,DEFAULT,-1);
};


instance SwampZombie(Mst_Default_SwampZombie)
{
	B_SetVisuals_SwampZombie();
	Npc_SetToFistMode(self);
};*/

