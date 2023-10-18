
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
		B_RefreshInvItemToAmount(slf,ItRw_Arrow,10);
	}
	else if(rangedWeapon.munition == ItRw_Bolt)
	{
		B_RefreshInvItemToAmount(slf,ItRw_Bolt,10);
	};
};

func void B_RefreshAmmo(var C_Npc slf,var int amount)
{
	B_RefreshInvItemToAmount(slf,ItRw_Bolt,Kapitel * amount);
	B_RefreshInvItemToAmount(slf,ItRw_Arrow,Kapitel * amount);
};

func void B_RefreshTraderAmmo(var C_Npc slf,var int amount)
{
	if(TradersHaveLimitedAmmo == FALSE)
	{
		B_RefreshAmmo(slf,amount);
	}
	else if(slf.aivar[AIV_RefreshAmmoDay] <= Wld_GetDay())
	{
		B_RefreshAmmo(slf,amount);
		slf.aivar[AIV_RefreshAmmoDay] = Wld_GetDay() + 1;
	};
};

