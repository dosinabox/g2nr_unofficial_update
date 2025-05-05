
var int EVT_UndeadDragon_Trap_01_Func_Count;
var int EVT_UndeadDragon_Trap_01_Func_Count_NoMore;

func void EVT_UndeadDragon_Trap_01_Func()
{
	if((EVT_UndeadDragon_Trap_01_Func_Count_NoMore < 10) && (UndeadDragonIsDead == FALSE))
	{
		if((EVT_UndeadDragon_Trap_01_Func_Count < 2) && (EVT_UndeadDragon_Trap_01_Func_Count != 0))
		{
			Wld_InsertNpc(UndeadOrcWarrior,"DI_UNDEADDRAGON_TRAP_01");
		};
		EVT_UndeadDragon_Trap_01_Func_Count += 1;
		if(EVT_UndeadDragon_Trap_01_Func_Count > 2)
		{
			EVT_UndeadDragon_Trap_01_Func_Count = 1;
		};
		EVT_UndeadDragon_Trap_01_Func_Count_NoMore += 1;
	};
};


var int EVT_UndeadDragon_Trap_02_Func_Count;
var int EVT_UndeadDragon_Trap_02_Func_Count_NoMore;

func void EVT_UndeadDragon_Trap_02_Func()
{
	if((EVT_UndeadDragon_Trap_02_Func_Count_NoMore < 10) && (UndeadDragonIsDead == FALSE))
	{
		if((EVT_UndeadDragon_Trap_02_Func_Count < 2) && (EVT_UndeadDragon_Trap_02_Func_Count != 0))
		{
			Wld_InsertNpc(UndeadOrcWarrior,"DI_UNDEADDRAGON_TRAP_02");
		};
		EVT_UndeadDragon_Trap_02_Func_Count += 1;
		if(EVT_UndeadDragon_Trap_02_Func_Count > 2)
		{
			EVT_UndeadDragon_Trap_02_Func_Count = 1;
		};
		EVT_UndeadDragon_Trap_02_Func_Count_NoMore += 1;
	};
};


var int EVT_UndeadDragon_Trap_03_Func_Count;
var int EVT_UndeadDragon_Trap_03_Func_Count_NoMore;

func void EVT_UndeadDragon_Trap_03_Func()
{
	if((EVT_UndeadDragon_Trap_03_Func_Count_NoMore < 10) && (UndeadDragonIsDead == FALSE))
	{
		if((EVT_UndeadDragon_Trap_03_Func_Count < 2) && (EVT_UndeadDragon_Trap_03_Func_Count != 0))
		{
			Wld_InsertNpc(UndeadOrcWarrior,"DI_UNDEADDRAGON_TRAP_03");
		};
		EVT_UndeadDragon_Trap_03_Func_Count += 1;
		if(EVT_UndeadDragon_Trap_03_Func_Count > 2)
		{
			EVT_UndeadDragon_Trap_03_Func_Count = 1;
		};
		EVT_UndeadDragon_Trap_03_Func_Count_NoMore += 1;
	};
};


var int EVT_UndeadDragonDead_EndSituation_OneTime;

func void EVT_UndeadDragonDead_EndSituation()
{
	if(EVT_UndeadDragonDead_EndSituation_OneTime == FALSE)
	{
		if(UndeadDragonIsDead == TRUE)
		{
			Angar_DI_Party = LOG_SUCCESS;
			B_StartOtherRoutine(Angar_DI,"FIREDRAGONISLAND");
			B_StartOtherRoutine(Lee_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Diego_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Milten_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Gorn_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Lester_DI,"UNDEADDRAGONDEAD");
			EVT_UndeadDragonDead_EndSituation_OneTime = TRUE;
		};
	};
	EnteredFinalDIHall = TRUE;
};

