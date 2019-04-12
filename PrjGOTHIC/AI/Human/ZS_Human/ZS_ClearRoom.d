
func void B_ClearRoomTalk()
{
	if(C_WantToAttackRoomIntruder(self))
	{
		B_Say(self,other,"$GETOUTOFHERE");
	}
	else
	{
		B_Say(self,other,"$WHYAREYOUINHERE");
	};
};

func int B_ExitIfRoomLeft()
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if(!C_NpcIsBotheredByPlayerRoomGuild(self) || (portalguild == GIL_PUBLIC))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		B_StopLookAt(self);
		if(C_WantToAttackRoomIntruder(self))
		{
			B_Say(self,other,"$YESGOOUTOFHERE");
		}
		else
		{
			B_Say(self,other,"$WISEMOVE");
		};
		AI_ContinueRoutine(self);
		return TRUE;
	};
	return FALSE;
};

func void ZS_ClearRoom()
{
	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ExitIfRoomLeft);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_ClearRoomTalk);
	AI_Standup(self);
	B_LookAtNpc(self,other);
	AI_SetWalkMode(self,NPC_RUN);
	if(!Npc_IsInPlayersRoom(self))
	{
		AI_GotoWP(self,Npc_GetNearestWP(other));
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_ClearRoom_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		B_TurnToNpc(self,other);
		if(C_WantToAttackRoomIntruder(self))
		{
			B_SelectWeapon(self,other);
			B_Say(self,other,"$GETOUTOFHERE");
		}
		else if(Npc_GetAttitude(other,self) != ATT_FRIENDLY)
		{
			B_Say(self,other,"$WHYAREYOUINHERE");
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if(B_ExitIfRoomLeft())
	{
		return LOOP_END;
	};
	if(C_WantToAttackRoomIntruder(self))
	{
		if(Npc_GetStateTime(self) > 5)
		{
			B_Attack(self,other,AR_ClearRoom,0);
			return LOOP_END;
		};
	}
	else if(Npc_GetStateTime(self) >= 2)
	{
		if(!Npc_CanSeeNpcFreeLOS(self,other))
		{
			AI_GotoWP(self,Npc_GetNearestWP(other));
			B_TurnToNpc(self,other);
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			B_TurnToNpc(self,other);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_ClearRoom_End()
{
	B_StopLookAt(self);
};

