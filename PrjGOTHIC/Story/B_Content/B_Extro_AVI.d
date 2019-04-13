
func void B_Extro_Avi()
{
	if((Npc_IsDead(PC_Thief_DI) == FALSE) && (Npc_IsDead(PC_Fighter_DI) == FALSE))
	{
		DiegAndGornAreOnboard = TRUE;
	};
	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Credits_Extro.BIK");
	PlayVideo("Credits2.BIK");
	if(DiegAndGornAreOnboard == TRUE)
	{
		PlayVideo("Extro_AllesWirdGut.BIK");
	};
	ExitSession();
};

