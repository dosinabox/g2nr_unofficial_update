
func void B_Say_AttackEnd()
{
	var int random;
	if((self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman))
	{
		if(C_NpcIsHuman(other))
		{
			if(!Npc_IsDead(other))
			{
				if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
				{
					B_Say(self,other,"$KILLENEMY");
				}
				else
				{
					B_Say(self,other,"$GOODKILL");
				};
			}
			else
			{
				B_Say(self,other,"$ENEMYKILLED");
			};
		}
		else
		{
			if(self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				random = Hlp_Random(100);
				if((random > 15) && (other.guild != GIL_DRAGON))
				{
					return;
				};
			};
			if(other.aivar[AIV_KilledByPlayer] == FALSE)
			{
				if(self.voice == 9)
				{
					random = Hlp_Random(2);
					if(random == 0)
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED");
					}
					else
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED2");
					};
				}
				else if(self.voice == 12)
				{
					if(C_IsNpc(self,PC_Fighter_OW) || C_IsNpc(self,PC_Fighter_DJG) || C_IsNpc(self,PC_Fighter_NW_vor_DJG) || C_IsNpc(self,PC_Fighter_NW_nach_DJG) || C_IsNpc(self,PC_Fighter_DI))
					{
						random = Hlp_Random(2);
						if(random == 0)
						{
							B_Say(self,other,"$ADDON_MONSTERKILLED");
						}
						else
						{
							B_Say(self,other,"$MONSTERKILLED");
						};
					}
					else
					{
						B_Say(self,other,"$ADDON_MONSTERKILLED");
					};
				}
				else
				{
					B_Say(self,other,"$MONSTERKILLED");
				};
			}
			else
			{
				B_Say(self,other,"$GOODMONSTERKILL");
			};
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		B_Say(self,other,"$THIEFDOWN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_Say(self,other,"$RUMFUMMLERDOWN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		if(C_NpcIsHuman(other))
		{
			B_Say(self,other,"$SHEEPATTACKERDOWN");
		}
		else
		{
			B_Say(self,other,"$MONSTERKILLED");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		if(!Npc_IsDead(other))
		{
			if(self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(other))
			{
				B_Say(self,other,"$KILLMURDERER");
			}
			else
			{
				B_Say(self,other,"$GOODKILL");
			};
		}
		else
		{
			B_Say(self,other,"$ENEMYKILLED");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		if((self.voice == 9) || (self.voice == 12))
		{
			B_Say(self,other,"$ADDON_MONSTERKILLED");
		}
		else
		{
			B_Say(self,other,"$MONSTERKILLED");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say(self,other,"$STUPIDBEASTKILLED");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		B_Say(self,other,"$NEVERHITMEAGAIN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		B_Say(self,other,"$YOUBETTERSHOULDHAVELISTENED");
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_ClearRoom) || (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom))
	{
		if(C_NpcIsBotheredByPlayerRoomGuild(self))
		{
			B_Say(self,other,"$GETUPANDBEGONE");
		}
		else
		{
			B_Say(self,other,"$NEVERENTERROOMAGAIN");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		B_Say(self,other,"$NEVERENTERROOMAGAIN");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		B_Say(self,other,"$KILLENEMY");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
		{
			if(C_IsNpc(self,VLK_449_Lares))
			{
				B_Say(self,other,"$ILIKEIT");
			}
			else
			{
				B_Say(self,other,"$THEREISNOFIGHTINGHERE");
			};
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		B_Say(self,other,"$RUMFUMMLERDOWN");
		return;
	};
};

