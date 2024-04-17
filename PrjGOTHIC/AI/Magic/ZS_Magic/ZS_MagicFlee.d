
func void B_StopMagicFlee()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	Npc_SetTarget(self,hero);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_StartState(self,ZS_Flee,0,"");
	}
	else
	{
		AI_StartState(self,ZS_MM_Flee,0,"");
	};
};

func void ZS_MagicFlee()
{
	var int randy;
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if((self.guild != GIL_DRAGON) && (self.guild != GIL_TROLL) && !C_NpcIsGolem(self) && !C_NpcIsUndead(self))
		{
			AI_StartState(self,ZS_MM_Flee,0,"");
		}
		else
		{
			AI_ContinueRoutine(self);
			return;
		};
	};
	if(C_NpcIsMage(self) || C_NpcIsPaladin(self))
	{
		if(!Npc_IsInState(self,ZS_ReactToWeapon))
		{
			B_Say(self,other,"$ISAIDSTOPMAGIC");
			AI_ContinueRoutine(self);
		};
		return;
	};
	if((Miliz_Flucht == FALSE) && (Kapitel < 3))
	{
		if(ScaredRick == FALSE)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rick))
			{
				Npc_ExchangeRoutine(self,"FLUCHT3");
				self.aivar[AIV_DropDeadAndKill] = FALSE;
				ScaredRick = TRUE;
			};
		};
		if(ScaredRumbold == FALSE)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rumbold))
			{
				Npc_ExchangeRoutine(self,"FLUCHT3");
				self.aivar[AIV_DropDeadAndKill] = FALSE;
				ScaredRumbold = TRUE;
			};
		};
		if((ScaredRick == TRUE) && (ScaredRumbold == TRUE))
		{
			Rumbold_Bezahlt = TRUE;
			Miliz_Flucht = TRUE;
		};
	};
	if(Kapitel < 4)
	{
		if(ScaredAlvares == FALSE)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Alvares))
			{
				B_SetGuild(self,GIL_SLD);
				Npc_ExchangeRoutine(self,"BIGFARM");
				ScaredAlvares = TRUE;
			};
		};
		if(ScaredEngardo == FALSE)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Engardo))
			{
				B_SetGuild(self,GIL_SLD);
				Npc_ExchangeRoutine(self,"BIGFARM");
				ScaredEngardo = TRUE;
			};
		};
		if((ScaredAlvares == TRUE) && (ScaredEngardo == TRUE) && (ScaredFarmers == FALSE))
		{
			if(Hlp_IsValidNpc(Akil))
			{
				if(!Npc_IsDead(Akil))
				{
					Npc_ExchangeRoutine(Akil,"START");
				};
			};
			if(Hlp_IsValidNpc(Kati))
			{
				if(!Npc_IsDead(Kati))
				{
					Npc_ExchangeRoutine(Kati,"START");
				};
			};
			if(Hlp_IsValidNpc(Randolph))
			{
				if(!Npc_IsDead(Randolph))
				{
					Npc_ExchangeRoutine(Randolph,"START");
					Randolph.flags = 0;
				};
			};
			ScaredFarmers = TRUE;
		};
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_StopMagicFlee);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(hero);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM1",BS_STAND);
		};
		if(randy == 1)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM2",BS_STAND);
		};
		if(randy == 2)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM3",BS_STAND);
		};
	};
};

func int ZS_MagicFlee_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_Fear)
	{
		Npc_ClearAIQueue(self);
		B_StopMagicFlee();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicFlee_End()
{
};

