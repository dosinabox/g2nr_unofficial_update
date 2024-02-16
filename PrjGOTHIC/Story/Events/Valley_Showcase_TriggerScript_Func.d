
var int Valley_Showcase_Triggerscript_Func_OneTime;
var int Valley_Showcase_OtherSide_Entered;
var int CutDownTreeAttempts;

func void Valley_Showcase_Triggerscript_Func_S1()
{
	if((Valley_Showcase_Triggerscript_Func_OneTime == FALSE) && (CutDownTreeAttempts >= 2))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_SendTrigger("VALLEY_SHOWCASE_MOVER_01");
		Valley_Showcase_Triggerscript_Func_OneTime = TRUE;
	};
};

func void Valley_Showcase_OtherSide_Trigger_Func()
{
	if(Valley_Showcase_OtherSide_Entered == FALSE)
	{
		if(Valley_Showcase_Triggerscript_Func_OneTime == FALSE)
		{
			PrintScreen(PRINT_Addon_StuntBonus,-1,45,FONT_Screen,2);
			B_GivePlayerXP(XP_Addon_WackelBaum);
			Snd_Play("THRILLJINGLE_01");
			Wld_InsertItem(ItSc_Teleport_Maya,"FP_ITEM_VALLEY_02");
		};
		Valley_Showcase_OtherSide_Entered = TRUE;
	};
};

func int C_CanCutDownTree()
{
	if(Valley_Showcase_Triggerscript_Func_OneTime == FALSE)
	{
		CutDownTreeAttempts += 1;
		if(CutDownTreeAttempts == 1)
		{
			Snd_Play("OW_SHIPWREKORBRIDGE_A1");
		}
		else if(CutDownTreeAttempts == 2)
		{
			Snd_Play("OW_SHIPWREKORBRIDGE_A2");
		}
		else
		{
			Snd_Play("OW_SHIPWREKORBRIDGE_A3");
		};
		return TRUE;
	};
	return FALSE;
};

