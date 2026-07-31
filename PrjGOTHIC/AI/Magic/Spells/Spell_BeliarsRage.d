
const int SPL_Cost_BeliarsRage = 100;
const int SPL_Damage_BeliarsRage = 200;

instance Spell_EnergyBall(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_BeliarsRage;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_BeliarsRage(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_BeliarsRage)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_EnergyBall()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_BeliarsRage;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

