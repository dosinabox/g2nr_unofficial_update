
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
	if(!Npc_IsInPlayersRoom(self) && !(Npc_GetPortalGuild(self) < GIL_NONE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
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
	if(C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND))
	{
		if(!Npc_CanSeeNpc(self,other) && !Npc_IsInState(self,ZS_ObservePlayer))
		{
			return FALSE;
		};
	};
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	if(!Npc_IsInPlayersRoom(self) && Npc_IsInState(self,ZS_Sleep))
	{
		return FALSE;
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
		if(Npc_IsInState(self,ZS_Potion_Alchemy) || Npc_IsInState(self,ZS_Read_Bookstand) || Npc_IsInState(self,ZS_Sit_Bench) || Npc_IsInState(self,ZS_Sit_Campfire) || Npc_IsInState(self,ZS_Sit_Chair) || Npc_IsInState(self,ZS_Sit_Throne) || Npc_IsInState(self,ZS_Sleep) || Npc_IsInState(self,ZS_Smalltalk) || Npc_IsInState(self,ZS_Smoke_Joint) || Npc_IsInState(self,ZS_Stand_ArmsCrossed) || Npc_IsInState(self,ZS_Stand_Drinking) || Npc_IsInState(self,ZS_Stand_Eating) || Npc_IsInState(self,ZS_Stand_Guarding) || Npc_IsInState(self,ZS_Stand_WP))
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
		}
		else
		{
			return FALSE;
		};
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
	formerportalguild = Wld_GetFormerPlayerPortalGuild();
	if(B_AssessEnterRoom())
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other) && (C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND)))
	{
		return;
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectNpcEx(self,-1,ZS_ClearRoom,-1,FALSE))
	{
		return;
	};
	if((self.guild == formerportalguild) || (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY))
	{
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
		}
		else
		{
			self.aivar[AIV_SeenLeftRoom] = TRUE;
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_ObservePlayer,0,"");
			return;
		};
	};
};

