
const int SPL_Cost_Firebolt = 5;
const int SPL_Damage_Firebolt = 25;

instance Spell_Firebolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Firebolt;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Firebolt(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Firebolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firebolt()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Firebolt;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

