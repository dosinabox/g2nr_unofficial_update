
func void B_Extro_Avi()
{
	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Credits_Extro.BIK");
	PlayVideo("Credits2.BIK");
	if(!Npc_IsDead(PC_Thief_DI) && !Npc_IsDead(PC_Fighter_DI))
	{
//		DiegAndGornAreOnboard = TRUE;
		PlayVideo("Extro_AllesWirdGut.BIK");
	};
	ExitSession();
};

