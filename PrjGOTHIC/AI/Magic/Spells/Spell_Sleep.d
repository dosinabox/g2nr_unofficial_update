
const int SPL_Cost_Sleep = 30;
const int SPL_TIME_Sleep = 30;

instance Spell_Sleep(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
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
		if(!C_BodyStateContains(other,BS_SWIM) && !C_BodyStateContains(other,BS_DIVE) && !C_NpcIsDown(other) && (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToNpc(self,other) <= 1000) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Vatras)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Myxir_CITY)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Daron)))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
		}
		else if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Richter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_400_Larius)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cornelius)))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
		}
		else if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && Npc_IsPlayer(other))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Sleep()
{
	self.aivar[AIV_SelectSpell] += 1;
};

