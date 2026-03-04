
func void ZS_Dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(self.aivar[AIV_MissionsValidated] == FALSE)
	{
		B_CheckDeadMissionNPCs(self);
		self.aivar[AIV_MissionsValidated] = TRUE;
	};
	if(Hlp_IsValidNpc(other))
	{
		B_GiveDeathXP(other,self);
		if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
		{
			if(Npc_GetDistToNpc(self,other) < 300)
			{
				Npc_ChangeAttribute(other,ATR_HITPOINTS,-50);
				if(Npc_IsPlayer(other))
				{
					Wld_PlayEffect("CONTROL_LEAVERANGEFX",other,other,0,0,0,FALSE);
					Wld_StopEffect("CONTROL_LEAVERANGEFX");
				};
			};
		};
		if(Npc_IsPlayer(other) || ((other.aivar[AIV_PARTYMEMBER] == TRUE) && C_NpcIsSummon(other)))
		{
			if(C_IsNpc(self,BDT_1071_Addon_Ramon))
			{
				Player_HasTalkedToBanditCamp = TRUE;
			}
			else if(MIS_ThiefGuild_sucked == FALSE)
			{
				if(self.aivar[AIV_SubGuild] == GIL_SUB_Thief_City)
				{
					CityThieves_KilledByPlayer_Count += 1;
					if(CityThieves_KilledByPlayer_Count >= 3)
					{
						MIS_ThiefGuild_sucked = TRUE;
					};
				};
			};
		};
		if(Npc_IsPlayer(other))
		{
			self.aivar[AIV_KilledByPlayer] = TRUE;
			if(C_DropUnconscious() && !C_IsNpc(self,NOV_600_Pedro_DI))
			{
				MadKillerCount += 1;
			};
			if(CurrentLevel == ADDONWORLD_ZEN)
			{
				if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT)
				{
					if(MIS_KrokoJagd == LOG_RUNNING)
					{
						if(!Npc_IsDead(AlligatorJack))
						{
							if(Npc_GetDistToNpc(self,AlligatorJack) <= PERC_DIST_ACTIVE_MAX)
							{
								AlligatorJack_KrokosKilled += 1;
							};
						};
					};
				}
				else if(C_IsNpc(self,OrcShaman_Sit_CanyonLibraryKey))
				{
					OrcShaman_CanyonLibrary_KilledByPlayer = TRUE;
				};
			}
			else if(CurrentLevel == NEWWORLD_ZEN)
			{
				if(self.guild == GIL_GIANT_BUG)
				{
					if(MIS_Fester_KillBugs == LOG_RUNNING)
					{
						if(!Npc_IsDead(Fester))
						{
							if(Npc_GetDistToNpc(self,Fester) <= PERC_DIST_ACTIVE_MAX)
							{
								Festers_Giant_Bug_Killed += 1;
							};
						};
					};
				}
				else if(self.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
				{
					if(C_IsNpc(self,Grimbald_Snapper1) || C_IsNpc(self,Grimbald_Snapper2) || C_IsNpc(self,Grimbald_Snapper3))
					{
						Grimbald_Snappers_KilledByPlayer += 1;
					};
				}
				else if(C_IsNpc(self,SLD_804_Rod))
				{
					Rod_KilledByPlayer = TRUE;
				}
				else if(C_IsNpc(self,SLD_814_Sentenza))
				{
					Sentenza_KilledByPlayer = TRUE;
				}
				else if(C_IsNpc(self,SLD_816_Fester))
				{
					Fester_KilledByPlayer = TRUE;
				}
				else if(C_IsNpc(self,SLD_822_Raoul))
				{
					Raoul_KilledByPlayer = TRUE;
				}
				else if(C_IsNpc(self,SLD_807_Bullco))
				{
					Bullco_KilledByPlayer = TRUE;
				};
			};
		};
		B_SpecialRangedWeaponDamage(other,self,TRUE);
	}
	else if(self.aivar[AIV_LastHitByWindFist] == TRUE)
	{
		B_GiveDeathXP(hero,self);
	};
	if(!Npc_IsPlayer(self))
	{
		if(C_NpcIsHuman(self))
		{
			B_GiveTradeInv(self);
			B_ClearSmithInv(self);
			B_ClearAlchemyInv(self);
			B_ClearBonusFoodInv(self);
			B_ClearInfiniteTools(self);
			B_DeletePetzCrime(self);
			self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
		}
		else
		{
			if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON))
			{
				B_RemoveEveryInvItem(self,ItMw_1h_Bau_Mace);
				B_RemoveEveryInvItem(self,ItMw_1h_MISC_Sword);
				B_RemoveEveryInvItem(self,ItMw_1H_Misc_Axe);
			}
			else if(self.guild == GIL_SUMMONED_SKELETON)
			{
				B_RemoveEveryInvItem(self,ItMw_2H_Sword_M_01);
			}
			else if(C_NpcIsMonsterMage(self))
			{
				B_ClearRuneInv(self);
			};
			B_GiveDeathInv(self);
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	AI_UnequipWeapons(self);
};

func int ZS_Dead_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		B_DragonKillCounter(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	return LOOP_CONTINUE;
};

