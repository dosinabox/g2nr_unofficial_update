
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
	name[0] = NAME_Hammel;
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Follow_Sheep(Mst_Default_Sheep)
{
	name[0] = "Бетси";
	level = 0;
	id = 167;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
//	start_aistate = ZS_MM_Rtn_Follow_Sheep;
	CreateInvItems(self,ItFoMuttonRaw,1);
	daily_routine = Rtn_Start_167;
};

func void Rtn_Start_167()
{
	TA_Stand_WP(8,0,22,0,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_WP(22,0,8,0,"NW_BIGFARM_SHEEP2_02");
};

func void Rtn_Follow_167()
{
	TA_MM_Rtn_Follow_Sheep(8,0,22,0,"NW_BIGFARM_SHEEP2_02");
	TA_MM_Rtn_Follow_Sheep(22,0,8,0,"NW_BIGFARM_SHEEP2_02");
};

func void Rtn_Monastery_167()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_MONASTERY_SHEEP_02");
	TA_MM_AllScheduler(22,0,8,0,"NW_MONASTERY_SHEEP_02");
};

instance Follow_Sheep_AKIL(Mst_Default_Sheep)
{
	id = 166;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
//	start_aistate = ZS_MM_Rtn_Follow_Sheep;
	CreateInvItems(self,ItFoMuttonRaw,1);
	daily_routine = Rtn_Cave_166;
};

func void Rtn_Cave_166()
{
	TA_Stand_WP(8,0,22,0,"NW_FOREST_CAVE1_IN_02");
	TA_Stand_WP(22,0,8,0,"NW_FOREST_CAVE1_IN_02");
};

func void Rtn_Follow_166()
{
	TA_MM_Rtn_Follow_Sheep(8,0,22,0,"NW_FOREST_CAVE1_IN_02");
	TA_MM_Rtn_Follow_Sheep(22,0,8,0,"NW_FOREST_CAVE1_IN_02");
};

func void Rtn_Farm_166()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_FARM2_OUT_02");
	TA_MM_AllScheduler(22,0,8,0,"NW_FARM2_OUT_02");
};

instance Balthasar_Sheep1(Mst_Default_Sheep)
{
	name[0] = NAME_Hammel;
	id = 168;
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
//	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
	daily_routine = Rtn_Start_168;
};

func void Rtn_Start_168()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_FARM4_BALTHASAR");
	TA_MM_AllScheduler(22,0,8,0,"NW_FARM4_BALTHASAR");
};

func void Rtn_NewFarm_168()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_BIGMILL_FARM3_BALTHASAR");
	TA_MM_AllScheduler(22,0,8,0,"NW_BIGMILL_FARM3_BALTHASAR");
};

instance Balthasar_Sheep2(Mst_Default_Sheep)
{
	id = 169;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
//	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
	daily_routine = Rtn_Start_169;
};

func void Rtn_Start_169()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_FARM4_BALTHASAR");
	TA_MM_AllScheduler(22,0,8,0,"NW_FARM4_BALTHASAR");
};

func void Rtn_NewFarm_169()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_BIGMILL_FARM3_BALTHASAR");
	TA_MM_AllScheduler(22,0,8,0,"NW_BIGMILL_FARM3_BALTHASAR");
};

instance Balthasar_Sheep3(Mst_Default_Sheep)
{
	id = 170;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
//	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
	daily_routine = Rtn_Start_170;
};

func void Rtn_Start_170()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_FARM4_BALTHASAR");
	TA_MM_AllScheduler(22,0,8,0,"NW_FARM4_BALTHASAR");
};

func void Rtn_NewFarm_170()
{
	TA_MM_AllScheduler(8,0,22,0,"NW_BIGMILL_FARM3_BALTHASAR");
	TA_MM_AllScheduler(22,0,8,0,"NW_BIGMILL_FARM3_BALTHASAR");
};

instance SHEEPTRANSFORM(Mst_Default_Sheep)
{
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,b_stopmagictransform);
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance OC_Sheep1(Mst_Default_Sheep)
{
	id = 171;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

func void Rtn_Tot_171()
{
	TA_MM_AllScheduler(8,0,22,0,"TOT");
	TA_MM_AllScheduler(22,0,8,0,"TOT");
};

instance OC_Sheep2(Mst_Default_Sheep)
{
	id = 172;
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

func void Rtn_Tot_172()
{
	TA_MM_AllScheduler(8,0,22,0,"TOT");
	TA_MM_AllScheduler(22,0,8,0,"TOT");
};

instance OC_Sheep3(Mst_Default_Sheep)
{
	name[0] = NAME_Hammel;
	id = 173;
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

func void Rtn_Tot_173()
{
	TA_MM_AllScheduler(8,0,22,0,"TOT");
	TA_MM_AllScheduler(22,0,8,0,"TOT");
};

instance Alwin_Sheep1(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Alwin_Sheep2(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

instance Alwin_Sheep3(Mst_Default_Sheep)
{
	name[0] = NAME_Hammel;
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};

