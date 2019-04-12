
var int evt_undeaddragon_trap_01_func_count;
var int EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore;

func void evt_undeaddragon_trap_01_func()
{
	if(EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore < 10)
	{
		if((evt_undeaddragon_trap_01_func_count < 2) && (evt_undeaddragon_trap_01_func_count != 0))
		{
			Wld_InsertNpc(UndeadOrcWarrior,"DI_UNDEADDRAGON_TRAP_01");
		};
		evt_undeaddragon_trap_01_func_count = evt_undeaddragon_trap_01_func_count + 1;
		if(evt_undeaddragon_trap_01_func_count > 2)
		{
			evt_undeaddragon_trap_01_func_count = 1;
		};
		EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore = EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore + 1;
	};
};


var int evt_undeaddragon_trap_02_func_count;
var int EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore;

func void evt_undeaddragon_trap_02_func()
{
	if(EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore < 10)
	{
		if((evt_undeaddragon_trap_02_func_count < 2) && (evt_undeaddragon_trap_02_func_count != 0))
		{
			Wld_InsertNpc(UndeadOrcWarrior,"DI_UNDEADDRAGON_TRAP_02");
		};
		evt_undeaddragon_trap_02_func_count = evt_undeaddragon_trap_02_func_count + 1;
		if(evt_undeaddragon_trap_02_func_count > 2)
		{
			evt_undeaddragon_trap_02_func_count = 1;
		};
		EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore = EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore + 1;
	};
};


var int evt_undeaddragon_trap_03_func_count;
var int EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore;

func void evt_undeaddragon_trap_03_func()
{
	if(EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore < 10)
	{
		if((evt_undeaddragon_trap_03_func_count < 2) && (evt_undeaddragon_trap_03_func_count != 0))
		{
			Wld_InsertNpc(UndeadOrcWarrior,"DI_UNDEADDRAGON_TRAP_03");
		};
		evt_undeaddragon_trap_03_func_count = evt_undeaddragon_trap_03_func_count + 1;
		if(evt_undeaddragon_trap_03_func_count > 2)
		{
			evt_undeaddragon_trap_03_func_count = 1;
		};
		EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore = EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore + 1;
	};
};

