
var int OpenedGolemChest;

func void B_GolemChest_S1()
{
	if(OpenedGolemChest == FALSE)
	{
		Wld_RemoveNpc(StoneGolem_Dead1);
		Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_01");
		Wld_RemoveNpc(StoneGolem_Dead2);
		Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_02");
		Wld_RemoveNpc(StoneGolem_Dead3);
		Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_03");
		Wld_RemoveNpc(StoneGolem_Dead4);
		Wld_InsertNpc(Shattered_Golem,"FP_SHATTERED_GOLEM_04");
		OpenedGolemChest = TRUE;
	};
};

