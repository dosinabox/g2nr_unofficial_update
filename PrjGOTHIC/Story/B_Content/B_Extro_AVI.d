
func void B_Extro_Avi()
{
	PlayVideo("Extro_Xardas.BIK");
	PlayVideo("Credits_Extro.BIK");
	PlayVideo("Credits2.BIK");
	if(!Npc_IsDead(Diego_DI) && !Npc_IsDead(Gorn_DI))
	{
//		DiegAndGornAreOnboard = TRUE;
		PlayVideo("Extro_AllesWirdGut.BIK");
	};
	ExitSession();
};

