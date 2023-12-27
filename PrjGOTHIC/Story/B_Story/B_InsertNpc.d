
func void B_InsertGregWolfs()
{
	if(GregWolfs == FALSE)
	{
		Wld_InsertNpc(YWolf,"NW_FARM1_PATH_CITY_05_B");
		Wld_InsertNpc(YWolf,"NW_FARM1_PATH_CITY_05_B");
		GregWolfs = TRUE;
	};
};

func void B_InsertMalethWolf()
{
	if(Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc(YWolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};

func void B_InsertLobartOrcs()
{
	Wld_InsertNpc(OrcWarrior_Lobart1,"NW_FARM1_PATH_CITY_SHEEP_04");
	Wld_InsertNpc(OrcWarrior_Lobart2,"NW_FARM1_PATH_CITY_SHEEP_04");
	Wld_InsertNpc(OrcWarrior_Lobart3,"NW_FARM1_PATH_CITY_SHEEP_04");
	Wld_InsertNpc(OrcWarrior_Lobart4,"NW_FARM1_PATH_CITY_SHEEP_01");
	Wld_InsertNpc(OrcWarrior_Lobart5,"NW_FARM1_PATH_CITY_SHEEP_01");
	Wld_InsertNpc(OrcWarrior_Lobart6,"NW_FARM1_PATH_CITY_SHEEP_01");
	B_StartOtherRoutine(Vino,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer2,"BUGSTHERE");
};

