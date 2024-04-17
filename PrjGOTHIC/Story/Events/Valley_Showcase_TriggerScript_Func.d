
var int Valley_Showcase_TreeUsed;
var int Valley_Showcase_OtherSide_Entered;

func void Valley_Showcase_Triggerscript_Func()
{
	Valley_Showcase_TreeUsed = TRUE;
};

func void Valley_Showcase_OtherSide_Trigger_Func()
{
	if(Valley_Showcase_OtherSide_Entered == FALSE)
	{
		if(Valley_Showcase_TreeUsed == FALSE)
		{
			PrintScreen(PRINT_Addon_StuntBonus,-1,45,FONT_Screen,2);
			B_GivePlayerXP(XP_Addon_WackelBaum);
			Snd_Play("THRILLJINGLE_01");
			Wld_InsertItem(ItSc_Teleport_Maya,"FP_ITEM_VALLEY_02");
		};
		Valley_Showcase_OtherSide_Entered = TRUE;
	};
};

func int Valley_Showcase_Condition()
{
	if(Valley_Showcase_TreeUsed == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

