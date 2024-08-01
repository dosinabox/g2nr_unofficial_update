
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
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Blue_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Blue_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,270,20,30,20,1);
	Doc_PrintLine(nDocID,0,ConcatStrings("Убито:              ГЛАВА ",IntToString(Kapitel)));
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
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalSwampHerbsForFortuno)," болотных трав Фортуно"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalSilverForHalvor)," серебра Халвору"));
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
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalThefts)," успешных краж"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalTheftXP)," опыта с краж"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalTheftGold)," золотых украдено"));
	if(UnionActivated == TRUE)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalLocksPicked)," замков взломано"));
	};
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalOldCampCrimes + TotalCityCrimes + TotalMonasteryCrimes + TotalFarmCrimes)," штрафов назначено"));
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,ConcatStrings("Сборка: ",B_BuildFullVersionString(FIX_VERSION,FIX_DATE_DAY,FIX_DATE_MONTH,FIX_DATE_YEAR)));
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
		Doc_PrintLine(nDocID,1,ConcatStrings("Сохранение: ",B_BuildFullVersionString(FIX_VERSION_SAVE,FIX_DATE_DAY_SAVE,FIX_DATE_MONTH_SAVE,FIX_DATE_YEAR_SAVE)));
	};
	if(UnionActivated == FALSE)
	{
		Doc_PrintLine(nDocID,1,"Union не активен");
	};
	if(Wasteland_Seeded == TRUE)
	{
		Doc_PrintLine(nDocID,1,"Мир Wasteland заселен");
	};
	if(HardModeXPModifier > 0)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(ConcatStrings("Опыт снижен на ",IntToString(HardModeXPModifier)),"%"));
	};
	Doc_Show(nDocID);
};

instance AttBook(C_Item) //TODO перенести в StatsBook
{
	name = "Книга атрибутов";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_GregsLogbuch_MIS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
	on_state[0] = UseAttributesBook;
};


func void UseAttributesBook()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Сила: ",IntToString(hero.attribute[ATR_STRENGTH])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_STRENGTH])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_STRENGTH])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_STRENGTH])," - временные бонусы"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Ловкость: ",IntToString(hero.attribute[ATR_DEXTERITY])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_DEXTERITY])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_DEXTERITY])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_DEXTERITY])," - временные бонусы"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Макс. мана: ",IntToString(hero.attribute[ATR_MANA_MAX])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_MANA_MAX])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_MANA_MAX])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_MANA_MAX])," - временные бонусы"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("Макс. здоровье: ",IntToString(hero.attribute[ATR_HITPOINTS_MAX])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_HITPOINTS_MAX])," - учителя"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_HITPOINTS_MAX])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_HITPOINTS_MAX])," - временные бонусы"));
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Одноручное оружие: ",IntToString(hero.HitChance[NPC_TALENT_1H])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_1H])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_1H])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_1H])," - временные бонусы"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Двуручное оружие: ",IntToString(hero.HitChance[NPC_TALENT_2H])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_2H])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_2H])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_2H])," - временные бонусы"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Луки: ",IntToString(hero.HitChance[NPC_TALENT_BOW])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_BOW])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_BOW])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_BOW])," - временные бонусы"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("Арбалеты: ",IntToString(hero.HitChance[NPC_TALENT_CROSSBOW])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_CROSSBOW])," - учителя"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_CROSSBOW])," - постоянные бонусы"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_CROSSBOW])," - временные бонусы"));
		Doc_Show(nDocID);
	};
};

instance PickPocketSyncer(C_Item)
{
	name = "Руна обновления";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "Обновить предметы для кражи.";
	on_state[0] = UsePickPocketSyncer;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePickPocketSyncer()
{
	B_SyncItemsToSteal();
	PrintScreen("Предметы для кражи обновлены",-1,55,FONT_Screen,4);
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

