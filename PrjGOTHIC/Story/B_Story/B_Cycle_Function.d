
func void B_Cycle_Function()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(MIS_PickedUpUndeadSword == FALSE)
		{
			if(Npc_HasItems(hero,ItMw_Drachenschneide))
			{
				if(C_WorldIsFixed())
				{
					if(Npc_GetDistToWP(hero,"NW_TROLLAREA_TROLLROCKCAVE_06") <= 1000)
					{
						Wld_SendTrigger("EVT_TROLL_GRAVE_TRIGGERLIST_01");
					};
				};
				MIS_PickedUpUndeadSword = TRUE;
			};
		};
		if(MIS_PickedUpInnosEye == FALSE)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				if(Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis))
				{
					if(Pedro_Traitor == TRUE)
					{
						B_LogEntries(TOPIC_INNOSEYE,"Эти жуткие ребята действуют мне на нервы. Они испортили Глаз Инноса. И теперь я не знаю, как мне починить его.");
						B_LogNextEntry(TOPIC_TraitorPedro,"Я нашел Глаз Инноса. Но что-то нигде не видно Педро. Эти черные маги в сговоре с ним.");
					}
					else
					{
						B_LogEntry(TOPIC_INNOSEYE,"Эти жуткие ребята действуют мне на нервы. Они испортили Глаз Инноса. И теперь я не знаю, как мне починить его.");
					};
					B_GivePlayerXP(XP_SCKnowsInnosEyeIsBroken);
					MIS_SCKnowsInnosEyeIsBroken = TRUE;
					MIS_PickedUpInnosEye = TRUE;
				};
			};
		};
		if((MIS_PickedUpUndeadSword == FALSE) || (MIS_PickedUpInnosEye == FALSE))
		{
			Wld_SendTrigger("CYCLE_TRIGGER");
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(BloodwynIsHeadless == FALSE)
		{
			if(Npc_HasItems(hero,ItMi_Addon_Bloodwyn_Kopf))
			{
				Snd_Play("CS_IAM_ME_FL_A3");
				Mdl_SetVisualBody(Bloodwyn,"hum_body_Bloodwyn_Headless",1,0,"Hum_Headless",0,DEFAULT,NO_ARMOR);
				AI_UnequipArmor(Bloodwyn);
				BloodwynIsHeadless = TRUE;
			}
			else
			{
				Wld_SendTrigger("CYCLE_TRIGGER");
			};
		};
	};
};

