
func void ZS_Unconscious()
{
	var int random;
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	if(C_NpcIsSwimming(self))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Dead,0,"");
		return;
	};
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if((self.guild < GIL_SEPERATOR_HUM) && C_NpcIsHero(other))
	{
		if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bullco))
			{
				SLD_Bullco_Defeated = TRUE;
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_Bullco))
			{
				DJG_Bullco_Defeated = TRUE;
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod))
			{
				if(MIS_RodSword == LOG_Running)
				{
					MIS_RodSword = LOG_OBSOLETE;
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Valentino))
			{
				Valentino_Day = B_GetDayPlus();
			};
		};
		self.aivar[AIV_DefeatedByPlayer] = TRUE;
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_DuelLost] == FALSE) && (self.guild == GIL_SLD))
		{
			Sld_Duelle_gewonnen += 1;
			self.aivar[AIV_DuelLost] = TRUE;
		};
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	if(C_NpcIsHero(self))
	{
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		if(other.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			other.aivar[AIV_ArenaFight] = AF_AFTER;
		};
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Bullco))
		{
			SLD_Bullco_Defeated_SC = TRUE;
		}
		else if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Sylvio))
		{
			SLD_Sylvio_Defeated_SC = TRUE;
		};
	}
	else
	{
		B_GiveTradeInv(self);
		B_ClearSmithInv(self);
		B_ClearAlchemyInv(self);
		B_ClearBonusFoodInv(self);
		B_ClearInfiniteTools(self);
		if(C_NpcIsToughGuy(self))
		{
			random = Hlp_Random(3);
			if(random == 1)
			{
				Mdl_ApplyRandomAni(self,"S_WOUNDED","T_WOUNDED_TRY");
				Mdl_ApplyRandomAniFreq(self,"S_WOUNDED",8);
				Mdl_ApplyRandomAni(self,"S_WOUNDEDB","T_WOUNDEDB_TRY");
				Mdl_ApplyRandomAniFreq(self,"S_WOUNDEDB",4);
			};
		};
		if(self.guild == GIL_STRF)
		{
			B_RemoveEveryInvItem(self,ItMw_2H_Axe_L_01);
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dar))
		{
			if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cipher))
			{
				if(Sipher_KnowsDarStoleHisWeed == TRUE)
				{
					Cipher.aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
					Dar_LostAgainstCipher = TRUE;
				};
			};
		};
	};
	B_GiveDeathXP(other,self);
	AI_UnequipWeapons(self);
};

func int ZS_Unconscious_Loop()
{
	if(Npc_GetStateTime(self) < NPC_TIME_UNCONSCIOUS)
	{
		return LOOP_CONTINUE;
	};
	return LOOP_END;
};

func void ZS_Unconscious_End()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	AI_Standup(self);
	if(Npc_IsPlayer(self))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Raven))
	{
		self.aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		B_Attack(self,hero,AR_GuildEnemy,0);
		return;
	};
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		B_TurnToNpc(self,other);
		if(C_NpcIsToughGuy(self) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE) && (self.npcType != NPCTYPE_FRIEND))
		{
			B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
		}
		else
		{
			B_Say(self,other,"$OHMYHEAD");
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF))
	{
		if(Hlp_IsValidItem(item) && (Npc_GetDistToItem(self,item) <= 500))
		{
			AI_TakeItem(self,item);
		};
	};
	if(Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item) && (Npc_GetDistToItem(self,item) <= 500))
		{
			AI_TakeItem(self,item);
		};
	};
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	AI_StartState(self,ZS_HealSelf,0,"");
};

