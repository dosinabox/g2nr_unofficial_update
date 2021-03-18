
instance StatsBook(C_Item)
{
	name = "Книга статистики";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_Stats.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_StatsBook;
};


func void Use_StatsBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Blue_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Blue_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,270,20,30,20,1);
	Doc_PrintLine(nDocID,0,ConcatStrings("Убито:                     ГЛАВА ",IntToString(Kapitel)));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_Draconian)," людей-ящеров"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_Dementor)," ищущих"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_OrcElite)," элитных орков"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_OrcCommander)," предводителей орков"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(MadKillerCount)," невинных людей"));
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Использовано:");
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalApplesEaten)," яблок"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalMushroomsEaten)," черных грибов"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalDexEaten)," гоблинских ягод"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalStrEaten)," драконьих корней"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalPermEaten)," царских щавелей"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Shell_Opener)," моллюсков"));
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Отдано:");
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalStoneplatesForVatras)," табличек Ватрасу"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(OldCoinCounter)," монет Василию"));
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(BusterTrophyCounter)," рогов Бастеру"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(DragonEggCounter)," яиц Беннету"));
	}
	else if(hero.guild == GIL_KDF)
	{
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(AlmanachCounter)," альманахов Пирокару"));
	}
	else if(hero.guild == GIL_PAL)
	{
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(OrkRingCounter)," колец Хагену"));
	};
	Doc_PrintLine(nDocID,0,"");
	if(Player_IsApprentice == APP_Constantino)
	{
		Doc_PrintLine(nDocID,0,"Ремесло (Константино):");
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Constantino_DunkelpilzCounter)," черных грибов продано"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Constantino_BigMushroomsCounter)," пищи рудокопа продано"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ApprenticeGoldCounter),PRINT_GoldTaken));
	}
	else if(Player_IsApprentice == APP_Bosper)
	{
		Doc_PrintLine(nDocID,0,"Ремесло (Боспер):");
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(BosperFurCounter)," шкур продано"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ApprenticeGoldCounter),PRINT_GoldTaken));
	}
	else if(Player_IsApprentice == APP_Harad)
	{
		Doc_PrintLine(nDocID,0,"Ремесло (Гарад):");
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(AnyAnvilUsed)," мечей выковано"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(HaradSwordsCounter)," мечей продано"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ApprenticeGoldCounter),PRINT_GoldTaken));
	};
	Doc_SetMargins(nDocID,-1,10,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Молитвы Инносу:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_GoldGiven),PRINT_GoldGiven));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_Str)," силы получено"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_Dex)," ловкости получено"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_MaxHp)," макс. здоровья получено"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_MaxMana)," макс. маны получено"));
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Молитвы Белиару:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_HpGiven)," макс. здоровья отдано"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_ManaGiven)," макс. маны отдано"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_GoldTaken),PRINT_GoldTaken));
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Улучшения Когтя:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_ClawMaxHp)," макс. здоровья отдано"));
	if(Saturas_KlaueInsMeer == FALSE)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(BeliarWeapCurrentLvL)," уровень"));
	}
	else
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(BeliarWeapCurrentLvL)," уровень (уничтожен)"));
	};
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Кражи:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalThefts)," успешных краж"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalTheftXP)," опыта получено"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalTheftGold)," золотых украдено"));
	Doc_PrintLine(nDocID,1,"");
	if(UnionActivated == TRUE)
	{
		Doc_PrintLine(nDocID,1,"Информация о сборке:");
	}
	else
	{
		Doc_PrintLine(nDocID,1,"Сборка (без Union):");
	};
	Doc_PrintLine(nDocID,1,ConcatStrings(ConcatStrings(IntToString(FIX_VERSION_START)," версия от "),FIX_VERSION_DATE));
	if(FIX_VERSION_SAVE == FALSE)
	{
		if(Addon_zuerst == TRUE)
		{
			Doc_PrintLine(nDocID,1,"Игра начата в оригинале");
		}
		else
		{
			Doc_PrintLine(nDocID,1,"Игра начата без аддона");
		};
	}
	else
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(FIX_VERSION_SAVE)," версия в сохранении"));
	};
	if(Wasteland_Seeded == TRUE)
	{
		Doc_PrintLine(nDocID,1,"Мир Wasteland заселен");
	};
	if(HardModeEnabled == TRUE)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(ConcatStrings("Опыт снижен на ",IntToString(HardModeXPModifier)),"%"));
	};
	Doc_Show(nDocID);
};

