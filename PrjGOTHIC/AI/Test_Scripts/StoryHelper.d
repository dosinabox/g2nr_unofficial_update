
instance ItPo_Story(C_Item)
{
	name = "Счастье";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Story;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[0] = "Показ Raven Video I";
};


func void UseItPo_Story()
{
	b_ravensescapeintotempelavi();
};


instance SH(Npc_Default)
{
	name[0] = "Помощник по сюжету";
	guild = GIL_NONE;
	id = 9999;
	voice = 15;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_9999;
};


func void Rtn_Start_9999()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,8,0,"XXX");
};


instance StoryHelper_Exit(C_Info)
{
	npc = sh;
	nr = 999;
	condition = StoryHelper_Exit_Condition;
	information = StoryHelper_Exit_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int StoryHelper_Exit_Condition()
{
	return TRUE;
};

func void StoryHelper_Exit_Info()
{
	AI_StopProcessInfos(self);
};

func void b_build_settings_diag()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_PatchSettings_BACK);
	if(Helmets_Enabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Отделить шлемы от доспехов",StoryHelper_Helmets);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Соединить шлемы и доспехи",StoryHelper_Helmets);
	};
	/*не сделано
	if(HonestStatCalculation == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить честный расчет стоимости обучения",StoryHelper_HonestStatCalculation);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить честный расчет стоимости обучения",StoryHelper_HonestStatCalculation);
	};*/
	if(EnterNW_Kapitel4 == FALSE)
	{
		if(OriginalAntipaladins == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"Выключить усиленных предводителей орков",StoryHelper_Antipaladins);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"Включить усиленных предводителей орков",StoryHelper_Antipaladins);
		};
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
		Info_AddChoice(StoryHelper_PatchSettings,"Включить режим трусости у ИИ",StoryHelper_Flee);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить режим трусости у ИИ",StoryHelper_Flee);
	};
	if(IgnoreBonuses == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить игнорирование бонусов при прокачке",StoryHelper_Bonuses);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить игнорирование бонусов при прокачке",StoryHelper_Bonuses);
	};
	If(RandomGoblinBerries == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить рандомные гоблинские ягоды у паладинов",StoryHelper_GoblinBerries);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить рандомные гоблинские ягоды у паладинов",StoryHelper_GoblinBerries);
	};
	If(InfiniteApples == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить бесконечные яблоки",StoryHelper_Apples);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить бесконечные яблоки",StoryHelper_Apples);
	};
	If(XP_Static == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Включить фиксированный опыт по главам",StoryHelper_XP);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"Выключить фиксированный опыт по главам",StoryHelper_XP);
	};
};
	
instance StoryHelper_PatchSettings(C_Info)
{
	npc = sh;
//	npc = NONE_100_Xardas;
	nr = 995;
	condition = StoryHelper_PatchSettings_Condition;
	information = StoryHelper_PatchSettings_Info;
	important = FALSE;
	permanent = TRUE;
	description = "(настройки неофициального обновления)";
};


func int StoryHelper_PatchSettings_Condition()
{
	return TRUE;
};

