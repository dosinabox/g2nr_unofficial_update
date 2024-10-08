
prototype Mst_Default_StoneGolem(C_Npc)
{
	name[0] = "�������� �����";
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	level = 25;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_StoneGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance StoneGolem(Mst_Default_StoneGolem)
{
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance Summoned_Golem(Mst_Default_StoneGolem)
{
	name[0] = "��������� �����";
	guild = GIL_SUMMONED_GOLEM;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_GOLEM;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};


func void ZS_GolemDown()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_GolemRise);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_GolemDown_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_GolemDown_End()
{
};

func void B_GolemRise()
{
	if(Npc_GetDistToNpc(self,hero) <= 800)
	{
		Snd_Play("GOL_AMBIENT_A2");
		AI_PlayAni(self,"T_RISE");
		self.flags = 0;
		AI_StartState(self,ZS_MM_Attack,0,"");
		self.start_aistate = ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] = OnlyRoutine;
	};
};


instance Shattered_Golem(Mst_Default_StoneGolem)
{
	level = 18;
	flags = NPC_FLAG_NFOCUS | NPC_FLAG_IMMORTAL;
	bodyStateInterruptableOverride = TRUE;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
	start_aistate = ZS_GolemDown;
};

instance StoneGolem_Dead1(Mst_Default_StoneGolem)
{
	name[0] = "";
	flags = NPC_FLAG_NFOCUS;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance StoneGolem_Dead2(Mst_Default_StoneGolem)
{
	name[0] = "";
	flags = NPC_FLAG_NFOCUS;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance StoneGolem_Dead3(Mst_Default_StoneGolem)
{
	name[0] = "";
	flags = NPC_FLAG_NFOCUS;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance StoneGolem_Dead4(Mst_Default_StoneGolem)
{
	name[0] = "";
	flags = NPC_FLAG_NFOCUS;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

instance MagicGolem(Mst_Default_StoneGolem)
{
	name[0] = "���������� �����";
	level = 10;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	B_SetVisuals_StoneGolem();
	Npc_SetToFistMode(self);
};

