
const int SPL_Cost_Sleep = 30;
const int SPL_TIME_Sleep = 30;

instance Spell_Sleep(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
};


func int C_NpcCanSleep(var C_Npc npc)
{
	if(npc.guild >= GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	if(C_NpcIsDown(npc))
	{
		return FALSE;
	};
	if(C_NpcIsSwimming(npc))
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(self,npc) > 1000)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(npc))
	{
		return TRUE;
	};
	if(npc.flags == NPC_FLAG_IMMORTAL)
	{
		if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Cornelius))
		{
			return TRUE;
		};
		if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Richter))
		{
			return TRUE;
		};
		if(C_IsNpc(npc,VLK_400_Larius))
		{
			return TRUE;
		};
		return FALSE;
	};
	if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Daron))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Vatras))
	{
		return FALSE;
	};
	if(npc.guild == GIL_KDF)
	{
		return FALSE;
	};
	if(npc.guild == GIL_PAL)
	{
		return FALSE;
	};
	if(npc.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(npc.guild == GIL_KDW)
	{
		return FALSE;
	};
	return TRUE;
};

func int Spell_Logic_Sleep(var int manaInvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Sleep))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Sleep;
		};
		if(Npc_IsInState(other,ZS_MagicSleep))
		{
			Npc_SetStateTime(other,0);
		}
		else if(C_NpcCanSleep(other))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Sleep()
{
	self.aivar[AIV_SelectSpell] += 1;
};

