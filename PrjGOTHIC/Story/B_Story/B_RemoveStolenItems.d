
func void B_RemoveStolenItems(var C_Npc owner,var C_Npc thief)
{
	if(C_IsNpc(owner,NOV_608_Garwig))
	{
		if(Npc_HasItems(thief,Holy_Hammer_MIS))
		{
			B_TransferAllInvItems(thief,owner,Holy_Hammer_MIS);
			B_Say(owner,owner,"$GETUPANDBEGONE");
			GarwigThiefOneTime = FALSE;
		};
	}
	else if(C_IsNpc(owner,SLD_803_Cipher))
	{
		if(C_IsNpc(thief,SLD_810_Dar))
		{
			B_TransferAllInvItems(thief,owner,ItMi_Joint);
		};
	}
	else if(C_IsNpc(owner,SLD_804_Rod))
	{
		if(Npc_HasItems(thief,ItMw_2H_Rod))
		{
			B_TransferAllInvItems(thief,owner,ItMw_2H_Rod);
			AI_EquipBestMeleeWeapon(owner);
		};
	}
	else if(C_IsNpc(owner,BAU_950_Lobart))
	{
		if(Npc_IsPlayer(thief) && (Lobart_Kleidung_Verkauft == FALSE) && !Mob_HasItems("CHEST_LOBART",ITAR_BAU_L))
		{
			B_TransferAllInvItems(thief,owner,ITAR_BAU_L);
		};
	}
	else if(C_IsNpc(owner,BAU_970_Orlan))
	{
		if(Orlan_RoomPaymentRefused == TRUE)
		{
			B_RemoveEveryInvItem(thief,ItKe_Orlan_HotelZimmer);
		}
		else if((Orlan_RoomIsRented == TRUE) && (Orlan_RoomIsFree == FALSE))
		{
			if(C_DaysSinceEvent(Orlan_RoomPaymentDay,7))
			{
				Orlan_RoomPaymentDay = Wld_GetDay();
			};
		};
	}
	else if(C_IsNpc(owner,DJG_715_Ferros))
	{
		if(Npc_IsPlayer(thief))
		{
			if(Npc_HasItems(thief,ItMw_1H_FerrosSword_MIS))
			{
				B_TransferAllInvItems(thief,owner,ItMw_1H_FerrosSword_MIS);
				AI_EquipBestMeleeWeapon(owner);
				if(MIS_FerrosSword == LOG_RUNNING)
				{
					MIS_FerrosSword = LOG_FAILED;
					B_CheckLog();
				};
			};
		};
	}
	else if(C_IsNpc(owner,VLK_402_Richter))
	{
		B_TransferAllInvItems(thief,owner,ItKe_Richter);
	}
	else if(C_IsNpc(owner,VLK_413_Bosper))
	{
		if(Npc_IsPlayer(thief))
		{
			if(Npc_HasItems(thief,ItRw_Bow_L_03_MIS))
			{
				B_RemoveEveryInvItem(thief,ItRw_Bow_L_03_MIS);
				if(MIS_Bosper_Bogen == LOG_RUNNING)
				{
					MIS_Bosper_Bogen = LOG_FAILED;
					B_CheckLog();
				};
			};
		};
	}
	else if(C_IsNpc(owner,VLK_421_Valentino))
	{
		if(Npc_IsPlayer(thief))
		{
			B_TransferAllInvItems(thief,owner,ItKe_Valentino);
			B_TransferAllInvItems(thief,owner,ItRi_Prot_Edge_01_Valentino);
		};
	}
	else if(C_IsNpc(owner,VLK_438_Alrik))
	{
		if(Npc_HasItems(thief,ItMw_AlriksSword_MIS))
		{
			B_TransferAllInvItems(thief,owner,ItMw_AlriksSword_MIS);
			AI_EquipBestMeleeWeapon(owner);
			MIS_Alrik_Sword = LOG_SUCCESS;
			B_CheckLog();
		};
	}
	else if(C_IsNpc(owner,PIR_1350_Addon_Francis))
	{
		B_TransferAllInvItems(thief,owner,ItWr_Addon_FrancisAbrechnung_MIS);
		if(GregIsBack == FALSE)
		{
			B_TransferAllInvItems(thief,owner,ItKe_Greg_Addon_MIS);
		};
	};
};

