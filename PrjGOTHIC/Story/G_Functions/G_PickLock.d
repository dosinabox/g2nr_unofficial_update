
func void G_PickLock(var int bSuccess,var int bBrokenOpen)
{
	var int rnd;
	if(bSuccess)
	{
		if(bBrokenOpen)
		{
			Snd_Play3d(self,"PICKLOCK_UNLOCK");
			Print(PRINT_PICKLOCK_UNLOCK);
		}
		else
		{
			Snd_Play3d(self,"PICKLOCK_SUCCESS");
			Print(PRINT_PICKLOCK_SUCCESS);
		};
	}
	else if(bBrokenOpen)
	{
		Snd_Play3d(self,"PICKLOCK_BROKEN");
		Print(PRINT_PICKLOCK_BROKEN);
		rnd = Hlp_Random(100);
		if(rnd <= 25)
		{
			Npc_SendPassivePerc(hero,PERC_ASSESSQUIETSOUND,hero,hero);
		};
	}
	else
	{
		Snd_Play3d(self,"PICKLOCK_FAILURE");
		Print(PRINT_PICKLOCK_FAILURE);
	};
};

