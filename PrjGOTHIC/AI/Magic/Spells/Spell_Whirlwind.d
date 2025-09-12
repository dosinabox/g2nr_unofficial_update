
const int SPL_Cost_Whirlwind = 30;
//const int SPL_WHIRLWIND_DAMAGE_PER_SEC = 0;
const int SPL_TIME_WHIRLWIND = 10;
const int SPL_Damage_Whirlwind = 60;

instance Spell_Whirlwind(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	damage_per_level = SPL_Damage_Whirlwind;
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
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Whirlwind()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Whirlwind;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

