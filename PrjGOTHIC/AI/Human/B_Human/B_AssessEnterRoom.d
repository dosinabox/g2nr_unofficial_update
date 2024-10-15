
func int C_NpcIsReadyToObservePlayer(var C_Npc slf)
{
	if(Npc_IsInState(slf,ZS_Potion_Alchemy))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Read_Bookstand))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Sit_Bench))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Sit_Campfire))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Sit_Chair))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Sit_Throne))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Sleep))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Smalltalk))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Smoke_Joint))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Stand_ArmsCrossed))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Stand_Drinking))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Stand_Eating))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Stand_Guarding))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Stand_WP))
	{
		return TRUE;
	};
	return FALSE;
};

func int B_AssessEnterRoom()
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if(Npc_IsPlayer(other) && (Player_LeftRoomComment == TRUE) && (portalguild > GIL_NONE) && (portalguild != GIL_PUBLIC))
	{
		Player_LeftRoomComment = FALSE;
	};
	if(Npc_GetDistToNpc(self,other) > 1000)
	{
		return FALSE;
	};
	if(!Npc_IsInPlayersRoom(self) && (Npc_GetPortalGuild(self) >= GIL_NONE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		return FALSE;
	};
	if(!Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if(self.npcType == NPCTYPE_FRIEND)
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rick))
		{
			return FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rumbold))
		{
			return FALSE;
		};
	};
	if(!Npc_IsInPlayersRoom(self) && C_NpcIsSleeping(self))
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	if(!Npc_CanSeeNpc(self,other) && !Npc_IsInState(self,ZS_ObservePlayer))
	{
		if(C_BodyStateContains(other,BS_SNEAK))
		{
			return FALSE;
		};
		if(C_BodyStateContains(other,BS_STAND))
		{
			return FALSE;
		};
	};
	if((portalguild == GIL_PUBLIC) && Npc_IsInPlayersRoom(self))
	{
		if(Npc_IsInState(self,ZS_ObservePlayer))
		{
			return FALSE;
		};
		if(C_BodyStateContains(self,BS_LIE))
		{
			B_MM_DeSynchronize();
		};
		if(C_NpcIsReadyToObservePlayer(self))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			if(C_BodyStateContains(self,BS_SIT))
			{
				AI_StartState(self,ZS_ObservePlayer,0,"");
			}
			else
			{
				AI_StartState(self,ZS_ObservePlayer,1,"");
			};
			return TRUE;
		};
		return FALSE;
	};
	if(C_NpcIsBotheredByPlayerRoomGuild(self))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_ClearRoom,1,"");
		return TRUE;
	};
	return FALSE;
};

func void B_AssessPortalCollision()
{
	var int formerportalguild;
	if(B_AssessEnterRoom())
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG)
		{
			return;
		};
		if(C_BodyStateContains(other,BS_SNEAK))
		{
			return;
		};
		if(C_BodyStateContains(other,BS_STAND))
		{
			return;
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,-1,ZS_ClearRoom,-1))
	{
		return;
	};
	formerportalguild = Wld_GetFormerPlayerPortalGuild();
	if((self.guild == formerportalguild) || (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY))
	{
		if(C_NpcIgnoresPlayerMovements(self))
		{
			return;
		};
		if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) || (Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND)))
		{
			return;
		};
		if(self.guild == GIL_NONE)
		{
			return;
		};
		if(((formerportalguild == GIL_MIL) || (formerportalguild == GIL_SLD)) && (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY))
		{
			B_Attack(self,other,AR_LeftPortalRoom,0);
			return;
		};
		self.aivar[AIV_SeenLeftRoom] = TRUE;
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_ObservePlayer,0,"");
	};
};

