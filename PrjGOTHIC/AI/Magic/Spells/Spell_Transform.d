
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

func int Transform_Spell_Logic_Common(var int manaInvested,var int cost,var int creature)
{
	if(self.attribute[ATR_MANA] < cost)
	{
		return SPL_SENDSTOP;
	};
	if(manaInvested < SPL_Charge_Frames)
	{
		return SPL_NEXTLEVEL;
	};
	B_StartMagicTransform();
	self.attribute[ATR_MANA] -= cost;
	Npc_SetActiveSpellInfo(self,creature);
	return SPL_SENDCAST;
};

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
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfSheep,SheepTransform);
};

func int Spell_Logic_TrfScavenger(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfScavenger,ScavengerTransform);
};

func int Spell_Logic_TrfGiantRat(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfGiantRat,Giant_RatTransform);
};

func int Spell_Logic_TrfGiantBug(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfGiantBug,Giant_BugTransform);
};

func int Spell_Logic_TrfWolf(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfWolf,WolfTransform);
};

func int Spell_Logic_TrfWaran(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfWaran,WaranTransform);
};

func int Spell_Logic_TrfSnapper(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfSnapper,SnapperTransform);
};

func int Spell_Logic_TrfWarg(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfWarg,WargTransform);
};

func int Spell_Logic_TrfFireWaran(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfFireWaran,FireWaranTransform);
};

func int Spell_Logic_TrfLurker(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfLurker,LurkerTransform);
};

func int Spell_Logic_TrfShadowbeast(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfShadowbeast,ShadowbeastTransform);
};

func int Spell_Logic_TrfDragonSnapper(var int manaInvested)
{
	return Transform_Spell_Logic_Common(manaInvested,SPL_Cost_TrfDragonSnapper,DragonSnapperTransform);
};

