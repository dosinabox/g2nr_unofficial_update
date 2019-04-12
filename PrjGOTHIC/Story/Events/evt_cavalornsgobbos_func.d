
var int EVT_CAVALORNSGOBBOS_FUNC_OneTime;

func void evt_cavalornsgobbos_func()
{
	if(EVT_CAVALORNSGOBBOS_FUNC_OneTime == FALSE)
	{
		Wld_InsertNpc(YGobbo_Green,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(YGobbo_Green,"NW_XARDAS_GOBBO_02");
		Wld_InsertNpc(YGobbo_Green,"NW_XARDAS_GOBBO_02");
		EVT_CAVALORNSGOBBOS_FUNC_OneTime = TRUE;
	};
};

