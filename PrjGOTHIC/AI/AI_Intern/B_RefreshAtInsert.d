
func int C_NpcCanEquipWeapons(var C_Npc slf)
{
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(slf.guild == GIL_STRF)
	{
		return FALSE;
	};
	if(C_NpcIsMage(slf))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,NONE_ADDON_111_Quarhodron))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,NONE_ADDON_112_Rhademes))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,VLK_4302_Addon_Elvrich))
	{
		if(Elvrich_GoesBack2Thorben == FALSE)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,PC_Fighter_OW))
	{
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_492_Rengaru))
	{
		if(Rengaru_Ausgeliefert == TRUE)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_469_Halvor))
	{
		if(Halvor_Ausgeliefert == TRUE)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_493_Nagur))
	{
		if(Nagur_Ausgeliefert == TRUE)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_470_Sarah))
	{
		if(Sarah_Ausgeliefert == TRUE)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_468_Canthar))
	{
		if((Canthar_Ausgeliefert == TRUE) && (Andre_ToldInfoFromCanthar == FALSE))
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,SLD_809_Bennet))
	{
		if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_405_Fernando))
	{
		if(Fernando_ImKnast == TRUE)
		{
			return FALSE;
		};
	}
	else if(C_IsNpc(slf,VLK_434_Borka))
	{
		if(MIS_Andre_REDLIGHT == LOG_SUCCESS)
		{
			return FALSE;
		};
	};
	return TRUE;
};


func void B_RefreshMeleeWeapon(var C_Npc slf)
{
	var int rnd;
	if(C_NpcIsPaladin(slf))
	{
		rnd = Hlp_Random(2);
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_MISC_Sword);
		}
		else
		{
			CreateInvItem(slf,ItMw_2H_Sword_M_01);
		};
	}
	else if((slf.guild == GIL_MIL) || (slf.guild == GIL_SLD) || (slf.guild == GIL_DJG) || (slf.guild == GIL_PIR))
	{
		rnd = Hlp_Random(2);
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_MISC_Sword);
		}
		else
		{
			CreateInvItem(slf,ItMw_1h_Misc_Axe);
		};
	}
	else if(slf.guild == GIL_BAU)
	{
		rnd = Hlp_Random(2);
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
		rnd = Hlp_Random(2);
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_Vlk_Mace);
		}
		else
		{
			CreateInvItem(slf,ItMw_1H_Mace_L_03);
		};
	}
	else if(slf.guild == GIL_VLK)
	{
		rnd = Hlp_Random(2);
		if(rnd == 0)
		{
			CreateInvItem(slf,ItMw_1h_Vlk_Dagger);
		}
		else
		{
			CreateInvItem(slf,ItMw_1H_Mace_L_01);
		};
	}
	else
	{
		CreateInvItem(slf,ItMw_1h_Bau_Mace);
	};
};

func void B_RefreshAtInsert()
{
	if(self.guild >= GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(Npc_IsDead(self))
	{
		return;
	};
	if(C_NpcIsHero(self))
	{
		return;
	};
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if((Pardos_Geheilt == FALSE) && (Sklaven_Flucht == FALSE))
		{
			if(C_IsNpc(self,STRF_1122_Addon_Pardos))
			{
				return;
			};
		};
	};
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	if(!Npc_HasEquippedMeleeWeapon(self))
	{
		if(C_NpcCanEquipWeapons(self))
		{
			B_RefreshMeleeWeapon(self);
		};
	};
};

