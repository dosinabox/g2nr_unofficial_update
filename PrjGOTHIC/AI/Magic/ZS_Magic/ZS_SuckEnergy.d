
var int Temp_SuckEnergy_DistToPlayer;

func void B_RestartSuckEnergy()
{
	if(Npc_GetLastHitSpellID(self) == SPL_SuckEnergy)
	{
		Npc_SetStateTime(self,0);
		AI_PlayAni(self,"T_STAND_2_SUCKENERGY_VICTIM");
	};
};

func void B_StopSuckEnergy()
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

func void ZS_SuckEnergy()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartSuckEnergy);
	Npc_StopAni(self,"S_SUCKENERGY_VICTIM");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	self.aivar[AIV_SuckEnergyStateTime] = 1;
	Temp_SuckEnergy_DistToPlayer = Npc_GetDistToPlayer(self);
};

func int ZS_SuckEnergy_Loop()
{
	if((Npc_GetStateTime(self) > SPL_TIME_SuckEnergy) || (Temp_SuckEnergy_DistToPlayer >= (Npc_GetDistToPlayer(self) + 100)))
	{
		B_StopSuckEnergy();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_SuckEnergyStateTime])
	{
		if(Npc_GetStateTime(self) == 0)
		{
			if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
			{
				AI_PlayAniBS(self,"T_STAND_2_SUCKENERGY_VICTIM",BS_UNCONSCIOUS);
			};
			Wld_PlayEffect("spellFX_SuckEnergy_BloodFly",self,hero,0,0,0,FALSE);
		};
		if(Npc_GetStateTime(self) == 2)
		{
			B_Say(self,other,"$AARGH_2");
		}
		else if(Npc_GetStateTime(self) == 3)
		{
			B_Say(self,other,"$HELP");
		}
		else if(Npc_GetStateTime(self) == 5)
		{
			B_Say(self,other,"$AARGH_1");
		}
		else if(Npc_GetStateTime(self) == 6)
		{
			B_Say(self,other,"$AARGH_3");
		};
		self.aivar[AIV_SuckEnergyStateTime] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] > SPL_SuckEnergy_Damage)
		{
			B_MagicHurtNpc(other,self,SPL_SuckEnergy_Damage);
			Npc_ChangeAttribute(other,ATR_HITPOINTS,SPL_SuckEnergy_Damage);
		}
		else
		{
			B_MagicHurtNpc(other,self,self.attribute[ATR_HITPOINTS] - 1);
		};
	};
	return LOOP_CONTINUE;
	/*if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		self.attribute[ATR_HITPOINTS] = 0;
		Npc_StopAni(self,"S_SUCKENERGY_VICTIM");
		AI_StartState(self,ZS_Dead,0,"");
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > SPL_TIME_SuckEnergy) || (self.guild > GIL_SEPERATOR_HUM) || (Temp_SuckEnergy_DistToPlayer >= (Npc_GetDistToPlayer(self) + 100)))
	{
		B_StopSuckEnergy();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_SuckEnergyStateTime])
	{
		if(Npc_GetStateTime(self) == 0)
		{
			if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
			{
				AI_PlayAniBS(self,"T_STAND_2_SUCKENERGY_VICTIM",BS_UNCONSCIOUS);
			};
			Wld_PlayEffect("spellFX_SuckEnergy_BloodFly",self,other,0,0,0,FALSE);
		};
		if(Npc_GetStateTime(self) == 2)
		{
			B_Say(self,other,"$AARGH_2");
		}
		else if(Npc_GetStateTime(self) == 3)
		{
			B_Say(self,other,"$HELP");
		}
		else if(Npc_GetStateTime(self) == 5)
		{
			B_Say(self,other,"$AARGH_1");
		}
		else if(Npc_GetStateTime(self) == 6)
		{
			B_Say(self,other,"$AARGH_3");
		};
		self.aivar[AIV_SuckEnergyStateTime] = Npc_GetStateTime(self);
		if(self.attribute[ATR_HITPOINTS] >= SPL_SuckEnergy_Damage)
		{
			Npc_ChangeAttribute(other,ATR_HITPOINTS,SPL_SuckEnergy_Damage);
		};
		B_MagicHurtNpc(other,self,SPL_SuckEnergy_Damage);
	};*/
};

func void ZS_SuckEnergy_End()
{
};

