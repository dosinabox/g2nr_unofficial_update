
prototype Mst_Default_Sheep(C_Npc)
{
	name[0] = "Овца";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_SHEEP;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
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
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_Sheep()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Sheep_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Hammel()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Hammel_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Sheep(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Hammel(Mst_Default_Sheep)
{
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Follow_Sheep(Mst_Default_Sheep)
{
	name[0] = "Бетси";
	aivar[AIV_ToughGuy] = TRUE;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_Follow_Sheep;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Follow_Sheep_AKIL(Mst_Default_Sheep)
{
	name[0] = "Овца";
	aivar[AIV_ToughGuy] = TRUE;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	start_aistate = ZS_MM_Rtn_Follow_Sheep;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Balthasar_Sheep1(Mst_Default_Sheep)
{
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Balthasar_Sheep2(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Balthasar_Sheep3(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

