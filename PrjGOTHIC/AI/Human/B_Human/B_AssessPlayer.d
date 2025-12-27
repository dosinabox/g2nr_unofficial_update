
func void B_AssessPlayer()
{
	/*if(C_NpcIsLevelinspektor(other))
	{
		return;
	};*/
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if(C_NpcIsDown(other))
	{
		return;
	};
	if(!C_NpcIsHuman(other))
	{
		if(C_NpcIsGateGuard(self))
		{
			AI_StandupQuick(self);
			B_Attack(self,other,AR_MonsterCloseToGate,0);
			return;
		}
		else if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			if(self.npcType == NPCTYPE_FRIEND)
			{
				if(Npc_IsPlayer(other) && (PlayerIsTransformed == TRUE))
				{
					B_Attack(self,other,AR_GuildEnemy,0);
					return;
				};
			}
			else if(self.aivar[AIV_PARTYMEMBER] == FALSE)
			{
				B_Attack(self,other,AR_GuildEnemy,0);
				return;
			};
		};
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if(SewerThieves_KilledByPlayer == TRUE)
	{
		if(self.aivar[AIV_SubGuild] == GIL_SUB_Thief_Sewer)
		{
			B_Attack(self,other,AR_KILL,0);
			return;
		};
	};
	if(self.guild != GIL_BDT)
	{
		if(C_PlayerIsFakeBandit(self,other))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
	};
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		if(B_GetPlayerCrime(self) == CRIME_MURDER)
		{
			if(C_WantToAttackMurder(self,other))
			{
				B_Attack(self,other,AR_HumanMurderedHuman,0);
				return;
			};
		};
	};
	if(B_AssessEnterRoom())
	{
		return;
	};
	if(B_AssessDrawWeapon())
	{
		return;
	};
	Player_DrawWeaponComment = FALSE;
	if(C_BodyStateContains(other,BS_SNEAK))
	{
		if(!Npc_IsInState(self,ZS_ObservePlayer) && C_WantToReactToSneaker(self,other))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	}
	else if(!C_BodyStateContains(other,BS_STAND))
	{
		Player_SneakerComment = FALSE;
	};
	if(!C_BodyStateContains(other,BS_LIE))
	{
		Player_GetOutOfMyBedComment = FALSE;
	};
	B_AssignDementorTalk(self);
	if(Npc_CheckInfo(self,1))
	{
		self.aivar[AIV_CommentedPlayerCrime] = FALSE;
		if(Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
		{
			if(C_IsNpc(self,NOV_608_Garwig))
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				B_AssessTalk();
				return;
			};
			if(C_NpcIsGateGuard(self))
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				B_AssessTalk();
				return;
			};
			if(!C_BodyStateContains(other,BS_FALL) && !C_NpcIsSwimming(other) && (B_GetPlayerCrime(self) == CRIME_NONE) && !C_RefuseTalk(self,other))
			{
				if(!C_PlayerHasFakeGuild(self,other))
				{
					self.aivar[AIV_NpcStartedTalk] = TRUE;
					B_AssessTalk();
					return;
				};
			};
		};
	};
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
	{
		if(C_BodyStateContains(self,BS_WALK) && !Npc_RefuseTalk(other) && !C_NpcIsGateGuard(self))
		{
			if(!C_PlayerHasFakeGuild(self,other))
			{
				B_LookAtNpc(self,other);
				B_Say_GuildGreetings(self,other);
				B_StopLookAt(self);
				Npc_SetRefuseTalk(other,20);
			};
		};
	}
	else if(C_NpcIsGateGuard(self))
	{
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	};
};

