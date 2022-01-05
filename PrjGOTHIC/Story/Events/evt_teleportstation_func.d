
func void evt_teleportstation_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	SCUsed_TELEPORTER = TRUE;
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_TAVERNE");
			if(SCUsed_NW_TELEPORTSTATION_CITY == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"“елепорт в пещере к востоку от города ведет к таверне 'ћертва€ гарпи€'.");
				SCUsed_NW_TELEPORTSTATION_CITY = TRUE;
			};
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_TAVERNE") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_MAYA");
			if(SCUsed_NW_TELEPORTSTATION_TAVERNE == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"“елепорт у таверны 'ћертва€ гарпи€' ведет к порталу таинственных зодчих.");
				SCUsed_NW_TELEPORTSTATION_TAVERNE = TRUE;
			};
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_MAYA") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_CITY");
			if(SCUsed_NW_TELEPORTSTATION_MAYA == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"“елепорт у портала таинственных зодчих ведет к пещере к востоку от города.");
				SCUsed_NW_TELEPORTSTATION_MAYA = TRUE;
			};
		}
		else
		{
			AI_Teleport(hero,"MARKT");
		};
		if((SCUsed_NW_TELEPORTSTATION_MAYA == TRUE) && (SCUsed_NW_TELEPORTSTATION_TAVERNE == TRUE) && (SCUsed_NW_TELEPORTSTATION_CITY == TRUE) && (SCUsed_AllNWTeleporststones == FALSE))
		{
			SCUsed_AllNWTeleporststones = TRUE;
			B_GivePlayerXP(XP_Addon_AllNWTeleporststones);
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(C_NpcIsNearWP(hero,"ADW_ENTRANCE_TELEPORT_NORTH_WP"))
		{
			AI_Teleport(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"я активировал телепорт, который находитс€ р€дом с порталом, ведущим в ’оринис.");
				B_GivePlayerXP(XP_Ambient);
				SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL = TRUE;
			};
		}
		else if(C_NpcIsNearWP(hero,"ADW_ENTRANCE_TELEPORT_EAST_WP"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"ћне удалось активировать телепорт, наход€щийс€ в верхней части лагер€ бандитов.");
				B_GivePlayerXP(XP_Ambient);
				SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL = TRUE;
			};
		}
		else if(C_NpcIsNearWP(hero,"ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHEAST_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_SOUTHEAST == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"я активировал телепорт, который находитс€ на болоте, к югу от лагер€ бандитов.");
				B_GivePlayerXP(XP_Ambient);
				SCUsed_ADW_TELEPORTSTATION_SOUTHEAST = TRUE;
			};
		}
		else if(C_NpcIsNearWP(hero,"ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHWEST_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_SOUTHWEST == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"я нашел телепорт на юго-западе.");
				B_GivePlayerXP(XP_Ambient);
				SCUsed_ADW_TELEPORTSTATION_SOUTHWEST = TRUE;
			};
		}
		else if(C_NpcIsNearWP(hero,"ADW_ENTRANCE_TELEPORT_WEST_WP"))
		{
			AI_Teleport(hero,"ADW_PIRATES_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_PIRATES == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"¬ небольшой пещере в каньоне есть телепорт. я активировал его.");
				SCUsed_ADW_TELEPORTSTATION_PIRATES = TRUE;
				B_GivePlayerXP(XP_Ambient);
			};
			if((MIS_KrokoJagd == LOG_SUCCESS) && (SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER == FALSE))
			{
				Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER = TRUE;
			};
		}
		else if(C_NpcIsNearWP(hero,"ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			/*if(SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT == FALSE)
			{
				SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT = TRUE;
			};*/
		}
		else
		{
			AI_Teleport(hero,"ADW_ENTRANCE");
		};
	};
};


var int TriggeredTeleporterADW;
var int ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime;

func void adw_portaltempel_focus_func()
{
	Npc_RemoveInvItems(hero,ItMi_Focus,1);
	TriggeredTeleporterADW += 1;
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	if(TriggeredTeleporterADW >= 5)
	{
		SC_ADW_ActivatedAllTelePortStones = TRUE;
	};
	if((ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime == FALSE) && (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000))
	{
//		if(!Npc_IsDead(Stoneguardian_NailedPortalADW1) && (Stoneguardian_NailedPortalADW1.aivar[AIV_EnemyOverride] == TRUE))
		if(!Npc_IsDead(Stoneguardian_NailedPortalADW1) || !Npc_IsDead(Stoneguardian_NailedPortalADW2))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		b_awake_stoneguardian(Stoneguardian_NailedPortalADW1);
		b_awake_stoneguardian(Stoneguardian_NailedPortalADW2);
		ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime = TRUE;
	};
};

