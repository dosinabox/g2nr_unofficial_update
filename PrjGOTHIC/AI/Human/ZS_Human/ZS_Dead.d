
func void ZS_Dead()
{
	var C_Item readyweap;
	readyweap = Npc_GetReadiedWeapon(other);
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	B_GiveDeathXP(other,self);
	if(C_IAmCanyonRazor(self))
	{
		CanyonRazorBodyCount += 1;
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			B_CountCanyonRazor();
		};
	};
	if(Greg_Rejected == TRUE)
	{
		if(C_AmIDexterBandit(self))
		{
			DexterBanditsBodyCount += 1;
			if(DexterBanditsBodyCount >= 19)
			{
				B_Greg_ComesToDexterLater();
			};
		};
	}
	else
	{
		B_Greg_ComesToDexter();
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if(Npc_GetDistToNpc(self,other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
		};
	};
	B_CheckDeadMissionNPCs(self);
	B_UpdateKilledStats(self);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_NailedValleyShowcase_01))
	{
		if((MayaScrollGiven == FALSE) && !Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT))
		{
			CreateInvItems(self,ItSc_Teleport_Maya,1);
			MayaScrollGiven = TRUE;
		};
	};
	if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON))
	{
		Npc_RemoveInvItems(self,ItMw_1h_Bau_Mace,Npc_HasItems(self,ItMw_1h_Bau_Mace));
		Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
		Npc_RemoveInvItems(self,ItMw_1h_Misc_Axe,Npc_HasItems(self,ItMw_1h_Misc_Axe));
	};
	if(self.guild == GIL_SUMMONED_SKELETON)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Sword_M_01,Npc_HasItems(self,ItMw_2H_Sword_M_01));
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		if(C_DropUnconscious())
		{
			MadKillerCount += 1;
		};
		if((self.guild == GIL_GIANT_BUG) && (MIS_Fester_KillBugs == LOG_Running))
		{
			if(Npc_GetDistToNpc(self,Fester) <= 1500)
			{
				Festers_Giant_Bug_Killed += 1;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swamprat)) && (MIS_KrokoJagd == LOG_Running))
		{
			if(Npc_GetDistToNpc(self,AlligatorJack) <= 1500)
			{
				AlligatorJack_KrokosKilled += 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ramon))
		{
			Player_HasTalkedToBanditCamp = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcShaman_Sit_CanyonLibraryKey))
		{
			OrcShaman_CanyonLibrary_KilledByPlayer = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Grimbald_Snapper1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Grimbald_Snapper2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Grimbald_Snapper3)))
		{
			Grimbald_Snappers_KilledByPlayer = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rengaru)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Halvor)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Nagur)))
		{
			if(Npc_IsDead(Rengaru) && Npc_IsDead(Halvor) && Npc_IsDead(Nagur))
			{
				MIS_ThiefGuild_sucked = TRUE;
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GoldMinecrawler))
	{
		Minecrawler_Killed += 1;
		if((Minecrawler_Killed > 9) && (Bloodwyn_Spawn == FALSE) && !Npc_IsDead(Bloodwyn))
		{
			AI_Teleport(Bloodwyn,"ADW_MINE_TO_MC_03");
			B_StartOtherRoutine(Bloodwyn,"MINE");
			Bloodwyn_Spawn = TRUE;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcWarrior_Harad))
	{
		CityOrc_Killed_Day = Wld_GetDay();
	};
	B_GiveTradeInv(self);
	B_GiveDeathInv(self);
	B_ClearRuneInv(self);
	B_ClearSmithInv(self);
	B_ClearAlchemyInv(self);
	B_ClearBonusFoodInv(self);
	B_ClearInfiniteTools(self);
	B_ClearSpecialAmmo(self);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = ISINPOS;
	if(Npc_HasReadiedRangedWeapon(other))
	{
		if(readyweap.munition == ItRw_Addon_FireArrow)
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Firestorm_SPREAD",self,self,0,0,0,FALSE);
			if(Npc_GetDistToNpc(self,other) <= 600)
			{
				Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
				if(other.protection[PROT_FIRE] < SpecialDamage_FireBow)
				{
					if((other.attribute[ATR_HITPOINTS] + other.protection[PROT_FIRE] - SpecialDamage_FireBow) >= 0)
					{
						other.attribute[ATR_HITPOINTS] -= (SpecialDamage_FireBow - other.protection[PROT_FIRE]);
					}
					else
					{
						other.attribute[ATR_HITPOINTS] = 0;
					};
				};
				if(other.attribute[ATR_HITPOINTS] <= 0)
				{
					AI_PlayAni(other,"T_DEAD");
				};
			};
		};
	};
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

