
func void B_CreateAmmo(var C_Npc slf)
{
	var C_Item rangedWeapon;
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		rangedWeapon = Npc_GetReadiedWeapon(slf);
	}
	else if(Npc_HasEquippedRangedWeapon(slf))
	{
		rangedWeapon = Npc_GetEquippedRangedWeapon(slf);
	}
	else
	{
		return;
	};
	if(rangedWeapon.munition == ItRw_Arrow)
	{
		if(Npc_HasItems(slf,ItRw_Arrow) < 10)
		{
			CreateInvItems(slf,ItRw_Arrow,10);
		};
	}
	else if(rangedWeapon.munition == ItRw_Bolt)
	{
		if(Npc_HasItems(slf,ItRw_Bolt) < 10)
		{
			CreateInvItems(slf,ItRw_Bolt,10);
		};
	};
};

