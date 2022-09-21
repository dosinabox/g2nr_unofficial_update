
const int SPL_COST_ChargeFireball = 160;
const int STEP_ChargeFireball = 40;
const int SPL_Damage_ChargeFireball = 75;

instance Spell_ChargeFireball(C_Spell_Proto)
{
	time_per_mana = 30;
	damage_per_level = SPL_Damage_ChargeFireball;
//	изменить тип если нужно		
	damagetype = DAM_MAGIC;
//	damagetype = DAM_FIRE;
	canTurnDuringInvest = TRUE;
};


func int Spell_Logic_ChargeFireball(var int manaInvested)
{
	if(self.attribute[ATR_MANA] < STEP_ChargeFireball)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (STEP_ChargeFireball * 1))
	{
		self.aivar[AIV_SpellLevel] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manaInvested > (STEP_ChargeFireball * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		Npc_ChangeAttribute(self,ATR_MANA,-STEP_ChargeFireball);
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeFireball * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		Npc_ChangeAttribute(self,ATR_MANA,-STEP_ChargeFireball);
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeFireball * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		Npc_ChangeAttribute(self,ATR_MANA,-STEP_ChargeFireball);
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeFireball * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_ChargeFireball(var int spellLevel)
{
	Npc_ChangeAttribute(self,ATR_MANA,-STEP_ChargeFireball);
	self.aivar[AIV_SelectSpell] += 1;
};