instance Helmets(C_Item)
{
	name = NAME_Bag;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Bag.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UseHelmets;
	description = name;
	text[0] = "Мешок наполнен экспериментальными";
	text[1] = "доспехами и шлемами!";
};


func void UseHelmets()
{
	CreateInvItem(self,ITAR_DJGN_M);
	CreateInvItem(self,ITAR_DJGN_H);
	CreateInvItem(self,ITAR_PALN_M);
	CreateInvItem(self,ITAR_PALN_H);
	CreateInvItem(self,ITAR_OHT);
	CreateInvItem(self,ITAR_DHT);
	CreateInvItem(self,ITHE_DJG_M);
	CreateInvItem(self,ITHE_DJG_H);
	CreateInvItem(self,ITHE_PAL_M);
	CreateInvItem(self,ITHE_PAL_H);
	CreateInvItem(self,ITHE_OHT);
	CreateInvItem(self,ITHE_DHT);
	Print("Найдено много разных доспехов и шлемов!");
};

instance WastelandRune(C_Item)
{
	name = "Руна Wasteland";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "Заселить мир мода Wasteland.";
	on_state[0] = UseWastelandRune;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseWastelandRune()
{
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		PrintScreen("Заселяем...",-1,-1,FONT_Screen,1);
		B_Seed_Wasteland_World_Main();
		B_Seed_Wasteland_World_Psicamp();
		B_Seed_Wasteland_World_Freeminecamp();
	}
	else
	{
		PrintScreen(PRINT_TeleportTooFarAway,-1,-1,FONT_Screen,1);
	};
};

func void b_build_settings_diag()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_PatchSettings_BACK);
	/*if(PenaltiesAffectLearnCost == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить влияние штрафов на стоимость обучения",StoryHelper_Penalties);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить влияние штрафов на стоимость обучения",StoryHelper_Penalties);
	};*/
	Info_AddChoice(StoryHelper_PatchSettings,"Изменить магию ледяного дракона",StoryHelper_IceDragonSpell);
	if(FullNPCRemoval == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить полное удаление NPC из мира",StoryHelper_FullNPCRemoval);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить полное удаление NPC из мира",StoryHelper_FullNPCRemoval);
	};
	if(AlternativeSmithing == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить альтернативное обучение у Беннета",StoryHelper_AlternativeSmithing);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить альтернативное обучение у Беннета",StoryHelper_AlternativeSmithing);
	};
	if(HardModeEnabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить повышенный уровень сложности",StoryHelper_HardMode);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить повышенный уровень сложности",StoryHelper_HardMode);
	};
	if(ClassicAlchemy == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить алхимию из Готики 2 без аддона",StoryHelper_ClassicAlchemy);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить алхимию из Готики 2 без аддона",StoryHelper_ClassicAlchemy);
	};
	if(Helmets_Enabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Отделить шлемы от доспехов",StoryHelper_Helmets);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Соединить шлемы и доспехи",StoryHelper_Helmets);
	};
	if(HonestStatCalculation == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить честный расчет стоимости обучения",StoryHelper_HonestStatCalculation);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить честный расчет стоимости обучения",StoryHelper_HonestStatCalculation);
	};
	if(AddonDisabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить возможность прохождения без аддона",StoryHelper_Addon);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить возможность прохождения без аддона",StoryHelper_Addon);
	};
	if(GuildlessMode == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить возможность прохождения без гильдии",StoryHelper_Guildless);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить возможность прохождения без гильдии",StoryHelper_Guildless);
	};
	if(!Npc_KnowsInfo(other,DIA_Coragon_GiveBook) && !Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		if(ClassicLehmarBook == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"Включить выкуп гроссбуха у Торбена и Корагона",StoryHelper_LehmarBook);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"Выключить выкуп гроссбуха у Торбена и Корагона",StoryHelper_LehmarBook);
		};
	};
	if(TradersHaveLimitedAmmo == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить лимит запаса стрел и болтов у торговцев",StoryHelper_Limit);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить лимит запаса стрел и болтов у торговцев",StoryHelper_Limit);
	};
	if(Dont_Fix_Unlim == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить бесконечную сталь и мензурки у торговцев",StoryHelper_Unlimfix);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить бесконечную сталь и мензурки у торговцев",StoryHelper_Unlimfix);
	};
	if(NpcWantToFlee == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить режим трусости у людей и животных",StoryHelper_Flee);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить режим трусости у людей и животных",StoryHelper_Flee);
	};
	if(IgnoreBonuses == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить игнорирование бонусов при прокачке",StoryHelper_Bonuses);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить игнорирование бонусов при прокачке",StoryHelper_Bonuses);
	};
	if(RandomGoblinBerries == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить рандомные гоблинские ягоды у паладинов",StoryHelper_GoblinBerries);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить рандомные гоблинские ягоды у паладинов",StoryHelper_GoblinBerries);
	};
	if(InfiniteApples == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить выбивание бесконечных яблок",StoryHelper_Apples);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить выбивание бесконечных яблок",StoryHelper_Apples);
	};
	if(XP_Static == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить фиксированный опыт по главам",StoryHelper_XP);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить фиксированный опыт по главам",StoryHelper_XP);
	};
	if(NoXPFromSummonedSkeletons == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить опыт с бесконечно призываемых скелетов",StoryHelper_Skeletons);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить опыт с бесконечно призываемых скелетов",StoryHelper_Skeletons);
	};
	if(NewLogEnabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить показ заголовков при обновлении дневника",StoryHelper_Log);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить показ заголовков при обновлении дневника",StoryHelper_Log);
	};
};

