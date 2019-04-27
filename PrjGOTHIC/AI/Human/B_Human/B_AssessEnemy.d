
func int C_NpcIsAfraidOfOrcs(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Daron))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mario))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Thief_NW))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lares))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bartok))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cavalorn))
	{
		return FALSE;
	};
	return TRUE;
};


func int B_AssessEnemy()
{
	var C_Npc pcl;
	var C_Npc mgo;
	var C_Npc lar;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph)) && (Npc_GetDistToWP(self,"NW_FARM2_TO_TAVERN_06") <= 5000) && !Npc_IsPlayer(other))
	{
		B_Flee();
		return FALSE;
	};
	if(((self.guild == GIL_BAU) || (self.guild == GIL_VLK) || (self.guild == GIL_OUT) || (self.guild == GIL_NONE)) && (other.guild == GIL_ORC) && (CurrentLevel == NEWWORLD_ZEN))
	{
		if(C_NpcIsAfraidOfOrcs(self))
		{
			B_Flee();
			return FALSE;
		};
	};
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
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Cornelius)) && (Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") <= 1000) && !Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1031_Fluechtling)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cornelius)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1032_Fluechtling)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cornelius)))
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
//	if((self.fight_tactic == FAI_HUMAN_COWARD) && C_AmIWeaker(self,other))
	if(C_WantToFlee(self,other))
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

