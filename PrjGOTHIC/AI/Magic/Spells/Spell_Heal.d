
const int SPL_Cost_PalLightHeal = 10;
const int SPL_Cost_PalMediumHeal = 25;
const int SPL_Cost_PalFullHeal = 50;
const int SPL_Cost_LightHeal = 10;
const int SPL_Cost_MediumHeal = 25;
const int SPL_Cost_FullHeal = 50;
const int SPL_Heal_PalLightHeal = 200;
const int SPL_Heal_PalMediumHeal = 400;
const int SPL_Heal_PalFullHeal = 800;
const int SPL_Heal_LightHeal = 200;
const int SPL_Heal_MediumHeal = 400;
const int SPL_Heal_FullHeal = 800;

func int Heal_Spell_Logic_Common(var int manaInvested,var int cost)
{
	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		return SPL_SENDSTOP;
	}
	else if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		if(manaInvested < SPL_Charge_Frames)
		{
			return SPL_NEXTLEVEL;
		};
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= cost)
	{
		if(manaInvested < SPL_Charge_Frames)
		{
			return SPL_NEXTLEVEL;
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

instance Spell_Heal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};

instance Spell_PalHeal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_PalLightHeal(var int manaInvested)
{
	return Heal_Spell_Logic_Common(manaInvested,SPL_Cost_PalLightHeal);
};

func int Spell_Logic_PalMediumHeal(var int manaInvested)
{
	return Heal_Spell_Logic_Common(manaInvested,SPL_Cost_PalMediumHeal);
};

func int Spell_Logic_PalFullHeal(var int manaInvested)
{
	return Heal_Spell_Logic_Common(manaInvested,SPL_Cost_PalFullHeal);
};

func int Spell_Logic_LightHeal(var int manaInvested)
{
	return Heal_Spell_Logic_Common(manaInvested,SPL_Cost_LightHeal);
};

func int Spell_Logic_MediumHeal(var int manaInvested)
{
	return Heal_Spell_Logic_Common(manaInvested,SPL_Cost_MediumHeal);
};

func int Spell_Logic_FullHeal(var int manaInvested)
{
	return Heal_Spell_Logic_Common(manaInvested,SPL_Cost_FullHeal);
};

func void Spell_Cast_Heal()
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_LightHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_LightHeal;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_LightHeal);
	}
	else if(activeSpell == SPL_MediumHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_MediumHeal;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_MediumHeal);
	}
	else if(activeSpell == SPL_FullHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_FullHeal;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_FullHeal);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

func void Spell_Cast_PalHeal()
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_PalLightHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_PalLightHeal;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalLightHeal);
	}
	else if(activeSpell == SPL_PalMediumHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_PalMediumHeal;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalMediumHeal);
	}
	else if(activeSpell == SPL_PalFullHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_PalFullHeal;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_Heal_PalFullHeal);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

