
const int SPL_Cost_Firerain = 150;
const int SPL_Damage_FireRain = 500;

instance Spell_FireRain(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_FireRain;
//	изменить тип если нужно		
	damagetype = DAM_MAGIC;
//	damagetype = DAM_FIRE;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 1500;
};


func int Spell_Logic_Firerain(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Firerain)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firerain()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Firerain;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

