
func void ZS_Dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_RAZOR)
		{
			if(C_IAmCanyonRazor(self))
			{
				CanyonRazorBodyCount += 1;
				if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
				{
					B_CountCanyonRazor();
				};
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_NailedValleyShowcase_01))
		{
			if((MayaScrollGiven == FALSE) && !Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT))
			{
				CreateInvItems(self,ItSc_Teleport_Maya,1);
				MayaScrollGiven = TRUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GoldMinecrawler))
		{
			Minecrawler_Killed += 1;
			if((Minecrawler_Killed > 9) && (Bloodwyn_Spawn == FALSE) && !Npc_IsDead(Bloodwyn))
			{
				AI_Teleport(Bloodwyn,"ADW_MINE_TO_MC_03");
				B_StartOtherRoutine(Bloodwyn,"MINE");
				Bloodwyn_Spawn = TRUE;
			};
		};
	}
	else if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(CityOrc))
		{
			CityOrc_Killed_Day = Wld_GetDay();
		}
		else if(Greg_Rejected == TRUE)
		{
			if(C_AmIDexterBandit(self))
			{
				DexterBanditsBodyCount += 1;
				if(DexterBanditsBodyCount >= 19)
				{
					B_Greg_ComesToDexterLater();
				};
			};
		};
	};
	B_CheckDeadMissionNPCs(self);
	if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON))
	{
		B_RemoveEveryInvItem(self,ItMw_1h_Bau_Mace);
		B_RemoveEveryInvItem(self,ItMw_1h_MISC_Sword);
		B_RemoveEveryInvItem(self,ItMw_1h_Misc_Axe);
	}
	else if(self.guild == GIL_SUMMONED_SKELETON)
	{
		B_RemoveEveryInvItem(self,ItMw_2H_Sword_M_01);
	};
	if(Hlp_IsValidNpc(other))
	{
		B_GiveDeathXP(other,self);
		if((self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE) || (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPZOMBIE))
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
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ramon))
			{
				Player_HasTalkedToBanditCamp = TRUE;
			}
			else if(MIS_ThiefGuild_sucked == FALSE)
			{
				if(C_IAmThiefFromCity(self))
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
			if(C_DropUnconscious())
			{
				MadKillerCount += 1;
			};
			if(CurrentLevel == ADDONWORLD_ZEN)
			{
				if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT)
				{
					if(MIS_KrokoJagd == LOG_Running)
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
					if(MIS_Fester_KillBugs == LOG_Running)
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
				else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod))
				{
					Rod_KilledByPlayer = TRUE;
				}
				else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sentenza))
				{
					Sentenza_KilledByPlayer = TRUE;
				}
				else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fester))
				{
					Fester_KilledByPlayer = TRUE;
				}
				else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Raoul))
				{
					Raoul_KilledByPlayer = TRUE;
				}
				else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bullco))
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
		B_GiveTradeInv(self);
		B_GiveDeathInv(self);
		B_ClearSmithInv(self);
		B_ClearAlchemyInv(self);
		B_ClearBonusFoodInv(self);
		B_ClearInfiniteTools(self);
		B_DeletePetzCrime(self);
		self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
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

