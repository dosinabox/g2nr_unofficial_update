
func int C_TowerBanditsDead()
{
	if(!Npc_IsDead(TowerBandit1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(TowerBandit2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(TowerBandit3))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_HakonBanditsDead()
{
	if(!Npc_IsDead(BDT_1009_Bandit_L))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_1010_Bandit_L))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_1011_Bandit_M))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_LighthouseBanditsDead()
{
	if(!Npc_IsDead(BDT_1021_LeuchtturmBandit))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_1022_LeuchtturmBandit))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_1023_LeuchtturmBandit))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_ElvrichBanditsDead()
{
	if(!Npc_IsDead(BDT_10307_Addon_RangerBandit_M))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_10308_Addon_RangerBandit_L))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_10309_Addon_RangerBandit_L))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_10310_Addon_RangerBandit_M))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_BragoBanditsDead()
{
	if(!Npc_IsDead(Ambusher_1013) && (Bdt_1013_Away == FALSE))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Ambusher_1014))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Ambusher_1015))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_NorthBeachMonstersDead()
{
	if(!Npc_IsDead(BeachLurker1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachLurker2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachLurker3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachWaran1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachWaran2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachShadowbeast1))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_VinoDementorsDead()
{
	if(!Npc_IsDead(DMT_Vino1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(DMT_Vino2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(DMT_Vino3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(DMT_Vino4))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_SekobDementorsDead()
{
	if(!Npc_IsDead(DMT_DementorAmbientSekob1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(DMT_DementorAmbientSekob2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(DMT_DementorAmbientSekob3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(DMT_DementorAmbientSekob4))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_LobartOrksDead()
{
	if(!Npc_IsDead(OrcWarrior_Lobart1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(OrcWarrior_Lobart2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(OrcWarrior_Lobart3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(OrcWarrior_Lobart4))
	{
		return FALSE;
	};
	if(!Npc_IsDead(OrcWarrior_Lobart5))
	{
		return FALSE;
	};
	if(!Npc_IsDead(OrcWarrior_Lobart6))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_LobartBugsDead()
{
	if(!Npc_IsDead(Lobarts_Giant_Bug1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Lobarts_Giant_Bug2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Lobarts_Giant_Bug3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Lobarts_Giant_Bug4))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Lobarts_Giant_Bug5))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Lobarts_Giant_Bug6))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Lobarts_Giant_Bug7))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_BalthasarSheepsDead()
{
	if(!Npc_IsDead(BalthasarSheep1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BalthasarSheep2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BalthasarSheep3))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_AlwinSheepsDead()
{
	if(!Npc_IsDead(Alwin_Sheep1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Alwin_Sheep2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Alwin_Sheep3))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_GrimbaldSnappersDead()
{
	if(!Npc_IsDead(Grimbald_Snapper1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Grimbald_Snapper2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Grimbald_Snapper3))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_KervoLurkersDead()
{
	if(!Npc_IsDead(Kervo_Lurker1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Kervo_Lurker2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Kervo_Lurker3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Kervo_Lurker4))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Kervo_Lurker5))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Kervo_Lurker6))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_FajethSnappersDead()
{
	if(!Npc_IsDead(NewMine_Snapper1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper4))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper5))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper6))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper7))
	{
		return FALSE;
	};
	if(!Npc_IsDead(NewMine_Snapper8))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_AkilBanditsDead()
{
	if(!Npc_IsDead(BDT_1025_Bandit_H))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_1026_Bandit_H))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BDT_1027_Bandit_H))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_XardasDemonsDead()
{
	if(!Npc_IsDead(Xardas_DT_Demon1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Xardas_DT_Demon2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Xardas_DT_Demon3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Xardas_DT_Demon4))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Xardas_DT_Demon5))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Xardas_DT_DemonLord))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_SylvioGolemsDead()
{
	if(!Npc_IsDead(IceGolem_Sylvio1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(IceGolem_Sylvio2))
	{
		return FALSE;
	};
	return TRUE;
};

