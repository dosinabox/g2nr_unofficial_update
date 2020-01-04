
func int C_WorldIsFixed(var int world)
{
	if(world == NEWWORLD_ZEN)
	{
		if(Mob_HasItems("KVI_SECRET_DEV_CHEST",ItPl_Mushroom_01))
		{
			return TRUE;
		};
	}
	else if(world == OLDWORLD_ZEN)
	{
		if(Mob_HasItems("D36_SECRET_WASTELAND_CHEST",ItPl_Mushroom_02))
		{
			return TRUE;
		};
	};
	return FALSE;
};

