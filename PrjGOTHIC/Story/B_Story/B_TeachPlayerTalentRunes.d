
func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var C_Npc ScrollTrader;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes,"Чтобы создать руну, мне нужен свиток с заклинанием и определенные ингредиенты. При помощи этих ингредиентов и чистого рунного камня я могу создать руну на рунном столе.");
	if(Npc_IsDead(Gorax) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if(Npc_IsDead(Isgaroth) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if(Npc_IsDead(Engor) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if(Npc_IsDead(Orlan) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	}
	else if(Npc_IsDead(Cronos_ADW) == FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Cronos_ADW);
	};
	if(spell == SPL_PalLight)
	{
		player_talent_runes[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		player_talent_runes[SPL_PalLightHeal] = TRUE;
	};
	if(spell == SPL_PalHolyBolt)
	{
		player_talent_runes[SPL_PalHolyBolt] = TRUE;
	};
	if(spell == SPL_PalMediumHeal)
	{
		player_talent_runes[SPL_PalMediumHeal] = TRUE;
	};
	if(spell == SPL_PalRepelEvil)
	{
		player_talent_runes[SPL_PalRepelEvil] = TRUE;
	};
	if(spell == SPL_PalFullHeal)
	{
		player_talent_runes[SPL_PalFullHeal] = TRUE;
	};
	if(spell == SPL_PalDestroyEvil)
	{
		player_talent_runes[SPL_PalDestroyEvil] = TRUE;
	};
	if(spell == SPL_PalTeleportSecret)
	{
		player_talent_runes[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		player_talent_runes[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		player_talent_runes[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		player_talent_runes[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		player_talent_runes[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		player_talent_runes[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		player_talent_runes[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		player_talent_runes[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		player_talent_runes[SPL_Light] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Light,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Свет': 1 золотая монета.");
	};
	if(spell == SPL_Firebolt)
	{
		player_talent_runes[SPL_Firebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firebolt,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Огненная стрела': 1 сера.");
	};
	if(spell == SPL_Icebolt)
	{
		player_talent_runes[SPL_Icebolt] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icebolt,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Ледяная стрела': 1 ледяной кварц");
	};
	if(spell == SPL_LightHeal)
	{
		player_talent_runes[SPL_LightHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Лечение легких ранений':1 лечебная трава.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		player_talent_runes[SPL_SummonGoblinSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGobSkel,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Создание скелета гоблина':1 кость гоблина.");
	};
	if(spell == SPL_InstantFireball)
	{
		player_talent_runes[SPL_InstantFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_InstantFireball,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Огненный шар ': 1 смола");
	};
	if(spell == SPL_Zap)
	{
		player_talent_runes[SPL_Zap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Zap,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Малая молния':1 горный хрусталь.");
	};
	if(spell == SPL_SummonWolf)
	{
		player_talent_runes[SPL_SummonWolf] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumWolf,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов волка': 1 шкура волка.");
	};
	if(spell == SPL_WindFist)
	{
		player_talent_runes[SPL_WindFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Windfist,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Кулак ветра':1 уголь.");
	};
	if(spell == SPL_Sleep)
	{
		player_talent_runes[SPL_Sleep] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Sleep,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Сон': 1 болотная трава.");
	};
	if(spell == SPL_MediumHeal)
	{
		player_talent_runes[SPL_MediumHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MediumHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Лечение средних ранений': 1 лечебное растение.");
	};
	if(spell == SPL_LightningFlash)
	{
		player_talent_runes[SPL_LightningFlash] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_LightningFlash,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Молния': 1 горный хрусталь и 1 ледяной кварц.");
	};
	if(spell == SPL_ChargeFireball)
	{
		player_talent_runes[SPL_ChargeFireball] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ChargeFireBall,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Большой огненный шар': 1 сера и 1 смола.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		player_talent_runes[SPL_SummonSkeleton] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumSkel,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Создание скелета': 1 кость скелета.");
	};
	if(spell == SPL_Fear)
	{
		player_talent_runes[SPL_Fear] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Fear,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Страх': 1 черный жемчуг.");
	};
	if(spell == SPL_IceCube)
	{
		player_talent_runes[SPL_IceCube] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceCube,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Ледяной блок': 1 ледяной кварц и 1 аквамарин.");
	};
	if(spell == SPL_ChargeZap)
	{
		player_talent_runes[SPL_ChargeZap] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ThunderBall,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Шаровая молния': 1 сера и 1 горный хрусталь.");
	};
	if(spell == SPL_SummonGolem)
	{
		player_talent_runes[SPL_SummonGolem] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumGol,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны `Пробуждение голема`:1 сердце каменного голема.");
	};
	if(spell == SPL_DestroyUndead)
	{
		player_talent_runes[SPL_DestroyUndead] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_HarmUndead,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Уничтожение нежити':1 святая вода .");
	};
	if(spell == SPL_Pyrokinesis)
	{
		player_talent_runes[SPL_Pyrokinesis] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Pyrokinesis,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны `Большая огненная буря': 1 сера и 1 язык огненного ящера.");
	};
	if(spell == SPL_Firestorm)
	{
		player_talent_runes[SPL_Firestorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firestorm,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Малая огненная буря': 1 сера и 1 смола.");
	};
	if(spell == SPL_IceWave)
	{
		player_talent_runes[SPL_IceWave] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_IceWave,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Ледяная волна': 1 ледяной кварц и 1 аквамарин");
	};
	if(spell == SPL_SummonDemon)
	{
		player_talent_runes[SPL_SummonDemon] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_SumDemon,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Вызов демона': 1 Сердце демона");
	};
	if(spell == SPL_FullHeal)
	{
		player_talent_runes[SPL_FullHeal] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_FullHeal,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Лечение тяжелых ранений? 1 лечебный корень");
	};
	if(spell == SPL_Firerain)
	{
		player_talent_runes[SPL_Firerain] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Firerain,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Огненный дождь': 1 смола и 1 язык огненного ящера.");
	};
	if(spell == SPL_BreathOfDeath)
	{
		player_talent_runes[SPL_BreathOfDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_BreathOfDeath,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Дыхание смерти': 1 уголь и 1 черный жемчуг");
	};
	if(spell == SPL_MassDeath)
	{
		player_talent_runes[SPL_MassDeath] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_MassDeath,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Волна смерти': 1 кость скелета и 1 черный жемчуг");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		player_talent_runes[SPL_ArmyOfDarkness] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_ArmyOfDarkness,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Армия тьмы': 1 кость скелета, 1 черный жемчуг, 1 сердце каменного голема и 1 Сердце демона. ");
	};
	if(spell == SPL_Shrink)
	{
		player_talent_runes[SPL_Shrink] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Shrink,1);
		B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Сморщивание монстра': 1 кость гоблина и 1 клык тролля");
	};
	if(spell == SPL_Whirlwind)
	{
		player_talent_runes[SPL_Whirlwind] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Whirlwind,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Whirlwind);
	};
	if(spell == SPL_WaterFist)
	{
		player_talent_runes[SPL_WaterFist] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Waterfist,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Waterfist);
	};
	if(spell == SPL_IceLance)
	{
		player_talent_runes[SPL_IceLance] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Icelance,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Icelance);
	};
	if(spell == SPL_Geyser)
	{
		player_talent_runes[SPL_Geyser] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Geyser,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Geyser);
	};
	if(spell == SPL_Thunderstorm)
	{
		player_talent_runes[SPL_Thunderstorm] = TRUE;
		CreateInvItems(ScrollTrader,ItSc_Thunderstorm,1);
		B_LogEntry(TOPIC_TalentRunes,Log_Text_Addon_TalentRune_Thunderstorm);
	};
	PrintScreen(PRINT_LearnRunes,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

