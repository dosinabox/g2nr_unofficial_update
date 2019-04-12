
func void B_RestartFreeze()
{
	if((Npc_GetLastHitSpellID(self) == SPL_IceCube) || (Npc_GetLastHitSpellID(self) == SPL_IceWave))
	{
		Npc_SetStateTime(self,0);
	};
};

func void B_StopMagicFreeze()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
};

func int ZS_MagicFreeze()
{
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
	if(Npc_GetStateTime(self) > SPL_TIME_FREEZE)
	{
		B_StopMagicFreeze();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > (self.attribute[ATR_HITPOINTS] - SPL_FREEZE_DAMAGE))
		{
			if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
			{
				B_MagicHurtNpc(other,self,SPL_FREEZE_DAMAGE * 2);
				return LOOP_CONTINUE;
			};
			if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
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

