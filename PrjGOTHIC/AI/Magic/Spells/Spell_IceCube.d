
const int SPL_Cost_IceCube = 40;
const int SPL_FREEZE_DAMAGE = 2;
const int SPL_TIME_FREEZE = 19;

instance Spell_IceCube(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 60;
};


func int Spell_Logic_IceCube(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_IceCube)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_IceCube()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceCube;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

