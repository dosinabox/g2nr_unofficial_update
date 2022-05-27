
func void B_RemoveEveryInvItem(var C_Npc npc,var int itm)
{
	var int amount;
	amount = Npc_HasItems(npc,itm);
	if(amount > 0)
	{
		Npc_RemoveInvItems(npc,itm,amount);
	};
};

func void B_RefreshInvItemToAmount(var C_Npc npc,var int itm,var int neededAmount)
{
	var int currentAmount;
	currentAmount = Npc_HasItems(npc,itm);
	if(currentAmount < neededAmount)
	{
		B_RemoveEveryInvItem(npc,itm);
		CreateInvItems(npc,itm,neededAmount);
	};
};

func void B_TransferAllInvItems(var C_Npc sourceNpc,var C_Npc targetNpc,var int itm)
{
	var int amount;
	amount = Npc_HasItems(sourceNpc,itm);
	if(amount > 0)
	{
		Npc_RemoveInvItems(sourceNpc,itm,amount);
		CreateInvItems(targetNpc,itm,amount);
	};
};

