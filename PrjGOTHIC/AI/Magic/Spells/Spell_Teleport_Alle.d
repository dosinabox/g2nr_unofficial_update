
const int SPL_Cost_Teleport = 10;

func void B_PrintTeleportTooFarAway(var int level)
{
	if(level != CurrentLevel)
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
	self.attribute[ATR_MANA] -= SPL_Cost_Teleport;
	if(Npc_GetActiveSpell(self) == SPL_PalTeleportSecret)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"NW_PAL_SECRETCHAMBER");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportSeaport)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"HAFEN");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportMonastery)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"KLOSTER");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportFarm)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"BIGFARM");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportXardas)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"XARDAS");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassNW)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"LEVELCHANGE");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassOW)
	{
		B_PrintTeleportTooFarAway(OLDWORLD_ZEN);
		AI_Teleport(self,"SPAWN_MOLERAT02_SPAWN01");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOC)
	{
		B_PrintTeleportTooFarAway(OLDWORLD_ZEN);
		AI_Teleport(self,"OC_MAGE_CENTER");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)
	{
		B_PrintTeleportTooFarAway(OLDWORLD_ZEN);
		AI_Teleport(self,"DT_E3_03");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportTaverne)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"NW_TAVERNE_04");
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportRitual)
	{
		B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
		AI_Teleport(self,"RITUAL");
	};
	if(Npc_GetActiveSpell(self) == SPL_Teleport_Maya)
	{
		B_PrintTeleportTooFarAway(ADDONWORLD_ZEN);
		AI_Teleport(self,"ADW_VALLEY_PATH_054_G");
	};
};

