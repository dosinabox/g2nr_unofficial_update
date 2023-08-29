
func void GregIsBack_S1()
{
	if(GregIsBack == FALSE)
	{
		Wld_InsertNpc(PIR_1320_Addon_Greg,"ADW_PIRATECAMP_GREG");
		B_StartOtherRoutine(Bill,"GREGISBACK");
		B_StartOtherRoutine(Morgan,"GREGISBACK");
		B_StartOtherRoutine(AlligatorJack,"GREGISBACK");
		Wld_InsertNpc(CanyonRazor,"ADW_CANYON_MINE1_01");
		Wld_InsertNpc(CanyonRazor,"ADW_CANYON_PATH_TO_LIBRARY_07A");
		Wld_InsertNpc(CanyonRazor,"ADW_CANYON_PATH_TO_LIBRARY_36");
		Wld_InsertNpc(CanyonRazor,"ADW_CANYON_PATH_TO_MINE2_04");
		if(MIS_KrokoJagd == LOG_Running)
		{
			MIS_KrokoJagd = LOG_FAILED;
			B_CheckLog();
		};
		B_InitNpcGlobals();
		GregIsBack = TRUE;
	};
};

