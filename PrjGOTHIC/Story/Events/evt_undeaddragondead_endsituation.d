
var int EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime;

func void evt_undeaddragondead_endsituation()
{
	if(EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime == FALSE)
	{
		if(Npc_IsDead(UndeadDragon))
		{
			Angar_DI_Party = LOG_SUCCESS;
			B_StartOtherRoutine(Angar_DI,"FIREDRAGONISLAND");
			B_StartOtherRoutine(Lee_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Diego_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Milten_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Gorn_DI,"UNDEADDRAGONDEAD");
			B_StartOtherRoutine(Lester_DI,"UNDEADDRAGONDEAD");
			EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime = TRUE;
		};
	};
	EnteredFinalDIHall = TRUE;
};

