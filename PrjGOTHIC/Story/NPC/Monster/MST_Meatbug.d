
prototype Mst_Default_Meatbug(C_Npc)
{
	name[0] = "ћ€сной жук";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_Meatbug()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Meatbug(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus1(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus2(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus3(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance Meatbug_Brutus4(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

