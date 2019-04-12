
func void B_MM_AssessEnemy()
{
	var C_Npc pcl;
	var C_Npc mgo;
	var C_Npc lar;
	if((self.guild == GIL_DRAGON) && (Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1))
	{
		return;
	};
	if((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))
	{
		return;
	};
	if((self.aivar[AIV_EnemyOverride] == TRUE) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return;
	};
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};
	mgo = Hlp_GetNpc(MagicGolem);
	lar = Hlp_GetNpc(VLK_449_Lares);
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(lar)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(mgo)))
	{
		return;
	};
	if(Npc_GetDistToWP(self,"OC_RAMP_07") <= 500)
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsPlayer(other) && (other.guild > GIL_SEPERATOR_HUM))
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};
	if(self.senses_range > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if((self.guild == GIL_ORC) || (self.guild == GIL_FRIENDLY_ORC))
	{
		if(C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(other.npcType == NPCTYPE_FRIEND)
		{
			return;
		};
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(self.aivar[AIV_MM_ThreatenBeforeAttack] == FALSE)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_EatBody))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Hunt))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	if(C_PredatorFoundPrey(self,other))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Hunt,0,"");
		return;
	};
	if(C_PredatorFoundPrey(other,self))
	{
		if(!Npc_IsInState(other,ZS_MM_Hunt) && (Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_FLEE))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Flee,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_ThreatenEnemy,0,"");
};

