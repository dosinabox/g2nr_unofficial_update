
func void ZS_Unconscious()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	if(C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
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
	if((self.guild < GIL_SEPERATOR_HUM) && Npc_IsPlayer(other))
	{
		self.aivar[AIV_DefeatedByPlayer] = TRUE;
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_DuelLost] == FALSE) && (self.guild == GIL_SLD))
		{
			Sld_Duelle_gewonnen = Sld_Duelle_gewonnen + 1;
			self.aivar[AIV_DuelLost] = TRUE;
		};
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	if(Npc_IsPlayer(self))
	{
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		if(other.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			other.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	B_GiveTradeInv(self);
	B_ClearRuneInv(self);
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
	{
		B_GivePlayerXP(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	AI_UnequipWeapons(self);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dar)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cipher)))
	{
		Dar_LostAgainstCipher = TRUE;
	};
};

func int ZS_Unconscious_Loop()
{
	if(Npc_GetStateTime(self) < HAI_TIME_UNCONSCIOUS)
	{
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};
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
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) <= 500)
			{
				AI_TakeItem(self,item);
			};
		};
	};
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	AI_StartState(self,ZS_HealSelf,0,"");
};

