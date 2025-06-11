
func void B_ZombieAttack()
{
	self.flags = 0;
	AI_StartState(self,ZS_MM_Attack,0,"");
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_ZombieRise()
{
	AI_PlayAni(self,"T_RISE");
	B_ZombieAttack();
};

func void ZS_ZombieDown()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 1400;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_ZombieRise);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_ZombieAttack);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_ZombieDown_Loop()
{
	if(!C_NpcIsImmortal(self))
	{
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DOWN");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_ZombieDown_End()
{
	B_ZombieAttack();
};

