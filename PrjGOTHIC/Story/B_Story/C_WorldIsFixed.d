
func int C_WorldIsFixed()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Mob_HasItems("KVI_SECRET_DEV_CHEST",ItPl_Mushroom_01))
		{
			return TRUE;
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(Mob_HasItems("D36_SECRET_DEV_CHEST",ItPl_Mushroom_02))
		{
			return TRUE;
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Mob_HasItems("D36_SECRET_DEV_CHEST",ItPl_SwampHerb))
		{
			return TRUE;
		};
	};
	return FALSE;
};

