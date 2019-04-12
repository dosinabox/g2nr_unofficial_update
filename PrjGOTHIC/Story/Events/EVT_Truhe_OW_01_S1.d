
func void EVT_Truhe_OW_01_S1()
{
	if(TruheSfx == FALSE)
	{
		Snd_Play("ORC_ANGRY");
		TruheSfx = TRUE;
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_MOLERAT_03_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_MOLERAT_03_03");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_MOLERAT_03_04");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_MOLERAT_03_05");
		Wld_InsertNpc(OrcWarrior_Rest,"SPAWN_OW_MOLERAT_03_04");
	};
};

