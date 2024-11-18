
const int SPL_Cost_Icebolt = 10;
const int SPL_Damage_Icebolt = 50;

instance Spell_IceBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Icebolt;
};


func int Spell_Logic_IceBolt(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Icebolt)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_IceBolt()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Icebolt;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

