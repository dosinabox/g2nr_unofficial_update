
func void B_UnEquipHeroItem(var int itemInstance)
{
	var int amount;
	amount = Npc_HasItems(hero,itemInstance);
	if(amount > 0)
	{
		Npc_RemoveInvItems(hero,itemInstance,amount);
		CreateInvItems(hero,itemInstance,amount);
	};
};