func void StoryHelper_PatchSettings_Info()
{
	b_build_settings_diag();
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
		PrintScreen("Оригинал: бонусы нужно копить",-1,-1,FONT_Screen,3);
	}
	else
	{
		IgnoreBonuses = TRUE;
		PrintScreen("Теперь бонусы можно не копить",-1,-1,FONT_Screen,3);
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
		PrintScreen("Бесконечные яблоки исправлены",-1,-1,FONT_Screen,3);
	}
	else
	{
		InfiniteApples = TRUE;
		PrintScreen("Яблоки бесконечны",-1,-1,FONT_Screen,3);
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
			CreateInvItems(hero,ITAR_PAL_M,1);
		};
		if(Npc_HasItems(hero,ITAR_PALN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_H);
			CreateInvItems(hero,ITAR_PAL_H,1);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_M);
			CreateInvItems(hero,ITAR_DJG_M,1);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_H);
			CreateInvItems(hero,ITAR_DJG_H,1);
		};
		Helmets_Enabled = FALSE;
	}
	else
	{
		PrintScreen("Шлемы и доспехи разделены",-1,-1,FONT_Screen,3);
		if(Npc_HasItems(hero,ITAR_PAL_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_M);
			CreateInvItems(hero,ITAR_PALN_M,1);
			CreateInvItems(hero,ITHE_PAL_M,1);
		};
		if(Npc_HasItems(hero,ITAR_PAL_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_H);
			CreateInvItems(hero,ITAR_PALN_H,1);
			CreateInvItems(hero,ITHE_PAL_H,1);
		};
		if(Npc_HasItems(hero,ITAR_DJG_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_M);
			CreateInvItems(hero,ITAR_DJGN_M,1);
			CreateInvItems(hero,ITHE_DJG_M,1);
		};
		if(Npc_HasItems(hero,ITAR_DJG_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_H);
			CreateInvItems(hero,ITAR_DJGN_H,1);
			CreateInvItems(hero,ITHE_DJG_H,1);
		};
		Helmets_Enabled = TRUE;
	};
	b_build_settings_diag();
};

