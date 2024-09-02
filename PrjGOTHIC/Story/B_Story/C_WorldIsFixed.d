
var int NewWorldIsFixed;
var int OldWorldIsFixed;
var int AddonWorldIsFixed;

func int C_WorldIsFixed()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(NewWorldIsFixed == TRUE)
		{
			return TRUE;
		};
		if(Mob_HasItems("KVI_SECRET_DEV_CHEST",ItPl_Mushroom_01))
		{
			NewWorldIsFixed = TRUE;
			return TRUE;
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(OldWorldIsFixed == TRUE)
		{
			return TRUE;
		};
		if(Mob_HasItems("D36_SECRET_DEV_CHEST",ItPl_Mushroom_02))
		{
			OldWorldIsFixed = TRUE;
			return TRUE;
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(AddonWorldIsFixed == TRUE)
		{
			return TRUE;
		};
		if(Mob_HasItems("D36_SECRET_DEV_CHEST",ItPl_SwampHerb))
		{
			AddonWorldIsFixed = TRUE;
			return TRUE;
		};
	};
	return FALSE;
};

