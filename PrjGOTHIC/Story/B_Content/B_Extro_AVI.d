
func void B_Extro_AVI()
{
	PlayVideo("EXTRO_XARDAS.BIK");
	PlayVideo("CREDITS_EXTRO.BIK");
	PlayVideo("CREDITS2.BIK");
	if(!Npc_IsDead(Diego_DI) && !Npc_IsDead(Gorn_DI))
	{
		PlayVideo("EXTRO_ALLESWIRDGUT.BIK");
	};
	ExitSession();
};

