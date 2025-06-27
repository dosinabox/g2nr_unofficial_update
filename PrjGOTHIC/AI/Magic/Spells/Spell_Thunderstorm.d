
const int SPL_Cost_Thunderstorm = 100;
const int SPL_Damage_Thunderstorm = 250;

instance Spell_Thunderstorm(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Thunderstorm;
	damagetype = DAM_MAGIC;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 1000;
};


func int Spell_Logic_Thunderstorm(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Thunderstorm)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Thunderstorm()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Thunderstorm;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

