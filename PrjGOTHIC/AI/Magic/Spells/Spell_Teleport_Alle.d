
const int SPL_Cost_Teleport = 10;

func void B_TeleportBySpell(var int level,var string waypoint)
{
	self.attribute[ATR_MANA] -= SPL_Cost_Teleport;
	if(level == CurrentLevel)
	{
		AI_Teleport(self,waypoint);
	}
	else
	{
		PrintScreen(PRINT_TeleportTooFarAway,-1,YPOS_LevelUp,FONT_ScreenSmall,2);
	};
};

func int Teleport_Spell_Logic_Common(var int manaInvested)
{
	if(self.attribute[ATR_MANA] < SPL_Cost_Teleport)
	{
		return SPL_SENDSTOP;
	};
	if(manaInvested == 0)
	{
		return SPL_NEXTLEVEL;
	};
	return SPL_SENDCAST;
};

instance Spell_Teleport(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};

func void Spell_Cast_Teleport()
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_PalTeleportSecret)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"NW_PAL_SECRETCHAMBER");
	}
	else if(activeSpell == SPL_TeleportSeaport)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"HAFEN");
	}
	else if(activeSpell == SPL_TeleportMonastery)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"KLOSTER");
	}
	else if(activeSpell == SPL_TeleportFarm)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"BIGFARM");
	}
	else if(activeSpell == SPL_TeleportXardas)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"XARDAS");
	}
	else if(activeSpell == SPL_TeleportPassNW)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"LEVELCHANGE");
	}
	else if(activeSpell == SPL_TeleportPassOW)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"SPAWN_MOLERAT02_SPAWN01");
	}
	else if(activeSpell == SPL_TeleportOC)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"OC_MAGE_CENTER");
	}
	else if(activeSpell == SPL_TeleportOWDemonTower)
	{
		B_TeleportBySpell(OLDWORLD_ZEN,"DT_E3_03");
	}
	else if(activeSpell == SPL_TeleportTaverne)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"NW_TAVERNE_04");
	}
	else if(activeSpell == SPL_TeleportRitual)
	{
		B_TeleportBySpell(NEWWORLD_ZEN,"RITUAL");
	}
	else if(activeSpell == SPL_Teleport_Maya)
	{
		B_TeleportBySpell(ADDONWORLD_ZEN,"ADW_VALLEY_PATH_054_G");
	};
};

