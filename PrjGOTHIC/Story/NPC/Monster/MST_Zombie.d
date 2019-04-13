
prototype Mst_Default_Zombie(C_Npc)
{
	name[0] = "Зомби";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,-1);
};

func void B_SetVisuals_Zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,-1);
};

func void B_SetVisuals_Zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,-1);
};

func void B_SetVisuals_Zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,-1);
};


instance Zombie01(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

instance Zombie02(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
};

instance Zombie03(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie03();
	Npc_SetToFistMode(self);
};

instance Zombie04(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie04();
	Npc_SetToFistMode(self);
};

instance Zombie_Addon_Knecht(Mst_Default_Zombie)
{
	name[0] = "Приспешник Ворона";
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_Thorus_Addon);
	Npc_SetToFistMode(self);
};

instance Zombie_Addon_Bloodwyn(Mst_Default_Zombie)
{
	name[0] = "Пробудившийся Бладвин";
	level = 25;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_Thorus_Addon);
	Npc_SetToFistMode(self);
};


func void ZS_Pal_ZOMBIE()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_Pal_ZOMBIE_RISE);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Pal_ZOMBIE_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DOWN");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Pal_ZOMBIE_END()
{
};

func void B_Pal_ZOMBIE_RISE()
{
	if(Npc_GetDistToNpc(self,hero) <= 1400)
	{
		AI_PlayAni(self,"T_RISE");
		AI_StartState(self,ZS_MM_Attack,0,"");
		self.bodyStateInterruptableOverride = FALSE;
		self.start_aistate = ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] = OnlyRoutine;
	};
};

func void B_SetVisuals_Pal_Zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Pal_Zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Pal_Zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,itar_pal_skel);
};

func void B_SetVisuals_Pal_Zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,itar_pal_skel);
};


instance Pal_Zombie01(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Pal_Zombie02(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie02();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Pal_Zombie03(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie03();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Pal_Zombie04(Mst_Default_Zombie)
{
	B_SetVisuals_Pal_Zombie04();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};


func void B_SetVisuals_Maya_Zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,ITAR_MayaZombie_Addon);
};

func void B_SetVisuals_Maya_Zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
};

func void B_SetVisuals_Maya_Zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,ITAR_MayaZombie_Addon);
};

func void B_SetVisuals_Maya_Zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,ITAR_MayaZombie_Addon);
};


instance MayaZombie01(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie01();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie02(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie02();
	Npc_SetToFistMode(self);
};

instance MayaZombie03(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie03();
	Npc_SetToFistMode(self);
	start_aistate = ZS_Pal_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance MayaZombie04(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

instance MayaZombie04_Totenw(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

instance Summoned_ZOMBIE(Mst_Default_Zombie)
{
	name[0] = NAME_Addon_Summoned_Zombie;
	guild = GIL_SummonedZombie;
	aivar[AIV_MM_REAL_ID] = ID_SummonedZombie;
	level = 0;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

