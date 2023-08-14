
const int SPL_Cost_MassDeath = 150;
const int SPL_Damage_MassDeath = 500;

instance Spell_MassDeath(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_MassDeath;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 1500;
};


func int Spell_Logic_Massdeath(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		if(manaInvested < SPL_Charge_Frames)
		{
			return SPL_NEXTLEVEL;
		};
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_MassDeath)
	{
		if(manaInvested < SPL_Charge_Frames)
		{
			return SPL_NEXTLEVEL;
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Massdeath()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_MassDeath;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

