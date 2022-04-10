
func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	var string itemname;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};
	if(Npc_IsPlayer(giver))
	{
		Npc_GetInvItem(giver,itemInstance);
		itemname = item.description;
		if(item.flags & ITEM_MISSION)
		{
			item.flags = item.flags & ~ITEM_MISSION;
		};
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldGiven);
			AI_PrintScreen(concatText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_ItemGiven);
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGiven);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		};
		Npc_RemoveInvItems(giver,itemInstance,amount);
		CreateInvItems(taker,itemInstance,amount);
	}
	else if(Npc_IsPlayer(taker))
	{
		Npc_RemoveInvItems(giver,itemInstance,amount);
		CreateInvItems(taker,itemInstance,amount);
		Npc_GetInvItem(taker,itemInstance);
		itemname = item.description;
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldTaken);
			AI_PrintScreen(concatText,-1,YPOS_GoldTaken,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_ItemTaken);
			AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsTaken);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	};
	return TRUE;
};

func void B_GiveArmor(var int itemInstance)
{
	CreateInvItem(hero,itemInstance);
	Npc_GetInvItem(hero,itemInstance);
	AI_PrintScreen(ConcatStrings(item.description,PRINT_ItemTaken),-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
};

