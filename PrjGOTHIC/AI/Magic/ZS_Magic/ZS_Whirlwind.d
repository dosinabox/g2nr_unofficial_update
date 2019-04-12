
func void B_RestartWhirlwind()
{
	if(Npc_GetLastHitSpellID(self) == SPL_Whirlwind)
	{
		Npc_SetStateTime(self,0);
	};
};

func void B_StopWhirlwind()
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

func int ZS_Whirlwind()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartWhirlwind);
	Npc_StopAni(self,"S_WHIRLWIND_VICTIM");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_WHIRLWIND_VICTIM",BS_UNCONSCIOUS);
	};
	self.aivar[AIV_WhirlwindStateTime] = 0;
};

func int ZS_Whirlwind_Loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_WHIRLWIND)
	{
		B_StopWhirlwind();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_WhirlwindStateTime])
	{
		self.aivar[AIV_WhirlwindStateTime] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > SPL_Whirlwind_DAMAGE)
		{
			B_MagicHurtNpc(other,self,SPL_Whirlwind_DAMAGE);
		}
		else
		{
			B_MagicHurtNpc(other,self,self.attribute - 1);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Whirlwind_End()
{
};

