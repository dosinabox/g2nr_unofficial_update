
func int B_AssessEnemy()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lares)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Magic_Golem)))
		{
			return FALSE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Cornelius)) && !Npc_IsPlayer(other))
		{
			if(Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") <= 1000)
			{
				return FALSE;
			};
		};
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cornelius))
		{
			if(C_IsNpc(self,BDT_1031_Fluechtling) || C_IsNpc(self,BDT_1032_Fluechtling))
			{
				return FALSE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph)) && !Npc_IsPlayer(other))
		{
			if(Npc_GetDistToWP(self,"NW_FARM2_TO_TAVERN_06") <= 5000)
			{
				B_Flee();
				return FALSE;
			};
		};
		if(((self.guild == GIL_BAU) || (self.guild == GIL_VLK) || (self.guild == GIL_OUT) || (self.guild == GIL_NONE)) && ((other.guild == GIL_ORC) || C_NpcIsGolem(other)))
		{
			if(C_NpcIsAfraidOfOrcs(self))
			{
				B_Flee();
				return FALSE;
			};
		};
	};
	if(C_NpcIsLevelinspektor(other))
	{
		return FALSE;
	};
//	if(((Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) && (other.guild < GIL_SEPERATOR_HUM) && ((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))) || ((other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_NoFightParker] == TRUE)))
	if((!Npc_IsPlayer(other) && (other.guild < GIL_SEPERATOR_HUM) && ((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))) || ((other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_NoFightParker] == TRUE)))
	{
		return FALSE;
	};
	if(C_NpcIsSwimming(other) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		return FALSE;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return FALSE;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > 1500)
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other))
		{
			return FALSE;
		};
	};
	if(C_PlayerIsFakeBandit(self,other) && (self.guild == GIL_BDT))
	{
		return FALSE;
	};
	if(((self.aivar[AIV_EnemyOverride] == TRUE) || (other.aivar[AIV_EnemyOverride] == TRUE)) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) != ATT_HOSTILE)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((Npc_GetStateTime(self) > 2) || Npc_IsInState(self,ZS_ObservePlayer)) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
		{
			B_Attack(self,other,self.aivar[AIV_LastPlayerAR],0);
			return TRUE;
		};
		return FALSE;
	};
	if(C_WantToFlee(self))
	{
		B_CallGuards();
		B_Flee();
	}
	else
	{
		B_Attack(self,other,AR_GuildEnemy,0);
	};
	return TRUE;
};

