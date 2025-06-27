
var int EVT_CavalornsGobbos_Func_OneTime;

func void EVT_CavalornsGobbos_Func()
{
	if(EVT_CavalornsGobbos_Func_OneTime == FALSE)
	{
		Wld_InsertNpc(YGobbo_Green,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(YGobbo_Green,"NW_XARDAS_GOBBO_02");
		Wld_InsertNpc(YGobbo_Green,"NW_XARDAS_GOBBO_02");
		EVT_CavalornsGobbos_Func_OneTime = TRUE;
	};
};

