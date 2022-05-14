
func void B_RemoveEveryInvItem(var C_Npc npc,var int itm)
{
	var int amount;
	amount = Npc_HasItems(npc,itm);
	if(amount > 0)
	{
		Npc_RemoveInvItems(npc,itm,amount);
	};
};

