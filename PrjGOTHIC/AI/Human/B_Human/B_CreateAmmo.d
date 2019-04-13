
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
	else if(rangedWeapon.munition == ItRw_Addon_FireArrow)
	{
		if(Npc_HasItems(slf,ItRw_Addon_FireArrow) < 5)
		{
			CreateInvItems(slf,ItRw_Addon_FireArrow,5);
		};
	}
	else if(rangedWeapon.munition == ItRw_Addon_MagicArrow)
	{
		if(Npc_HasItems(slf,ItRw_Addon_MagicArrow) < 5)
		{
			CreateInvItems(slf,ItRw_Addon_MagicArrow,5);
		};
	}
	else if(rangedWeapon.munition == ItRw_Bolt)
	{
		if(Npc_HasItems(slf,ItRw_Bolt) < 10)
		{
			CreateInvItems(slf,ItRw_Bolt,10);
		};
	}
	else if(rangedWeapon.munition == ItRw_Addon_MagicBolt)
	{
		if(Npc_HasItems(slf,ItRw_Addon_MagicBolt) < 5)
		{
			CreateInvItems(slf,ItRw_Addon_MagicBolt,5);
		};
	};
};


func void B_RefreshAmmo(var C_Npc slf,var int Amount)
{
	var int McBolzenAmount;
	var int McArrowAmount;
	Npc_RemoveInvItems(slf,ItRw_Bolt,Npc_HasItems(slf,ItRw_Bolt));
	McBolzenAmount = Kapitel * (Amount + hero.HitChance[NPC_TALENT_CROSSBOW]);
	CreateInvItems(slf,ItRw_Bolt,McBolzenAmount);
	Npc_RemoveInvItems(slf,ItRw_Arrow,Npc_HasItems(slf,ItRw_Arrow));
	McArrowAmount = Kapitel * (Amount + hero.HitChance[NPC_TALENT_BOW]);
	CreateInvItems(slf,ItRw_Arrow,McArrowAmount);
};

