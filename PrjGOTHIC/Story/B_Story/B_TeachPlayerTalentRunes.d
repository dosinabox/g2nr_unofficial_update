
func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var C_Npc ScrollTrader;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp -= kosten;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	Log_AddEntry(TOPIC_TalentRunes,"Чтобы создать руну, мне нужен свиток с заклинанием и определенные ингредиенты. При помощи этих ингредиентов и чистого рунного камня я могу создать руну на рунном столе.");
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(!Npc_IsDead(Gorax))
		{
			ScrollTrader = Hlp_GetNpc(Gorax);
		}
		else if(!Npc_IsDead(Isgaroth))
		{
			ScrollTrader = Hlp_GetNpc(Isgaroth);
		}
		else if(!Npc_IsDead(Orlan))
		{
			ScrollTrader = Hlp_GetNpc(Orlan);
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(!Npc_IsDead(Engor))
		{
			ScrollTrader = Hlp_GetNpc(Engor);
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(!Npc_IsDead(Cronos_ADW))
		{
			ScrollTrader = Hlp_GetNpc(Cronos_ADW);
		};
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Light))
		{
			CreateInvItems(ScrollTrader,ItSc_Light,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Свет': 1 золотая монета.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Firebolt))
		{
			CreateInvItems(ScrollTrader,ItSc_Firebolt,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Огненная стрела': 1 сера.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Icebolt))
		{
			CreateInvItems(ScrollTrader,ItSc_Icebolt,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Ледяная стрела': 1 ледяной кварц.");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_LightHeal))
		{
			CreateInvItems(ScrollTrader,ItSc_LightHeal,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Лечение легких ранений': 1 лечебная трава.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_SumGobSkel))
		{
			CreateInvItems(ScrollTrader,ItSc_SumGobSkel,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов скелета гоблина': 1 кость гоблина.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_InstantFireball))
		{
			CreateInvItems(ScrollTrader,ItSc_InstantFireball,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Огненный шар ': 1 смола.");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Zap))
		{
			CreateInvItems(ScrollTrader,ItSc_Zap,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Малая молния': 1 горный хрусталь.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_SumWolf))
		{
			CreateInvItems(ScrollTrader,ItSc_SumWolf,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов волка': 1 шкура волка.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Windfist))
		{
			CreateInvItems(ScrollTrader,ItSc_Windfist,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Кулак ветра': 1 уголь.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Sleep))
		{
			CreateInvItems(ScrollTrader,ItSc_Sleep,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Сон': 1 болотная трава.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_MediumHeal))
		{
			CreateInvItems(ScrollTrader,ItSc_MediumHeal,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Лечение средних ранений': 1 лечебное растение.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_LightningFlash))
		{
			CreateInvItems(ScrollTrader,ItSc_LightningFlash,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Молния': 1 горный хрусталь и 1 ледяной кварц.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_ChargeFireBall))
		{
			CreateInvItems(ScrollTrader,ItSc_ChargeFireBall,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Большой огненный шар': 1 сера и 1 смола.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_SumSkel))
		{
			CreateInvItems(ScrollTrader,ItSc_SumSkel,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов скелета': 1 кость скелета.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Fear))
		{
			CreateInvItems(ScrollTrader,ItSc_Fear,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Страх': 1 черная жемчужина.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_IceCube))
		{
			CreateInvItems(ScrollTrader,ItSc_IceCube,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Ледяной блок': 1 ледяной кварц и 1 аквамарин.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_ThunderBall))
		{
			CreateInvItems(ScrollTrader,ItSc_ThunderBall,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Шаровая молния': 1 сера и 1 горный хрусталь.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_SumGol))
		{
			CreateInvItems(ScrollTrader,ItSc_SumGol,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов голема': 1 сердце каменного голема.");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_HarmUndead))
		{
			CreateInvItems(ScrollTrader,ItSc_HarmUndead,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Уничтожение нежити': 1 святая вода.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Pyrokinesis))
		{
			CreateInvItems(ScrollTrader,ItSc_Pyrokinesis,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Большая огненная буря': 1 сера и 1 язык огненного ящера.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Firestorm))
		{
			CreateInvItems(ScrollTrader,ItSc_Firestorm,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Малая огненная буря': 1 сера и 1 смола.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_IceWave))
		{
			CreateInvItems(ScrollTrader,ItSc_IceWave,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Ледяная волна': 1 ледяной кварц и 1 аквамарин.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_SumDemon))
		{
			CreateInvItems(ScrollTrader,ItSc_SumDemon,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов демона': 1 сердце демона.");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_FullHeal))
		{
			CreateInvItems(ScrollTrader,ItSc_FullHeal,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Лечение тяжелых ранений': 1 лечебный корень.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Firerain))
		{
			CreateInvItems(ScrollTrader,ItSc_Firerain,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Огненный дождь': 1 смола и 1 язык огненного ящера.");
	};
	if(spell == SPL_BreathOfDeath)
	{
		PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_BreathOfDeath))
		{
			CreateInvItems(ScrollTrader,ItSc_BreathOfDeath,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Дыхание смерти': 1 уголь и 1 черная жемчужина.");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_MassDeath))
		{
			CreateInvItems(ScrollTrader,ItSc_MassDeath,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Волна смерти': 1 кость скелета и 1 черная жемчужина.");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_ArmyOfDarkness))
		{
			CreateInvItems(ScrollTrader,ItSc_ArmyOfDarkness,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Армия Тьмы': 1 кость скелета, 1 черная жемчужина, 1 сердце каменного голема и 1 cердце демона.");
	};
	if(spell == SPL_Shrink)
	{
		PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Shrink))
		{
			CreateInvItems(ScrollTrader,ItSc_Shrink,1);
		};
		if(!Npc_IsDead(Constantino) && !Npc_HasItems(Constantino,ItAt_GoblinBone))
		{
			CreateInvItems(Constantino,ItAt_GoblinBone,1);
		};
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Уменьшение монстра': 1 кость гоблина и 1 клык тролля.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Whirlwind))
		{
			CreateInvItems(ScrollTrader,ItSc_Whirlwind,1);
		};
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Whirlwind);
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Waterfist))
		{
			CreateInvItems(ScrollTrader,ItSc_Waterfist,1);
		};
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Waterfist);
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Icelance))
		{
			CreateInvItems(ScrollTrader,ItSc_Icelance,1);
		};
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Icelance);
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Geyser))
		{
			CreateInvItems(ScrollTrader,ItSc_Geyser,1);
		};
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Geyser);
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		if(!Npc_HasItems(ScrollTrader,ItSc_Thunderstorm))
		{
			CreateInvItems(ScrollTrader,ItSc_Thunderstorm,1);
		};
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Thunderstorm);
	};
	PrintScreen(PRINT_LearnRunes,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};


func int B_TeachPlayerPalRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp -= kosten;
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
		CreateInvItems(slf,ItRu_PalLight,1);
		B_GiveInvItems(slf,oth,ItRu_PalLight,1);
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
		CreateInvItems(slf,ItRu_PalLightHeal,1);
		B_GiveInvItems(slf,oth,ItRu_PalLightHeal,1);
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
		CreateInvItems(slf,ItRu_PalHolyBolt,1);
		B_GiveInvItems(slf,oth,ItRu_PalHolyBolt,1);
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
		CreateInvItems(slf,ItRu_PalMediumHeal,1);
		B_GiveInvItems(slf,oth,ItRu_PalMediumHeal,1);
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
		CreateInvItems(slf,ItRu_PalRepelEvil,1);
		B_GiveInvItems(slf,oth,ItRu_PalRepelEvil,1);
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
		CreateInvItems(slf,ItRu_PalFullHeal,1);
		B_GiveInvItems(slf,oth,ItRu_PalFullHeal,1);
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
		CreateInvItems(slf,ItRu_PalDestroyEvil,1);
		B_GiveInvItems(slf,oth,ItRu_PalDestroyEvil,1);
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
		CreateInvItems(slf,ItRu_PalTeleportSecret,1);
		B_GiveInvItems(slf,oth,ItRu_PalTeleportSecret,1);
	};
	return TRUE;
};

