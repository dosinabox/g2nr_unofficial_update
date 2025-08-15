
func void B_ClearSmithInv(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		if(Dont_Fix_Unlim == FALSE)
		{
			B_RemoveEveryInvItem(slf,ItMiSwordRaw);
			B_RemoveEveryInvItem(slf,ItMiSwordRawHot);
			B_RemoveEveryInvItem(slf,ItMiSwordBladeHot);
			B_RemoveEveryInvItem(slf,ItMiSwordBlade);
		};
	};
};

func void B_CoolHotDraw(var C_Npc slf)
{
	var int amount;
	amount = Npc_HasItems(slf,ItMiSwordRawHot);
	if(amount > 0)
	{
		Npc_RemoveInvItems(slf,ItMiSwordRawHot,amount);
		CreateInvItems(slf,ItMiSwordRaw,amount);
	};
};

