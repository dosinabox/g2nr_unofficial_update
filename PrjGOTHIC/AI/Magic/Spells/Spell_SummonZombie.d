
const int SPL_Cost_SummonZombie = 80;

instance Spell_SummonZombie(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonZombie(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonZombie)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonZombie()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonZombie;
	};
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,Summoned_ZOMBIE,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Zombie01,1,500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