func void StoryHelper_LehmarBook()
{
	if(ClassicLehmarBook == TRUE)
	{
		ClassicLehmarBook = FALSE;
		PrintScreen("Выкуп гроссбуха отключен",-1,-1,FONT_Screen,3);
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
		PrintScreen("Прохождение без гильдии отключено",-1,-1,FONT_Screen,3);
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
		PrintScreen("Прохождение без аддона отключено",-1,-1,FONT_Screen,3);
	}
	else
	{
		AddonDisabled = TRUE;
		PrintScreen("Прохождение без аддона включено",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Antipaladins()
{
	if(OriginalAntipaladins == TRUE)
	{
		OriginalAntipaladins = FALSE;
		OrkElite_AntiPaladin_Level = 50;
		OrkElite_AntiPaladin_Strength = 140;
		OrkElite_AntiPaladin_HP = 550;
		OrkElite_AntiPaladin_Protection = 170;
		PrintScreen("Усиленные предводители орков включены",-1,-1,FONT_Screen,3);
	}
	else
	{
		OriginalAntipaladins = TRUE;
		OrkElite_AntiPaladin_Level = 45;
		OrkElite_AntiPaladin_Strength = 125;
		OrkElite_AntiPaladin_HP = 450;
		OrkElite_AntiPaladin_Protection = 160;
		PrintScreen("Усиленные предводители орков выключены",-1,-1,FONT_Screen,3);
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

/*func void StoryHelper_HonestStatCalculation()
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
};*/

func void StoryHelper_PatchSettings_BACK()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
};

/////////////////////////

instance StoryHelper_INFO1(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO1_Condition;
	information = StoryHelper_INFO1_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_1;
};


func int StoryHelper_INFO1_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO1_Info()
{
	Info_ClearChoices(StoryHelper_INFO1);
	Info_AddChoice(StoryHelper_INFO1,Dialog_Back,StoryHelper_BACK1);
	Info_AddChoice(StoryHelper_INFO1,KapAnfang,StoryHelper_KAPITEL1ANFANG);
	Info_AddChoice(StoryHelper_INFO1,"АДДОН Готов к первой встрече с Сатурасом (забыть о Ларесе)",StoryHelper_SATURAS);
	Info_AddChoice(StoryHelper_INFO1,"АДДОН Баг с Кавалорном",StoryHelper_Cavalorn);
};

func void StoryHelper_SATURAS()
{
	MIS_Addon_Lares_Ornament2Saturas = LOG_Running;
	CreateInvItems(other,ItMi_Ornament_Addon,1);
	SC_KnowsRanger = TRUE;
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};

func void StoryHelper_Cavalorn()
{
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	//Получено письмо для Ватраса
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
	//Найден торговец, продававший оружие бандитам
	MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
	//Где же пропавшие люди?
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	//Кольцо колец :)
	CreateInvItems(hero,ItRi_Ranger_Addon,1);	
	//Найти каменные круги
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;
	//...и Кавалорн отправился в один из них
	B_StartotherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	//Игрок получил карту кругов
	CreateInvItems(hero,ItWr_Map_NewWorld_Ornaments_Addon,1);	
	AI_StopProcessInfos(self);
};

func void StoryHelper_BACK1()
{
	Info_ClearChoices(StoryHelper_INFO1);
};

func void StoryHelper_KAPITEL1ANFANG()
{
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO2(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO2_Condition;
	information = StoryHelper_INFO2_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_2;
};


func int StoryHelper_INFO2_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO2_Info()
{
	Info_ClearChoices(StoryHelper_INFO2);
	Info_AddChoice(StoryHelper_INFO2,Dialog_Back,StoryHelper_BACK2);
	Info_AddChoice(StoryHelper_INFO2,KapAnfang,StoryHelper_KAPITEL2ANFANG);
};

func void StoryHelper_BACK2()
{
	Info_ClearChoices(StoryHelper_INFO2);
};

func void StoryHelper_KAPITEL2ANFANG()
{
	Torwache_305.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_StartOtherRoutine(Lothar,"START");
	CreateInvItems(hero,ItKe_Pass_MIS,1);
	MIS_OLDWORLD = LOG_Running;
	B_Kapitelwechsel(2,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO2);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO3(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO3_Condition;
	information = StoryHelper_INFO3_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_3;
};


func int StoryHelper_INFO3_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO3_Info()
{
	Info_ClearChoices(StoryHelper_INFO3);
	Info_AddChoice(StoryHelper_INFO3,Dialog_Back,StoryHelper_BACK3);
	Info_AddChoice(StoryHelper_INFO3,KapAnfang,StoryHelper_KAPITEL3ANFANG);
};

func void StoryHelper_BACK3()
{
	Info_ClearChoices(StoryHelper_INFO3);
};

func void StoryHelper_KAPITEL3ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO3);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO4(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO4_Condition;
	information = StoryHelper_INFO4_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_4;
};


func int StoryHelper_INFO4_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO4_Info()
{
	Info_ClearChoices(StoryHelper_INFO4);
	Info_AddChoice(StoryHelper_INFO4,Dialog_Back,StoryHelper_BACK4);
	Info_AddChoice(StoryHelper_INFO4,KapAnfang,StoryHelper_KAPITEL4ANFANG);
};

func void StoryHelper_BACK4()
{
	Info_ClearChoices(StoryHelper_INFO4);
};

func void StoryHelper_KAPITEL4ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO4);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO5(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO5_Condition;
	information = StoryHelper_INFO5_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_5;
};


func int StoryHelper_INFO5_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO5_Info()
{
	Info_ClearChoices(StoryHelper_INFO5);
	Info_AddChoice(StoryHelper_INFO5,Dialog_Back,StoryHelper_BACK5);
	Info_AddChoice(StoryHelper_INFO5,KapAnfang,StoryHelper_KAPITEL5ANFANG);
};

func void StoryHelper_BACK5()
{
	Info_ClearChoices(StoryHelper_INFO5);
};

func void StoryHelper_KAPITEL5ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	CreateInvItems(hero,ItAt_IcedragonHeart,1);	//чтобы оно было у вас на Ирдорате!
	MIS_AllDragonsDead = TRUE;
	B_Kapitelwechsel(5,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO5);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO6(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO6_Condition;
	information = StoryHelper_INFO6_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_6;
};


func int StoryHelper_INFO6_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO6_Info()
{
	Info_ClearChoices(StoryHelper_INFO6);
	Info_AddChoice(StoryHelper_INFO6,Dialog_Back,StoryHelper_BACK6);
	Info_AddChoice(StoryHelper_INFO6,KapAnfang,StoryHelper_KAPITEL6ANFANG);
};

func void StoryHelper_BACK6()
{
	Info_ClearChoices(StoryHelper_INFO6);
};

func void StoryHelper_KAPITEL6ANFANG()
{
	B_Kapitelwechsel(6,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO6);
	AI_StopProcessInfos(self);
};

