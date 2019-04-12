
func int B_AssessEnemy()
{
	var C_Npc pcl;
	var C_Npc mgo;
	var C_Npc lar;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return FALSE;
	};
	if(((Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) && (other.guild < GIL_SEPERATOR_HUM) && ((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))) || ((other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_NoFightParker] == TRUE)))
	{
		return FALSE;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
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
	mgo = Hlp_GetNpc(MagicGolem);
	lar = Hlp_GetNpc(VLK_449_Lares);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lar)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(mgo)))
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
		}
		else
		{
			return FALSE;
		};
	};
	B_Attack(self,other,AR_GuildEnemy,0);
	return TRUE;
};

