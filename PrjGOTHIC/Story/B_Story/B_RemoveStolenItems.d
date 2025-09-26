
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
		if(Npc_HasItems(thief,ItMw_2h_Rod))
		{
			B_TransferAllInvItems(thief,owner,ItMw_2h_Rod);
			AI_EquipBestMeleeWeapon(owner);
		};
	}
	else if(C_IsNpc(owner,BAU_950_Lobart))
	{
		if(Npc_IsPlayer(thief) && (Lobart_Kleidung_Verkauft == FALSE) && !Mob_HasItems("CHEST_LOBART",ITAR_Bau_L))
		{
			B_TransferAllInvItems(thief,owner,ITAR_Bau_L);
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
		if(GregIsBack == FALSE)
		{
			B_TransferAllInvItems(thief,owner,ItKe_Greg_Addon_MIS);
		};
	};
};

