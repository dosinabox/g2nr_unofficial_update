
const int SPL_Cost_SummonGoblinSkeleton = 20;

instance Spell_SummonGoblinSkeleton(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGoblinSkeleton(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGoblinSkeleton)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGoblinSkeleton()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_SummonGoblinSkeleton;
	};
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_StopEffect("SLOW_MOTION");
		Wld_SpawnNpcRange(self,Summoned_Gobbo_Skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,Gobbo_Skeleton,1,500);
	};
};

