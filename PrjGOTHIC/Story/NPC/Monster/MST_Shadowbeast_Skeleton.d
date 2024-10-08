
prototype Mst_Default_Shadowbeast_Skeleton(C_Npc)
{
	name[0] = "Скелет мракориса";
	guild = GIL_SHADOWBEAST_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST_SKELETON;
	level = 40;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Shadowbeast_Skeleton()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Shadowbeast_Skeleton(Mst_Default_Shadowbeast_Skeleton)
{
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Skeleton_Angar(Mst_Default_Shadowbeast_Skeleton)
{
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
};