func void StoryHelper_Limit()
{
	if(TradersHaveLimitedAmmo == TRUE)
	{
		TradersHaveLimitedAmmo = FALSE;
		PrintScreen("Лимит выключен",-1,-1,FONT_Screen,2);
	}
	else
	{
		TradersHaveLimitedAmmo = TRUE;
		PrintScreen("Лимит включен",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Flee()
{
	if(NpcWantToFlee == TRUE)
	{
		NpcWantToFlee = FALSE;
		PrintScreen("Режим трусости выключен",-1,-1,FONT_Screen,2);
	}
	else
	{
		NpcWantToFlee = TRUE;
		PrintScreen("Режим трусости включен",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Unlimfix()
{
	if(Dont_Fix_Unlim == TRUE)
	{
		Dont_Fix_Unlim = FALSE;
		PrintScreen("Сталь и мензурки ограничены",-1,-1,FONT_Screen,2);
	}
	else
	{
		Dont_Fix_Unlim = TRUE;
		PrintScreen("Сталь и мензурки бесконечны",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Bonuses()
{
	if(IgnoreBonuses == TRUE)
	{
		IgnoreBonuses = FALSE;
		TAL_CostFlags_TS_PermBonus = 1;
		PrintScreen("Оригинал: бонусы нужно копить",-1,-1,FONT_Screen,2);
	}
	else
	{
		IgnoreBonuses = TRUE;
		TAL_CostFlags_TS_PermBonus = 0;
		PrintScreen("Теперь бонусы можно не копить",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_GoblinBerries()
{
	if(RandomGoblinBerries == TRUE)
	{
		RandomGoblinBerries = FALSE;
		PrintScreen("Фиксированное количество ягод у продавцов",-1,-1,FONT_Screen,3);
	}
	else
	{
		RandomGoblinBerries = TRUE;
		PrintScreen("Рандомное количество ягод у паладинов",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Apples()
{
	if(InfiniteApples == TRUE)
	{
		InfiniteApples = FALSE;
		PrintScreen("Бесконечные яблоки исправлены",-1,-1,FONT_Screen,2);
	}
	else
	{
		InfiniteApples = TRUE;
		PrintScreen("Яблоки бесконечны",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Helmets()
{
	if(Helmets_Enabled == TRUE)
	{
		PrintScreen("Шлемы и доспехи одной моделью (оригинал)",-1,-1,FONT_Screen,3);
		Npc_RemoveInvItem(hero,ITHE_PAL_M);
		Npc_RemoveInvItem(hero,ITHE_PAL_H);
		Npc_RemoveInvItem(hero,ITHE_DJG_M);
		Npc_RemoveInvItem(hero,ITHE_DJG_H);
		if(Npc_HasItems(hero,ITAR_PALN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_M);
			CreateInvItem(hero,ITAR_PAL_M);
		};
		if(Npc_HasItems(hero,ITAR_PALN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_H);
			CreateInvItem(hero,ITAR_PAL_H);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_M);
			CreateInvItem(hero,ITAR_DJG_M);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_H);
			CreateInvItem(hero,ITAR_DJG_H);
		};
		Helmets_Enabled = FALSE;
	}
	else
	{
		PrintScreen("Шлемы и доспехи разделены",-1,-1,FONT_Screen,2);
		if(Npc_HasItems(hero,ITAR_PAL_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_M);
			CreateInvItem(hero,ITAR_PALN_M);
			CreateInvItem(hero,ITHE_PAL_M);
		};
		if(Npc_HasItems(hero,ITAR_PAL_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_H);
			CreateInvItem(hero,ITAR_PALN_H);
			CreateInvItem(hero,ITHE_PAL_H);
		};
		if(Npc_HasItems(hero,ITAR_DJG_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_M);
			CreateInvItem(hero,ITAR_DJGN_M);
			CreateInvItem(hero,ITHE_DJG_M);
		};
		if(Npc_HasItems(hero,ITAR_DJG_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_H);
			CreateInvItem(hero,ITAR_DJGN_H);
			CreateInvItem(hero,ITHE_DJG_H);
		};
		Helmets_Enabled = TRUE;
	};
	b_build_settings_diag();
};

func void StoryHelper_ClassicAlchemy()
{
	if(ClassicAlchemy == TRUE)
	{
		ClassicAlchemy = FALSE;
		PrintScreen("Алхимия из Готики 2 без аддона выключена",-1,-1,FONT_Screen,3);
	}
	else
	{
		ClassicAlchemy = TRUE;
		PrintScreen("Алхимия из Готики 2 без аддона включена",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_AlternativeSmithing()
{
	if(AlternativeSmithing == TRUE)
	{
		AlternativeSmithing = FALSE;
		PrintScreen("Альтернативное обучение у Беннета выключено",-1,-1,FONT_Screen,3);
	}
	else
	{
		AlternativeSmithing = TRUE;
		PrintScreen("Альтернативное обучение у Беннета включено",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Log()
{
	if(NewLogEnabled == TRUE)
	{
		NewLogEnabled = FALSE;
		PrintScreen("Показ заголовков выключен",-1,-1,FONT_Screen,3);
	}
	else
	{
		NewLogEnabled = TRUE;
		PrintScreen("Показ заголовков включен",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Skeletons()
{
	if(NoXPFromSummonedSkeletons == TRUE)
	{
		NoXPFromSummonedSkeletons = FALSE;
		PrintScreen("Опыт за бесконечных скелетов включен",-1,-1,FONT_Screen,3);
	}
	else
	{
		NoXPFromSummonedSkeletons = TRUE;
		PrintScreen("Опыт за бесконечных скелетов выключен",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_HardMode()
{
	if(HardModeEnabled == TRUE)
	{
		HardModeEnabled = FALSE;
		PrintScreen("Повышенный уровень сложности выключен",-1,-1,FONT_Screen,3);
		b_build_settings_diag();
	}
	else
	{
		HardModeEnabled = TRUE;
		PrintScreen("Повышенный уровень сложности включен",-1,-1,FONT_Screen,3);
		Info_ClearChoices(StoryHelper_PatchSettings);
		Info_AddChoice(StoryHelper_PatchSettings,"-50% опыта",StoryHelper_HardMode_50);
		Info_AddChoice(StoryHelper_PatchSettings,"-40% опыта",StoryHelper_HardMode_40);
		Info_AddChoice(StoryHelper_PatchSettings,"-30% опыта",StoryHelper_HardMode_30);
		Info_AddChoice(StoryHelper_PatchSettings,"-20% опыта",StoryHelper_HardMode_20);
		Info_AddChoice(StoryHelper_PatchSettings,"-10% опыта",StoryHelper_HardMode_10);
	};
};

func void StoryHelper_HardMode_10()
{
	HardModeXPModifier = 10;
	PrintScreen("Получаемый опыт снижен на 10%",-1,YPOS_LOGENTRY,FONT_ScreenSmall,3);
	b_build_settings_diag();
};

func void StoryHelper_HardMode_20()
{
	HardModeXPModifier = 20;
	PrintScreen("Получаемый опыт снижен на 20%",-1,YPOS_LOGENTRY,FONT_ScreenSmall,3);
	b_build_settings_diag();
};

func void StoryHelper_HardMode_30()
{
	HardModeXPModifier = 30;
	PrintScreen("Получаемый опыт снижен на 30%",-1,YPOS_LOGENTRY,FONT_ScreenSmall,3);
	b_build_settings_diag();
};

func void StoryHelper_HardMode_40()
{
	HardModeXPModifier = 40;
	PrintScreen("Получаемый опыт снижен на 40%",-1,YPOS_LOGENTRY,FONT_ScreenSmall,3);
	b_build_settings_diag();
};

func void StoryHelper_HardMode_50()
{
	HardModeXPModifier = 50;
	PrintScreen("Получаемый опыт снижен на 50%",-1,YPOS_LOGENTRY,FONT_ScreenSmall,3);
	b_build_settings_diag();
};

func void StoryHelper_Penalties()
{
	if(PenaltiesAffectLearnCost == TRUE)
	{
		PenaltiesAffectLearnCost = FALSE;
		PrintScreen("Влияние штрафов на стоимость обучения выключено",-1,-1,FONT_Screen,3);
	}
	else
	{
		PenaltiesAffectLearnCost = TRUE;
		PrintScreen("Влияние штрафов на стоимость обучения включено",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_LehmarBook()
{
	if(ClassicLehmarBook == TRUE)
	{
		ClassicLehmarBook = FALSE;
		PrintScreen("Выкуп гроссбуха выключен",-1,-1,FONT_Screen,3);
	}
	else
	{
		ClassicLehmarBook = TRUE;
		PrintScreen("Выкуп гроссбуха как в оригинале",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Guildless()
{
	if(GuildlessMode == TRUE)
	{
		GuildlessMode = FALSE;
		PrintScreen("Прохождение без гильдии выключено",-1,-1,FONT_Screen,3);
	}
	else
	{
		GuildlessMode = TRUE;
		PrintScreen("Прохождение без гильдии включено",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Addon()
{
	if(AddonDisabled == TRUE)
	{
		AddonDisabled = FALSE;
		PrintScreen("Прохождение без аддона выключено",-1,-1,FONT_Screen,3);
	}
	else
	{
		AddonDisabled = TRUE;
		PrintScreen("Прохождение без аддона включено",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_XP()
{
	if(XP_Static == TRUE)
	{
		XP_Static = FALSE;
		if(Kapitel == 1)
		{
			XP_Ambient = XP_AmbientKap1;
		};
		if(Kapitel == 2)
		{
			XP_Ambient = XP_AmbientKap2;
		};
		if(Kapitel == 3)
		{
			XP_Ambient = XP_AmbientKap3;
		};
		if(Kapitel == 4)
		{
			XP_Ambient = XP_AmbientKap4;
		};
		if(Kapitel == 5)
		{
			XP_Ambient = XP_AmbientKap5;
		};
		if(Kapitel == 6)
		{
			XP_Ambient = XP_AmbientKap6;
		};
		PrintScreen("Оригинал: динамический опыт по главам",-1,-1,FONT_Screen,3);
		b_build_settings_diag();
	}
	else
	{
		Info_ClearChoices(StoryHelper_PatchSettings);
		Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_XP_Back);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 300 (глава 6)",StoryHelper_XP_6);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 250 (глава 5)",StoryHelper_XP_5);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 200 (глава 4)",StoryHelper_XP_4);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 150 (глава 3)",StoryHelper_XP_3);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 100 (глава 2)",StoryHelper_XP_2);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 50  (глава 1)",StoryHelper_XP_1);
	};
};

func void StoryHelper_XP_Back()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_6()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap6;
	PrintScreen("Теперь квесты можно не откладывать",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 300 (глава 6)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_5()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap5;
	PrintScreen("Теперь квесты можно не откладывать",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 250 (глава 5)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_4()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap4;
	PrintScreen("Теперь квесты можно не откладывать",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 200 (глава 4)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_3()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap3;
	PrintScreen("Теперь квесты можно не откладывать",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 150 (глава 3)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_2()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap2;
	PrintScreen("Теперь квесты можно не откладывать",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 100 (глава 2)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_1()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap1;
	PrintScreen("Теперь квесты можно не откладывать",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 50 (глава 1)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_HonestStatCalculation()
{
	if(HonestStatCalculation == TRUE)
	{
		HonestStatCalculation = FALSE;
		PrintScreen("Расчет стоимости обучения как в оригинале",-1,-1,FONT_Screen,3);
	}
	else
	{
		HonestStatCalculation = TRUE;
		PrintScreen("Честный расчет стоимости обучения включен",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_FullNPCRemoval()
{
	if(FullNPCRemoval == TRUE)
	{
		FullNPCRemoval = FALSE;
		PrintScreen("Полное удаление NPC из мира выключено",-1,-1,FONT_Screen,3);
	}
	else
	{
		FullNPCRemoval = TRUE;
		PrintScreen("Полное удаление NPC из мира включено",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_IceDragonSpell()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_IceDragonSpell_BACK);
	if(IceDragonSpell == SPL_InstantFireball)
	{
		Info_AddChoice(StoryHelper_PatchSettings,ConcatStrings(NAME_SPL_InstantFireball," (используется)"),StoryHelper_IceDragonSpell_InstantFireball);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,NAME_SPL_InstantFireball,StoryHelper_IceDragonSpell_InstantFireball);
	};
	if(IceDragonSpell == SPL_IceLance)
	{
		Info_AddChoice(StoryHelper_PatchSettings,ConcatStrings(NAME_SPL_IceLance," (используется)"),StoryHelper_IceDragonSpell_IceLance);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,NAME_SPL_IceLance,StoryHelper_IceDragonSpell_IceLance);
	};
	if(IceDragonSpell == SPL_ChargeZap)
	{
		Info_AddChoice(StoryHelper_PatchSettings,ConcatStrings(NAME_SPL_ChargeZap," (используется)"),StoryHelper_IceDragonSpell_ChargeZap);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,NAME_SPL_ChargeZap,StoryHelper_IceDragonSpell_ChargeZap);
	};
	if(IceDragonSpell == SPL_Icebolt)
	{
		Info_AddChoice(StoryHelper_PatchSettings,ConcatStrings(NAME_SPL_Icebolt," (используется)"),StoryHelper_IceDragonSpell_Icebolt);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,NAME_SPL_Icebolt,StoryHelper_IceDragonSpell_Icebolt);
	};
};

func void StoryHelper_IceDragonSpell_InstantFireball()
{
	IceDragonSpell = SPL_InstantFireball;
	PrintScreen(ConcatStrings("Магия ледяного дракона: ",NAME_SPL_InstantFireball),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_IceLance()
{
	IceDragonSpell = SPL_IceLance;
	PrintScreen(ConcatStrings("Магия ледяного дракона: ",NAME_SPL_IceLance),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_ChargeZap()
{
	IceDragonSpell = SPL_ChargeZap;
	PrintScreen(ConcatStrings("Магия ледяного дракона: ",NAME_SPL_ChargeZap),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_Icebolt()
{
	IceDragonSpell = SPL_Icebolt;
	PrintScreen(ConcatStrings("Магия ледяного дракона: ",NAME_SPL_Icebolt),-1,-1,FONT_Screen,3);
	StoryHelper_IceDragonSpell();
};

func void StoryHelper_IceDragonSpell_BACK()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_PatchSettings_BACK()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
};

