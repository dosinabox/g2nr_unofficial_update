
const int SPL_COST_ChargeZap = 40;
const int STEP_ChargeZap = 10;
const int SPL_Damage_ChargeZap = 30;

instance Spell_ChargeZap(C_Spell_Proto)
{
	time_per_mana = 100;
	damage_per_level = SPL_Damage_ChargeZap;
	damagetype = DAM_MAGIC;
	canTurnDuringInvest = TRUE;
};


func int Spell_Logic_ChargeZap(var int manaInvested)
{
	if(self.attribute[ATR_MANA] < STEP_ChargeZap)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (STEP_ChargeZap * 1))
	{
		self.aivar[AIV_SpellLevel] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manaInvested > (STEP_ChargeZap * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeZap * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeZap * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeZap * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_ChargeZap(var int spellLevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

