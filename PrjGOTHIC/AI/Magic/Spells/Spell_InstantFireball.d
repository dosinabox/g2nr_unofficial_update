
const int SPL_COST_InstantFireball = 15;
const int SPL_DAMAGE_InstantFireball = 75;

instance Spell_InstantFireball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_InstantFireball;
//	изменить тип если нужно		
	damagetype = DAM_MAGIC;
//	damagetype = DAM_FIRE;
};


func int Spell_Logic_InstantFireball(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_InstantFireball)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_InstantFireball()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_COST_InstantFireball;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

