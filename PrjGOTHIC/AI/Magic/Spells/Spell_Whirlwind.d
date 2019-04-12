
const int SPL_Cost_Whirlwind = 30;
const int SPL_Whirlwind_DAMAGE = 0;
const int SPL_TIME_WHIRLWIND = 10;

instance Spell_Whirlwind(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	damage_per_level = 60;
};


func int Spell_Logic_Whirlwind(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Whirlwind)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Whirlwind()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Whirlwind;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

