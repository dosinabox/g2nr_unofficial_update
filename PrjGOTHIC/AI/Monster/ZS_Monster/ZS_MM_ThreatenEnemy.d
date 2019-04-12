
func void ZS_MM_ThreatenEnemy()
{
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
	AI_Standup(self);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
};

func int ZS_MM_ThreatenEnemy_loop()
{
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) >= MONSTER_THREATEN_TIME)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return LOOP_END;
	};
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_WARN");
	return LOOP_CONTINUE;
};

func void ZS_MM_ThreatenEnemy_end()
{
};

