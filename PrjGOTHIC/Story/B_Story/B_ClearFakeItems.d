
func void B_ClearFakeItems(var C_Npc slf)
{
	if(Npc_HasItems(slf,ItMw_2h_Rod_Fake))
	{
		Npc_RemoveInvItems(slf,ItMw_2h_Rod_Fake,Npc_HasItems(slf,ItMw_2h_Rod_Fake));
	};
	if(Npc_HasItems(slf,ItMw_BeliarWeapon_Fake))
	{
		Npc_RemoveInvItems(slf,ItMw_BeliarWeapon_Fake,Npc_HasItems(slf,ItMw_BeliarWeapon_Fake));
	};
};

