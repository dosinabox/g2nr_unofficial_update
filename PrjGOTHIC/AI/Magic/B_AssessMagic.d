
func void B_AssessMagic()
{
	var int lastHitSpellID;
	lastHitSpellID = Npc_GetLastHitSpellID(self);
	if(Npc_GetLastHitSpellCat(self) == SPELL_BAD)
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};
	if((lastHitSpellID == SPL_IceCube) || (lastHitSpellID == SPL_IceWave))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicFreeze,0,"");
		return;
	};
	if(self.guild != GIL_DRAGON)
	{
		if(lastHitSpellID == SPL_Whirlwind)
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_Whirlwind,0,"");
			return;
		};
		if(lastHitSpellID == SPL_SuckEnergy)
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_SuckEnergy,0,"");
			return;
		};
		if(lastHitSpellID == SPL_GreenTentacle)
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_Greententacle,0,"");
			return;
		};
		if(lastHitSpellID == SPL_Swarm)
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_Swarm,0,"");
			return;
		};
		if(lastHitSpellID == SPL_Firerain)
		{
			Npc_ClearAIQueue(self);
			//TODO почему здесь нет B_ClearPerceptions(self)?
			AI_StartState(self,ZS_MagicBurnShort,0,"");
			return;
		};
		if(lastHitSpellID == SPL_ChargeZap)
		{
			if(other.guild != GIL_DRAGON)
			{
				var int zap;
				zap = Hlp_Random(2);
				if(zap == 0)
				{
					Npc_ClearAIQueue(self);
					B_ClearPerceptions(self);
					AI_StartState(self,ZS_ShortZapped,0,"");
					return;
				};
			};
		};
	};
};


const func PLAYER_PERC_ASSESSMAGIC = B_AssessMagic;
