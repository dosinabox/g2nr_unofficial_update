
prototype Mst_Default_Mud(C_Npc)
{
	name[0] = "Тина";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 0;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Mud()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Hum_Head_Pony",Face_N_ZombieMud,0,NO_ARMOR);
};

func void B_CreateInvItems_Mud()
{
	CreateInvItems(self,ItFo_Water,1);
	CreateInvItems(self,ItMi_Gold,5);
};


instance Undead_Mud(Mst_Default_Mud)
{
	name[0] = NAME_Addon_Undead_Mud;
	B_SetVisuals_Mud();
	B_CreateInvItems_Mud();
	Npc_SetToFistMode(self);
};

instance Summoned_Mud(Mst_Default_Mud)
{
	name[0] = NAME_Addon_Summoned_Mud;
	guild = GIL_SummonedZombie;
	aivar[AIV_MM_REAL_ID] = ID_SummonedZombie;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Mud();
	B_CreateInvItems_Mud();
	Npc_SetToFistMode(self);
};

