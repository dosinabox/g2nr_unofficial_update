
var int SLD_Bullco_is_alive;
var int SLD_Rod_is_alive;
var int SLD_Cipher_is_alive;
var int SLD_Gorn_is_alive;
var int SLD_Sylvio_is_alive;
var int GornDJG_is_alive;
var int DJG_Angar_is_alive;
var int Hodges_isAlive_Kap3;
var int Vino_isAlive_Kap3;
var int Malak_isAlive_Kap3;
var int Bromor_isAlive_Kap3;
var int Fernando_isAlive_Kap3;
var int Engrom_isAlive_Kap4;
var int Randolph_isAlive_preKap4;
var int Brutus_isAlive_preKap5;
var int Sekob_isAlive_Kap5;

func void B_NPC_IsAliveCheck(var int Zen)
{
	if(Zen == NEWWORLD_ZEN)
	{
		if(MIS_ReadyforChapter4 == TRUE)
		{
			if(Npc_IsDead(Randolph))
			{
				Randolph_isAlive_preKap4 = FALSE;
			}
			else
			{
				Randolph_isAlive_preKap4 = TRUE;
			};
			if(Npc_IsDead(GornNW_vor_DJG))
			{
				SLD_Gorn_is_alive = FALSE;
			}
			else
			{
				SLD_Gorn_is_alive = TRUE;
				B_RemoveNpc(PC_Fighter_NW_vor_DJG);
			};
			if(Npc_IsDead(Sylvio))
			{
				SLD_Sylvio_is_alive = FALSE;
			}
			else
			{
				SLD_Sylvio_is_alive = TRUE;
				B_RemoveNpc(SLD_806_Sylvio);
			};
			if(Npc_IsDead(Bullco))
			{
				SLD_Bullco_is_alive = FALSE;
			}
			else
			{
				SLD_Bullco_is_alive = TRUE;
				B_RemoveNpc(SLD_807_Bullco);
			};
			if(Npc_IsDead(Cipher))
			{
				SLD_Cipher_is_alive = FALSE;
			}
			else
			{
				SLD_Cipher_is_alive = TRUE;
				B_RemoveNpc(SLD_803_Cipher);
			};
			if(Npc_IsDead(Rod))
			{
				SLD_Rod_is_alive = FALSE;
			}
			else
			{
				SLD_Rod_is_alive = TRUE;
				B_RemoveNpc(SLD_804_Rod);
			};
			if(!Npc_IsDead(SLD_821_Soeldner))
			{
				Npc_ExchangeRoutine(SLD_821_Soeldner,"RODWEG");
			};
		};
	}
	else if(Zen == OLDWORLD_ZEN)
	{
		if(Kapitel >= 4)
		{
			if(Npc_IsDead(Brutus))
			{
				Brutus_isAlive_preKap5 = FALSE;
			}
			else
			{
				Brutus_isAlive_preKap5 = TRUE;
			};
			if(Npc_IsDead(GornDJG))
			{
				GornDJG_is_alive = FALSE;
			}
			else
			{
				GornDJG_is_alive = TRUE;
				B_RemoveNpc(PC_Fighter_DJG);
			};
			if(Npc_IsDead(DJG_Angar))
			{
				DJG_Angar_is_alive = FALSE;
			}
			else
			{
				DJG_Angar_is_alive = TRUE;
				B_RemoveNpc(DJG_705_Angar);
			};
		};
	};
};

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

func int C_AllCanyonRazorDead()
{
	if(!Npc_IsDead(CanyonRazor01))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor02))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor03))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor04))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor05))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor06))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor07))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor08))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor09))
	{
		return FALSE;
	};
	if(!Npc_IsDead(CanyonRazor10))
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

