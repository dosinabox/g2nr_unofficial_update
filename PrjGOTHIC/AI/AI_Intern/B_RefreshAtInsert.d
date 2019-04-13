
func int C_NpcCanEquipWeapons(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Elvrich))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Quarhodron))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornOW)) && (MIS_RescueGorn != LOG_SUCCESS))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rengaru)) && (Rengaru_Ausgeliefert == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Halvor)) && (Halvor_Ausgeliefert == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Nagur)) && (Nagur_Ausgeliefert == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sarah)) && (Sarah_Ausgeliefert == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Canthar)) && (Canthar_Ausgeliefert == TRUE) && (Andre_CantharFalle == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bennet)) && (Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fernando)) && (Fernando_ImKnast == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Borka)) && (MIS_Andre_REDLIGHT == LOG_SUCCESS))
	{
		return FALSE;
	};
	return TRUE;
};


func void B_RefreshMeleeWeapon(var C_Npc slf)
{
	var int rnd;
	rnd = Hlp_Random(2);
	if(!C_NpcCanEquipWeapons(slf))
	{
		return;
	};
	if((slf.guild == GIL_MIL) || (slf.guild == GIL_SLD) || (slf.guild == GIL_DJG) || (slf.guild == GIL_PIR))
	{
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_MISC_Sword);
		}
		else
		{
			CreateInvItem(slf,ItMw_1h_Misc_Axe);
		};
	}
	else if(slf.guild == GIL_PAL)
	{
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_MISC_Sword);
		}
		else
		{
			CreateInvItem(slf,ItMw_2H_Sword_M_01);
		};
	}
	else if(slf.guild == GIL_BAU)
	{
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_Bau_Mace);
		}
		else
		{
			CreateInvItem(slf,ItMw_1h_Bau_Axe);
		};
	}
	else if(slf.guild == GIL_NOV)
	{
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_Vlk_Mace);
		}
		else
		{
			CreateInvItem(slf,ItMw_1H_Mace_L_03);
		};
	}
	else if((slf.guild == GIL_VLK) && C_NpcCanEquipWeapons(slf))
	{
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_Vlk_Dagger);
		}
		else
		{
			CreateInvItem(slf,ItMw_1H_Mace_L_01);
		};
	}
	else if((slf.guild != GIL_DMT) && (slf.guild != GIL_KDF) && (slf.guild != GIL_KDW) && (slf.guild != GIL_STRF))
	{
		CreateInvItem(slf,ItMw_1h_Bau_Mace);
	};
};

func void B_RefreshAtInsert()
{
	var C_Npc her;
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};
	her = Hlp_GetNpc(PC_Hero);
	if((self.guild < GIL_SEPERATOR_HUM) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		if(!Npc_HasEquippedWeapon(self))
		{
			B_RefreshMeleeWeapon(self);
		};
	};
};

