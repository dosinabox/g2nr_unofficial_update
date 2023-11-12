
var int OpenedGolemChest;

func void B_GolemChest_S1()
{
	if(OpenedGolemChest == FALSE)
	{
		if(Hlp_IsValidNpc(StoneGolem_Dead1))
		{
			Wld_RemoveNpc(StoneGolem_Dead1);
			Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_01");
		};
		if(Hlp_IsValidNpc(StoneGolem_Dead2))
		{
			Wld_RemoveNpc(StoneGolem_Dead2);
			Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_02");
		};
		if(Hlp_IsValidNpc(StoneGolem_Dead3))
		{
			Wld_RemoveNpc(StoneGolem_Dead3);
			Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_03");
		};
		if(Hlp_IsValidNpc(StoneGolem_Dead4))
		{
			Wld_RemoveNpc(StoneGolem_Dead4);
			Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_04");
		};
		OpenedGolemChest = TRUE;
	};
};

func void B_GolemsCave_Exit()
{
	
};

