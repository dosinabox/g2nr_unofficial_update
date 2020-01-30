
func void B_ClearSmithInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		if(Dont_Fix_Unlim == FALSE)
		{
			Npc_RemoveInvItems(slf,ItMiSwordraw,Npc_HasItems(slf,ItMiSwordraw));
			Npc_RemoveInvItems(slf,ItMiSwordrawhot,Npc_HasItems(slf,ItMiSwordrawhot));
			Npc_RemoveInvItems(slf,ItMiSwordbladehot,Npc_HasItems(slf,ItMiSwordbladehot));
			Npc_RemoveInvItems(slf,ItMiSwordblade,Npc_HasItems(slf,ItMiSwordblade));
		};
	};
};

func void B_CoolHotDraw(var C_Npc slf)
{
	if(Npc_HasItems(slf,ItMiSwordrawhot))
	{
		CreateInvItems(slf,ItMiSwordraw,Npc_HasItems(slf,ItMiSwordrawhot));
		Npc_RemoveInvItems(slf,ItMiSwordrawhot,Npc_HasItems(slf,ItMiSwordrawhot));
	};
};

