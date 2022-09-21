
func void B_RestartFreeze()
{
	if((Npc_GetLastHitSpellID(self) == SPL_IceCube) || (Npc_GetLastHitSpellID(self) == SPL_IceWave))
	{
		Snd_Play("MFX_ICECUBE_TARGET_START");
		Npc_SetStateTime(self,0);
	};
};

func void B_StopMagicFreeze()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play("MFX_ICECUBE_TARGET_END");
	}
	else if(Npc_GetDistToNpc(self,hero) <= 800)
	{
		Snd_Play("MFX_ICECUBE_TARGET_END");
	};
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	if(self.guild != GIL_DRAGON)
	{
		AI_Standup(self);
	};
	if(!Npc_IsPlayer(self))
	{
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			B_AssessDamage();
		}
		else
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
	};
};

var int PainfulDeathState;

func int PainfulDeath_Loop()
{
	var int time;
	time = Npc_GetStateTime(self);
	if((time == 0) && (PainfulDeathState == 0))
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$AARGH_1");
		Npc_PlayAni(self,"S_FIRE_VICTIM");
		PainfulDeathState = 1;
	}
	else if((time == 2) && (PainfulDeathState == 1))
	{
		B_Say(self,self,"$DEAD");
		PainfulDeathState = 2;
	}
	else if((time == 3) && (PainfulDeathState == 2))
	{
		Npc_StopAni(self,"S_FIRE_VICTIM");
		B_KillNpc(self);
		PainfulDeathState = 3;
	};
	if(PainfulDeathState >= 3)
	{
		self.aivar[AIV_ReadyForPainfulDeath] = FALSE;
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicFreeze()
{
	if(self.aivar[AIV_ReadyForPainfulDeath] == TRUE)
	{
		PainfulDeathState = 0;
		return;
	};
	Snd_Play("MFX_ICECUBE_TARGET_START");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartFreeze);
	Npc_StopAni(self,"S_FIRE_VICTIM");
	if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
	};
	self.aivar[AIV_FreezeStateTime] = 0;
};

func int ZS_MagicFreeze_Loop()
{
	if(self.aivar[AIV_ReadyForPainfulDeath] == TRUE)
	{
		return PainfulDeath_Loop();
	};
	if((Npc_GetStateTime(self) > SPL_TIME_FREEZE) || (self.attribute[ATR_HITPOINTS] <= 0))
	{
		B_StopMagicFreeze();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > (self.attribute[ATR_HITPOINTS] - SPL_FREEZE_DAMAGE))
		{
			if(C_NpcIsFireCreature(self))
			{
				B_MagicHurtNpc(other,self,SPL_FREEZE_DAMAGE * 2);
				return LOOP_CONTINUE;
			};
			if(C_NpcIsIceCreature(self))
			{
				B_MagicHurtNpc(other,self,SPL_FREEZE_DAMAGE / 2);
				return LOOP_CONTINUE;
			};
			B_MagicHurtNpc(other,self,SPL_FREEZE_DAMAGE);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicFreeze_End()
{
};

