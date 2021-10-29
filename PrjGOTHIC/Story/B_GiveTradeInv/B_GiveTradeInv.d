
func int C_AmIWeaponTrader(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Erol))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fisk))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garett))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Huno))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Martin))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scatty))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bennet_DI))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Canthar))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cipher))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hakon))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hodges))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Jora))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Khaled))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Matteo))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orlan))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rethon))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sarah))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Tandor))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bosper))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Engor))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rosi))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_TraderCanEquipRangedWeapon(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garett))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Engor))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bosper))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Diego_DI))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Tandor))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sengrath))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Khaled))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cipher))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_GiveTradeInv(var C_Npc slf)
{
	if(C_AmIWeaponTrader(slf))
	{
		B_UnEquipAllWeapons(slf,TRUE);
	};
	B_ClearRuneInv(slf);
	B_ClearTools(slf);
	B_ClearSpecialAmmo(slf);
	B_CoolHotDraw(hero);
	B_ClearFakeItems(hero);
	if(slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		if(slf.aivar[AIV_NPCIsTrader] == TRUE)
		{
			B_ClearJunkTradeInv(slf);
		};
		if(C_IsNpc(slf,KDW_1401_Addon_Cronos_NW))
		{
			B_GiveTradeInv_Addon_Cronos_NW(slf);
		}
		else if(C_IsNpc(slf,KDW_14010_Addon_Cronos_ADW))
		{
			B_GiveTradeInv_Addon_Cronos_ADW(slf);
		}
		else if(C_IsNpc(slf,MIL_350_Addon_Martin))
		{
			B_GiveTradeInv_Addon_Martin(slf);
		}
		else if(C_IsNpc(slf,PIR_1357_Addon_Garett))
		{
			B_GiveTradeInv_Addon_Garett(slf);
		}
		else if(C_IsNpc(slf,BDT_1097_Addon_Fisk))
		{
			B_GiveTradeInv_Addon_Fisk(slf);
		}
		else if(C_IsNpc(slf,BDT_1099_Addon_Huno))
		{
			B_GiveTradeInv_Addon_Huno(slf);
		}
		else if(C_IsNpc(slf,VLK_4303_Addon_Erol))
		{
			B_GiveTradeInv_Addon_Erol(slf);
		}
		else if(C_IsNpc(slf,BDT_10017_Addon_Juan))
		{
			B_GiveTradeInv_Addon_Juan(slf);
		}
		else if(C_IsNpc(slf,BDT_1091_Addon_Lucia))
		{
			B_GiveTradeInv_Addon_Lucia(slf);
		}
		else if(C_IsNpc(slf,PIR_1351_Addon_Samuel))
		{
			B_GiveTradeInv_Addon_Samuel(slf);
		}
		else if(C_IsNpc(slf,BDT_1086_Addon_Scatty))
		{
			B_GiveTradeInv_Addon_Scatty(slf);
		}
		else if(C_IsNpc(slf,BDT_10022_Addon_Miguel))
		{
			B_GiveTradeInv_Addon_Miguel(slf);
		}
		else if(C_IsNpc(slf,VLK_4108_Engor))
		{
			B_GiveTradeInv_Engor(slf);
		}
		else if(C_IsNpc(slf,VLK_416_Matteo))
		{
			B_GiveTradeInv_Matteo(slf);
		}
		else if(C_IsNpc(slf,VLK_469_Halvor))
		{
			B_GiveTradeInv_Halvor(slf);
		}
		else if(C_IsNpc(slf,VLK_413_Bosper))
		{
			B_GiveTradeInv_Bosper(slf);
		}
		else if(C_IsNpc(slf,VLK_457_Brian))
		{
			B_GiveTradeInv_Brian(slf);
		}
		else if(C_IsNpc(slf,VLK_437_Brahim))
		{
			B_GiveTradeInv_Brahim(slf);
		}
		else if(C_IsNpc(slf,VLK_417_Constantino))
		{
			B_GiveTradeInv_Constantino(slf);
		}
		else if(C_IsNpc(slf,VLK_431_Kardif))
		{
			B_GiveTradeInv_Kardif(slf);
		}
		else if(C_IsNpc(slf,VLK_409_Zuris))
		{
			B_GiveTradeInv_Zuris(slf);
		}
		else if(C_IsNpc(slf,VLK_410_Baltram))
		{
			B_GiveTradeInv_Baltram(slf);
		}
		else if(C_IsNpc(slf,VLK_468_Canthar))
		{
			B_GiveTradeInv_Canthar(slf);
		}
		else if(C_IsNpc(slf,VLK_470_Sarah))
		{
			B_GiveTradeInv_Sarah(slf);
		}
		else if(C_IsNpc(slf,VLK_408_Jora))
		{
			B_GiveTradeInv_Jora(slf);
		}
		else if(C_IsNpc(slf,VLK_407_Hakon))
		{
			B_GiveTradeInv_Hakon(slf);
		}
		else if(C_IsNpc(slf,VLK_420_Coragon))
		{
			B_GiveTradeInv_Coragon(slf);
		}
		else if(C_IsNpc(slf,KDF_508_Gorax))
		{
			B_GiveTradeInv_Gorax(slf);
		}
		else if(C_IsNpc(slf,BAU_970_Orlan))
		{
			B_GiveTradeInv_Orlan(slf);
		}
		else if(C_IsNpc(slf,SLD_809_Bennet))
		{
			B_GiveTradeInv_Bennet(slf);
		}
		else if(C_IsNpc(slf,SLD_809_Bennet_DI))
		{
			B_GiveTradeInv_Bennet_DI(slf);
		}
		else if(C_IsNpc(slf,BAU_911_Elena))
		{
			B_GiveTradeInv_Elena(slf);
		}
		else if(C_IsNpc(slf,BAU_980_Sagitta))
		{
			B_GiveTradeInv_Sagitta(slf);
		}
		else if(C_IsNpc(slf,DJG_710_Kjorn))
		{
			B_GiveTradeInv_Kjorn(slf);
		}
		else if(C_IsNpc(slf,DJG_709_Rethon))
		{
			B_GiveTradeInv_Rethon(slf);
		}
		else if(C_IsNpc(slf,BAU_936_Rosi))
		{
			B_GiveTradeInv_Rosi(slf);
		}
		else if(C_IsNpc(slf,VLK_498_Ignaz))
		{
			B_GiveTradeInv_Ignaz(slf);
		}
		else if(C_IsNpc(slf,PC_Mage_DI))
		{
			B_GiveTradeInv_Milten_DI(slf);
		}
		else if(C_IsNpc(slf,VLK_439_Vatras_DI))
		{
			B_GiveTradeInv_Vatras_DI(slf);
		}
		else if(C_IsNpc(slf,PC_Thief_DI))
		{
			B_GiveTradeInv_Diego_DI(slf);
		}
		else if(C_IsNpc(slf,PAL_260_Tandor))
		{
			B_GiveTradeInv_Tandor(slf);
		}
		else if(C_IsNpc(slf,PAL_267_Sengrath))
		{
			B_GiveTradeInv_Sengrath(slf);
		}
		else if(C_IsNpc(slf,KDF_509_Isgaroth))
		{
			B_GiveTradeInv_Isgaroth(slf);
		}
		else if(C_IsNpc(slf,VLK_476_Fenia))
		{
			B_GiveTradeInv_Fenia(slf);
		}
		else if(C_IsNpc(slf,SLD_823_Khaled))
		{
			B_GiveTradeInv_Khaled(slf);
		}
		else if(C_IsNpc(slf,KDF_503_Karras))
		{
			B_GiveTradeInv_Karras(slf);
		}
		else if(C_IsNpc(slf,VLK_422_Salandril))
		{
			B_GiveTradeInv_Salandril(slf);
		}
		else if(C_IsNpc(slf,VLK_411_Gaertner))
		{
			B_GiveTradeInv_Gaertner(slf);
		}
		else if(C_IsNpc(slf,VLK_404_Lutero))
		{
			B_GiveTradeInv_Lutero(slf);
		}
		else if(C_IsNpc(slf,VLK_458_Rupert))
		{
			B_GiveTradeInv_Rupert(slf);
		}
		else if(C_IsNpc(slf,VLK_462_Thorben))
		{
			B_GiveTradeInv_Thorben(slf);
		}
		else if(C_IsNpc(slf,SLD_803_Cipher))
		{
			B_GiveTradeInv_Cipher(slf);
		}
		else if(C_IsNpc(slf,BAU_908_Hodges))
		{
			B_GiveTradeInv_Hodges(slf);
		};
		slf.aivar[AIV_ChapterInv] = Kapitel + 1;
	};
	if(Npc_IsInState(slf,ZS_Dead) || Npc_IsInState(slf,ZS_Unconscious))
	{
		if(slf.aivar[AIV_NPCIsTrader] == TRUE)
		{
			B_ClearDeadTrader(slf);
		};
	};
};

func void B_EquipTrader(var C_Npc slf)
{
	if(Trade_IsActive == TRUE)
	{
		AI_EquipBestMeleeWeapon(slf);
		if(C_TraderCanEquipRangedWeapon(slf))
		{
			AI_EquipBestRangedWeapon(slf);
		};
		Trade_IsActive = FALSE;
	};
};

