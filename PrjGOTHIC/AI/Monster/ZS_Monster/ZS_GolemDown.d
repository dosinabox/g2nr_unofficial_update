
func void B_GolemAttack()
{
	self.flags = 0;
	AI_StartState(self,ZS_MM_Attack,0,"");
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_GolemRise()
{
	Snd_Play("GOL_AMBIENT_A2");
	Npc_StopAni(self,"S_DEAD");
	AI_PlayAni(self,"T_RISE");
	B_GolemAttack();
};

func void ZS_GolemDown()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 800;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_GolemRise);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_GolemAttack);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_GolemDown_Loop()
{
	if(!C_NpcIsImmortal(self))
	{
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"S_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_GolemDown_End()
{
	B_GolemAttack();
};

