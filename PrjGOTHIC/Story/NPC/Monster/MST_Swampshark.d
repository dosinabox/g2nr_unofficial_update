
prototype Mst_Default_Swampshark(C_Npc)
{
	name[0] = "Болотная акула";
	guild = GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPSHARK;
	level = 24;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 240;
	attribute[ATR_HITPOINTS] = 240;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Swampshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Swampshark(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_01(Mst_Default_Swampshark)
{
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_02(Mst_Default_Swampshark)
{
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_03(Mst_Default_Swampshark)
{
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
};

instance MIS_Addon_Swampshark_Lou(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ITKE_Addon_Tavern_01,1);
};

