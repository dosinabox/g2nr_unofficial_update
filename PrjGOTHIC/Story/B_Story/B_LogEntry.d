
func void B_LogEntry(var string topic,var string entry)
{
	Log_AddEntry(topic,entry);
	PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_ScreenSmall,2);
	Snd_Play("LogEntry");
};

func void B_CheckDynamicText()
{
	if(Hammer_Once == FALSE)
	{
		TEXT_LousHammer_Setting = PRINT_UnknownEffect;
	}
	else
	{
		TEXT_LousHammer_Setting = PRINT_LousHammerNoEffect;
	};
	if(Zeitspalt_Used == FALSE)
	{
		TEXT_Zeitspalt_Setting = PRINT_UnknownEffect;
	}
	else
	{
		TEXT_Zeitspalt_Setting = PRINT_SlowTime;
	};
	if(MegaDrink_Used == FALSE)
	{
		TEXT_MegaDrink_Setting_Desc = " ";
		TEXT_MegaDrink_Setting = PRINT_UnknownEffect;
		COUNT_MegaDrink_Setting = 0;
	}
	else
	{
		TEXT_MegaDrink_Setting_Desc = TEXT_MegaDrink_Setting_Desc_Print;
		TEXT_MegaDrink_Setting = TEXT_MegaDrink_Setting_Print;
		COUNT_MegaDrink_Setting = STRorDEX_MegaDrink;
	};
	if(MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS)
	{
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
	}
	else
	{
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Broken;
	};
};

