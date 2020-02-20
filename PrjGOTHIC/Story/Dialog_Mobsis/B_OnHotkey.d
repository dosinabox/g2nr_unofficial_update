
func int B_GetBestPlayerMap()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_NewWorld))
		{
			return ItWr_Map_NewWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS))
		{
			return ItWr_Map_Shrine_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS))
		{
			return ItWr_Map_Caves_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Ornaments_Addon))
		{
			return ItWr_Map_NewWorld_Ornaments_Addon;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Dexter))
		{
			return ItWr_Map_NewWorld_Dexter;
		}
		else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS))
		{
			return ItWr_ShatteredGolem_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS))
		{
			return ItWr_Map_Orcelite_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City))
		{
			return ItWr_Map_NewWorld_City;
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_OldWorld))
		{
			return ItWr_Map_OldWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS))
		{
			return ItWr_Map_OldWorld_Oremines_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_Small_MIS))
		{
			return ItWr_Map_OldWorld_Oremines_Small_MIS;
		};
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_AddonWorld))
		{
			return ItWr_Map_AddonWorld;
		}
		else if(Npc_HasItems(hero,ItWR_Addon_TreasureMap))
		{
			return ItWR_Addon_TreasureMap;
		};
	};
	return FALSE;
};

func int B_GetAnyPlayerMap()
{
	if(Npc_HasItems(hero,ItWr_Map_NewWorld))
	{
		return ItWr_Map_NewWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS))
	{
		return ItWr_Map_Shrine_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS))
	{
		return ItWr_Map_Caves_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		return ItWr_Map_NewWorld_Ornaments_Addon;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Dexter))
	{
		return ItWr_Map_NewWorld_Dexter;
	}
	else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS))
	{
		return ItWr_ShatteredGolem_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS))
	{
		return ItWr_Map_Orcelite_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City))
	{
		return ItWr_Map_NewWorld_City;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld))
	{
		return ItWr_Map_OldWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS))
	{
		return ItWr_Map_OldWorld_Oremines_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_Small_MIS))
	{
		return ItWr_Map_OldWorld_Oremines_Small_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_AddonWorld))
	{
		return ItWr_Map_AddonWorld;
	}
	else if(Npc_HasItems(hero,ItWR_Addon_TreasureMap))
	{
		return ItWR_Addon_TreasureMap;
	};
	return FALSE;
};

func int player_hotkey_screen_map()
{
	var int OldInstance;
	var int NewInstance;
	OldInstance = B_GetPlayerMap();
	if((OldInstance > 0) && !Npc_HasItems(hero,OldInstance))
	{
		OldInstance = 0;
	};
	B_SetPlayerMap(OldInstance);
	NewInstance = OldInstance;
	if(CurrentLevel != NEWWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_Caves_MIS) || (OldInstance == ItWr_Map_NewWorld) || (OldInstance == ItWr_Map_NewWorld_City) || (OldInstance == ItWr_Map_NewWorld_Dexter) || (OldInstance == ItWr_Map_NewWorld_Ornaments_Addon) || (OldInstance == ItWr_Map_Orcelite_MIS) || (OldInstance == ItWr_Map_Shrine_MIS) || (OldInstance == ItWr_ShatteredGolem_MIS))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != OLDWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_OldWorld) || (OldInstance == ItWr_Map_OldWorld_Oremines_MIS) || (OldInstance == ItWr_Map_OldWorld_Oremines_Small_MIS))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != DRAGONISLAND_ZEN)
	{
	};
	if(CurrentLevel != ADDONWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_AddonWorld) || (OldInstance == ItWR_Addon_TreasureMap))
		{
			NewInstance = 0;
		};
	};
	if(NewInstance <= 0)
	{
		NewInstance = B_GetBestPlayerMap();
	};
	if((NewInstance <= 0) && (OldInstance <= 0))
	{
		NewInstance = B_GetAnyPlayerMap();
	};
	if(NewInstance > 0)
	{
		B_SetPlayerMap(NewInstance);
		return NewInstance;
	};
	return OldInstance;
};

func void B_LameSchlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if(!Npc_IsInState(hero,ZS_Dead))
	{
		if(Npc_HasItems(hero,ItPo_Mana_Addon_04) && ((hero.attribute[ATR_MANA]) <= (hero.attribute[ATR_MANA_MAX] / 4)))
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			Npc_RemoveInvItem(hero,ItPo_Mana_Addon_04);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Full),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(Npc_HasItems(hero,ItPo_Mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Mana_03);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Elixier),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(Npc_HasItems(hero,ItPo_Mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Mana_02);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Extrakt),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(Npc_HasItems(hero,ItPo_Mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Mana_01);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Essenz),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,ItPo_Mana_01))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Mana_01);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Essenz),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else if(Npc_HasItems(hero,ItPo_Mana_02))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Mana_02);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Extrakt),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else if(Npc_HasItems(hero,ItPo_Mana_03))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Mana_03);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Elixier),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else if(Npc_HasItems(hero,ItPo_Mana_Addon_04))
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
				Npc_RemoveInvItem(hero,ItPo_Mana_Addon_04);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_Mana_Full),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else
			{
				Print("Нет зелий маны!");
			};
		}
		else
		{
			Print("Мана уже максимальная!");
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(!Npc_IsInState(hero,ZS_Dead))
	{
		if(Npc_HasItems(hero,ItPo_Health_Addon_04) && ((hero.attribute[ATR_HITPOINTS]) <= (hero.attribute[ATR_HITPOINTS_MAX] / 4)))
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			Npc_RemoveInvItem(hero,ItPo_Health_Addon_04);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Full),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(Npc_HasItems(hero,ItPo_Health_03) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Health_03);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Elixier),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(Npc_HasItems(hero,ItPo_Health_02) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Health_02);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Extrakt),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(Npc_HasItems(hero,ItPo_Health_01) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Health_01);
			B_LameSchlork();
			PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Essenz),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] != hero.attribute[ATR_HITPOINTS])
		{
			if(Npc_HasItems(hero,ItPo_Health_01))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Health_01);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Essenz),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else if(Npc_HasItems(hero,ItPo_Health_02))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Health_02);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Extrakt),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else if(Npc_HasItems(hero,ItPo_Health_03))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Health_03);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Elixier),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else if(Npc_HasItems(hero,ItPo_Health_Addon_04))
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
				Npc_RemoveInvItem(hero,ItPo_Health_Addon_04);
				B_LameSchlork();
				PrintScreen(ConcatStrings(PRINT_Used,NAME_HP_Full),-1,YPOS_LOGENTRY,FONT_ScreenSmall,1);
			}
			else
			{
				Print("Нет лечебных зелий!");
			};
		}
		else
		{
			Print("Здоровье уже максимальное!");
		};
	};
};

