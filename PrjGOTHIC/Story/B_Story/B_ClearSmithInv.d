
func void B_ClearSmithInv(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		if(Dont_Fix_Unlim == FALSE)
		{
			B_RemoveEveryInvItem(slf,ItMiSwordraw);
			B_RemoveEveryInvItem(slf,ItMiSwordrawhot);
			B_RemoveEveryInvItem(slf,ItMiSwordbladehot);
			B_RemoveEveryInvItem(slf,ItMiSwordblade);
		};
	};
};

func void B_CoolHotDraw(var C_Npc slf)
{
	var int amount;
	amount = Npc_HasItems(slf,ItMiSwordrawhot);
	if(amount > 0)
	{
		Npc_RemoveInvItems(slf,ItMiSwordrawhot,amount);
		CreateInvItems(slf,ItMiSwordraw,amount);
	};
};

