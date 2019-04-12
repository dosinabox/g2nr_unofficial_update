
prototype C_Spell_Proto(C_Spell)
{
	time_per_mana = 500;
	damage_per_level = 1;
	damagetype = DAM_MAGIC;
	spellType = SPELL_BAD;
	canTurnDuringInvest = 1;
	canChangeTargetDuringInvest = 1;
	isMultiEffect = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType = TARGET_TYPE_NPCS;
	targetCollectRange = 10000;
	targetCollectAzi = 60;
	targetCollectElev = 60;
};

