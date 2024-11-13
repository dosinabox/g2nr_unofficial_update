
const int SPL_Cost_MasterOfDisaster = 60;
const int SPL_Damage_MasterOfDisaster = 300;

instance Spell_MasterOfDisaster(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_MasterOfDisaster;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_MasterOfDisaster(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_MasterOfDisaster)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_MasterOfDisaster()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_MasterOfDisaster;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

