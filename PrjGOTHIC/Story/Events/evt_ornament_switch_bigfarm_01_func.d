
func void evt_ornament_switch_bigfarm_01_func()
{
	if(ornament_switched_bigfarm == FALSE)
	{
		Wld_InsertNpc(Stoneguardian_Ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01");
		Wld_InsertItem(ItMi_OrnamentEffekt_BIGFARM_Addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_BIGFARM_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",ItMi_OrnamentEffekt_BIGFARM_Addon,ItMi_OrnamentEffekt_BIGFARM_Addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_OrnamentEffekt_BIGFARM_Addon,ItMi_OrnamentEffekt_BIGFARM_Addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Я активировал механизм круга камней, находящегося неподалеку от фермы Секоба. Раздался грохот, а потом появился каменный страж, который попытался меня убить.");
		ornament_switched_bigfarm = TRUE;
	};
};

func void evt_ornament_switch_farm_01_func()
{
	if(ornament_switched_farm == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Я активировал механизм круга камней, находящегося неподалеку от фермы Лобарта. Земля затряслась, но ничего не произошло.");
		ornament_switched_farm = TRUE;
	};
};

func void evt_ornament_switch_forest_01_func()
{
	if(ornament_switched_forest == FALSE)
	{
		Wld_InsertNpc(Stoneguardian_Ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
		Wld_InsertItem(ItMi_OrnamentEffekt_FOREST_Addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_FOREST_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",ItMi_OrnamentEffekt_FOREST_Addon,ItMi_OrnamentEffekt_FOREST_Addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_OrnamentEffekt_FOREST_Addon,ItMi_OrnamentEffekt_FOREST_Addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Я активировал механизм круга камней, находящегося в лесу на севере. Появился огромный каменный страж в очень дурном настроении.");
		ornament_switched_forest = TRUE;
	};
};

