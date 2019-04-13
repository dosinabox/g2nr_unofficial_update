
func void B_ClearSmithInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,ItMiSwordraw,Npc_HasItems(slf,ItMiSwordraw));
		Npc_RemoveInvItems(slf,ItMiSwordrawhot,Npc_HasItems(slf,ItMiSwordrawhot));
		Npc_RemoveInvItems(slf,ItMiSwordbladehot,Npc_HasItems(slf,ItMiSwordbladehot));
		Npc_RemoveInvItems(slf,ItMiSwordblade,Npc_HasItems(slf,ItMiSwordblade));
	};
};


func void B_ClearAlchemyInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,ItMi_Flask,Npc_HasItems(slf,ItMi_Flask));
	};
};


func void B_ClearBonusFoodInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		if(slf.aivar[AIV_GetBonusFood] == TRUE)
		{
			Npc_RemoveInvItems(slf,ItFo_Apple,Npc_HasItems(slf,ItFo_Apple));
		}
		else
		{
			slf.aivar[AIV_GetBonusFood] = TRUE;
		};
		if(slf.guild == GIL_PAL)
		{
			Npc_RemoveInvItems(slf,ItPl_Dex_Herb_01,Npc_HasItems(slf,ItPl_Dex_Herb_01));
		};
		if(slf.guild == GIL_PIR)
		{
			Npc_RemoveInvItems(slf,ItFo_Addon_Pfeffer_01,Npc_HasItems(slf,ItFo_Addon_Pfeffer_01));
		};
	};
};

