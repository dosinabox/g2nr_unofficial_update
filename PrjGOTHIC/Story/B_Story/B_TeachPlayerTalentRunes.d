
func string B_BuildRunesIngredientsText(var string spell,var string ingredients)
{
	var string text;
	text = ConcatStrings("Ингредиенты для руны '",spell);
	text = ConcatStrings(text,"': ");
	text = ConcatStrings(text,ingredients);
	return text;
};

func void B_CreateScrollForTrading(var int scroll)
{
	var C_Npc trader;
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(!Npc_IsDead(Gorax))
		{
			trader = Hlp_GetNpc(Gorax);
		}
		else if(!Npc_IsDead(Isgaroth))
		{
			trader = Hlp_GetNpc(Isgaroth);
		}
		else if(!Npc_IsDead(Orlan))
		{
			trader = Hlp_GetNpc(Orlan);
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(!Npc_IsDead(Engor))
		{
			trader = Hlp_GetNpc(Engor);
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(!Npc_IsDead(Cronos_ADW))
		{
			trader = Hlp_GetNpc(Cronos_ADW);
		};
	};
	if(Hlp_IsValidNpc(trader))
	{
		if(!Npc_HasItems(trader,scroll))
		{
			CreateInvItem(trader,scroll);
		};
	};
};

func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	if(PremiumTeachersEnabled == TRUE)
	{
		if(!B_GiveInvItems(oth,slf,ItMi_Gold,kosten * PremiumTeachersPrice))
		{
			PrintScreen(Print_NotEnoughGold,-1,-1,FONT_Screen,2);
			DIA_Common_WeWillGetToThatLater();
			return FALSE;
		};
	};
	oth.lp -= kosten;
	if(!Npc_GetTalentSkill(oth,NPC_TALENT_RUNES))
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
		Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentRunes,"Чтобы создать руну, мне нужен свиток с заклинанием и определенные ингредиенты. При помощи этих ингредиентов и чистого рунного камня я могу создать руну на рунном столе.");
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		B_CreateScrollForTrading(ItSc_Light);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Light,"1 золотая монета."));
	}
	else if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		B_CreateScrollForTrading(ItSc_Firebolt);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Firebolt,"1 сера."));
	}
	else if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		B_CreateScrollForTrading(ItSc_Icebolt);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Icebolt,"1 ледяной кварц."));
	}
	else if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		B_CreateScrollForTrading(ItSc_LightHeal);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_LightHeal,"1 лечебная трава."));
	}
	else if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		B_CreateScrollForTrading(ItSc_SumGobSkel);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_SummonGoblinSkeleton,"1 кость гоблина."));
	}
	else if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		B_CreateScrollForTrading(ItSc_InstantFireball);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_InstantFireball,"1 смола."));
	}
	else if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		B_CreateScrollForTrading(ItSc_Zap);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Zap,"1 горный хрусталь."));
	}
	else if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		B_CreateScrollForTrading(ItSc_SumWolf);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_SummonWolf,"1 шкура волка."));
	}
	else if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		B_CreateScrollForTrading(ItSc_Windfist);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_WindFist,"1 уголь."));
	}
	else if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		B_CreateScrollForTrading(ItSc_Sleep);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Sleep,"1 болотная трава."));
	}
	else if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		B_CreateScrollForTrading(ItSc_MediumHeal);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_MediumHeal,"1 лечебное растение."));
	}
	else if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		B_CreateScrollForTrading(ItSc_LightningFlash);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_LightningFlash,"1 горный хрусталь и 1 ледяной кварц."));
	}
	else if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		B_CreateScrollForTrading(ItSc_ChargeFireBall);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_ChargeFireball,"1 сера и 1 смола."));
	}
	else if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		B_CreateScrollForTrading(ItSc_SumSkel);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_SummonSkeleton,"1 кость скелета."));
	}
	else if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		B_CreateScrollForTrading(ItSc_Fear);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Fear,"1 черная жемчужина."));
	}
	else if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		B_CreateScrollForTrading(ItSc_IceCube);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_IceCube,"1 ледяной кварц и 1 аквамарин."));
	}
	else if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		B_CreateScrollForTrading(ItSc_ThunderBall);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_ChargeZap,"1 сера и 1 горный хрусталь."));
	}
	else if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		B_CreateScrollForTrading(ItSc_SumGol);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_SummonGolem,"1 сердце каменного голема."));
	}
	else if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		B_CreateScrollForTrading(ItSc_HarmUndead);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_DestroyUndead,"1 святая вода."));
	}
	else if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		B_CreateScrollForTrading(ItSc_Pyrokinesis);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Pyrokinesis,"1 сера и 1 язык огненного ящера."));
	}
	else if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		B_CreateScrollForTrading(ItSc_Firestorm);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Firestorm,"1 сера и 1 смола."));
	}
	else if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		B_CreateScrollForTrading(ItSc_IceWave);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_IceWave,"1 ледяной кварц и 1 аквамарин."));
	}
	else if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		B_CreateScrollForTrading(ItSc_SumDemon);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_SummonDemon,"1 сердце демона."));
	}
	else if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		B_CreateScrollForTrading(ItSc_FullHeal);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_FullHeal,"1 лечебный корень."));
	}
	else if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		B_CreateScrollForTrading(ItSc_Firerain);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Firerain,"1 смола, 1 сера и 1 язык огненного ящера."));
	}
	else if(spell == SPL_BreathOfDeath)
	{
		PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
		B_CreateScrollForTrading(ItSc_BreathOfDeath);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_BreathOfDeath,"1 уголь и 1 черная жемчужина."));
	}
	else if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		B_CreateScrollForTrading(ItSc_MassDeath);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_MassDeath,"1 кость скелета и 1 черная жемчужина."));
	}
	else if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		B_CreateScrollForTrading(ItSc_ArmyOfDarkness);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_ArmyOfDarkness,"1 кость скелета, 1 черная жемчужина, 1 сердце каменного голема и 1 cердце демона."));
	}
	else if(spell == SPL_Shrink)
	{
		PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
		B_CreateScrollForTrading(ItSc_Shrink);
		if(!Npc_IsDead(Constantino))
		{
			if(!Npc_HasItems(Constantino,ItAt_GoblinBone))
			{
				CreateInvItems(Constantino,ItAt_GoblinBone,1);
			};
		};
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Shrink,"1 кость гоблина и 1 клык тролля."));
	}
	else if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		B_CreateScrollForTrading(ItSc_Whirlwind);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Whirlwind,"1 крыло кровавой мухи."));
	}
	else if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		B_CreateScrollForTrading(ItSc_Waterfist);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_WaterFist,"1 аквамарин и 1 горный хрусталь."));
	}
	else if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		B_CreateScrollForTrading(ItSc_Icelance);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_IceLance,"1 ледяной кварц."));
	}
	else if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		B_CreateScrollForTrading(ItSc_Geyser);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Geyser,"1 аквамарин."));
	}
	else if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		B_CreateScrollForTrading(ItSc_Thunderstorm);
		B_LogEntry(TOPIC_TalentRunes,B_BuildRunesIngredientsText(NAME_SPL_Thunderstorm,"1 ледяной кварц и 1 крыло кровавой мухи."));
	};
	PrintScreen(PRINT_LearnRunes,-1,-1,FONT_Screen,2);
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
	if(PremiumTeachersEnabled == TRUE)
	{
		if(!B_GiveInvItems(oth,slf,ItMi_Gold,kosten * PremiumTeachersPrice))
		{
			PrintScreen(Print_NotEnoughGold,-1,-1,FONT_Screen,2);
			DIA_Common_WeWillGetToThatLater();
			return FALSE;
		};
	};
	oth.lp -= kosten;
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
		CreateInvItems(slf,ItRu_PalLight,1);
		B_GiveInvItems(slf,oth,ItRu_PalLight,1);
	}
	else if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
		CreateInvItems(slf,ItRu_PalHeal_01,1);
		B_GiveInvItems(slf,oth,ItRu_PalHeal_01,1);
	}
	else if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
		CreateInvItems(slf,ItRu_PalHolyBolt,1);
		B_GiveInvItems(slf,oth,ItRu_PalHolyBolt,1);
	}
	else if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
		CreateInvItems(slf,ItRu_PalHeal_02,1);
		B_GiveInvItems(slf,oth,ItRu_PalHeal_02,1);
	}
	else if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
		CreateInvItems(slf,ItRu_PalRepelEvil,1);
		B_GiveInvItems(slf,oth,ItRu_PalRepelEvil,1);
	}
	else if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
		CreateInvItems(slf,ItRu_PalHeal_03,1);
		B_GiveInvItems(slf,oth,ItRu_PalHeal_03,1);
	}
	else if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
		CreateInvItems(slf,ItRu_PalDestroyEvil,1);
		B_GiveInvItems(slf,oth,ItRu_PalDestroyEvil,1);
	};
	return TRUE;
};

