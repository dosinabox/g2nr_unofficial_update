
const int SPL_Cost_Inflate = 10;
const int SPL_Inflate_Damage = 5;
const int SPL_TIME_Inflate = 19;

instance Spell_Inflate(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
};


func int Spell_Logic_Inflate(var int manaInvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Inflate))
	{
		if(!C_NpcIsSwimming(other) && !C_NpcIsDown(other) && (other.guild < GIL_SEPERATOR_HUM) && !C_NpcIsImmortal(other) && (Npc_GetDistToNpc(self,other) <= 1000) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_Inflate,0,"");
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Inflate()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Inflate;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

