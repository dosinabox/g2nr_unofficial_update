
const int SPL_Cost_TrfSheep = 5;
const int SPL_Cost_TrfScavenger = 5;
const int SPL_Cost_TrfGiantRat = 5;
const int SPL_Cost_TrfGiantBug = 5;
const int SPL_Cost_TrfWolf = 5;
const int SPL_Cost_TrfWaran = 5;
const int SPL_Cost_TrfSnapper = 5;
const int SPL_Cost_TrfWarg = 5;
const int SPL_Cost_TrfFireWaran = 5;
const int SPL_Cost_TrfLurker = 5;
const int SPL_Cost_TrfShadowbeast = 5;
const int SPL_Cost_TrfDragonSnapper = 5;

instance Spell_Transform(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_TrfSheep(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
	{
		b_startmagictransform(1);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfSheep;
		Npc_SetActiveSpellInfo(self,sheeptransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfScavenger(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfScavenger)
	{
		b_startmagictransform(7);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfScavenger;
		Npc_SetActiveSpellInfo(self,scavengertransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfGiantRat(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantRat)
	{
		b_startmagictransform(3);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfGiantRat;
		Npc_SetActiveSpellInfo(self,giant_rattransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfGiantBug(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantBug)
	{
		b_startmagictransform(8);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfGiantBug;
		Npc_SetActiveSpellInfo(self,giant_bugtransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWolf(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWolf)
	{
		b_startmagictransform(6);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfWolf;
		Npc_SetActiveSpellInfo(self,wolftransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWaran(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWaran)
	{
		b_startmagictransform(12);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfWaran;
		Npc_SetActiveSpellInfo(self,warantransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfSnapper(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
	{
		b_startmagictransform(12);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfSnapper;
		Npc_SetActiveSpellInfo(self,snappertransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWarg(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
	{
		b_startmagictransform(30);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfWarg;
		Npc_SetActiveSpellInfo(self,wargtransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfFireWaran(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfFireWaran)
	{
		b_startmagictransform(30);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfFireWaran;
		Npc_SetActiveSpellInfo(self,firewarantransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfLurker(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfLurker)
	{
		b_startmagictransform(12);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfLurker;
		Npc_SetActiveSpellInfo(self,lurkertransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfShadowbeast(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
	{
		b_startmagictransform(30);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfShadowbeast;
		Npc_SetActiveSpellInfo(self,shadowbeasttransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfDragonSnapper(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfDragonSnapper)
	{
		b_startmagictransform(40);
		self.attribute[ATR_MANA] -= SPL_Cost_TrfDragonSnapper;
		Npc_SetActiveSpellInfo(self,dragonsnappertransform);
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

