
func int C_NpcCanAttackBlocker(var C_Npc slf,var C_Npc oth)
{
	if(C_NpcIsMage(slf))
	{
		return FALSE;
	};
	if(C_NpcIsMage(oth))
	{
		return FALSE;
	};
	if(oth.guild == GIL_PAL)
	{
		return FALSE;
	};
	if(C_NpcIsToughGuy(slf))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_MoveNpc()
{
	if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		return;
	};
	if(!Npc_IsWayBlocked(self))
	{
		return;
	};
	if(C_BodyStateContains(self,BS_RUN))
	{
		return;
	};
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if(self.npcType == NPCTYPE_FRIEND)
	{
		return;
	};
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	if(C_NpcIsDown(other))
	{
		return;
	};
	if(Npc_GetDistToNpc(self,other) >= 50)
	{
		return;
	};
	if(self.aivar[AIV_Nerver] >= 4)
	{
		if(C_NpcCanAttackBlocker(self,other))
		{
			B_Attack(self,other,AR_ReactToWeapon,1);
			self.aivar[AIV_Nerver] -= 2;
		};
	}
	else
	{
		Npc_ClearAIQueue(self);
		AI_Dodge(self);
		B_LookAtNpc(self,other);
		self.aivar[AIV_Nerver] += 1;
		if(self.aivar[AIV_Nerver] == 2)
		{
			AI_PlayAni(self,"T_FORGETIT");
		}
		else if(self.aivar[AIV_Nerver] == 3)
		{
			if(C_NpcCanAttackBlocker(self,other))
			{
				B_Say_Overlay(self,self,"$GETOUTOFHERE");
			}
			else
			{
				B_Say_Overlay(self,self,"$SPAREME");
			};
		};
		AI_Wait(self,1.5);
		B_StopLookAt(self);
		AI_ContinueRoutine(self);
	};
};

