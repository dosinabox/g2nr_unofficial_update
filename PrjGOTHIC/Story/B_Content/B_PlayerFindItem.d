
func void B_PlayerFindItem(var int itm,var int amount)
{
	var string concatText;
	var string itemname;
	if(Npc_IsPlayer(self))
	{
		CreateInvItems(self,itm,amount);
		Npc_GetInvItem(self,itm);
		itemname = item.description;
		if(itm == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldTaken);
			Print(concatText);
			Snd_Play("Geldbeutel");
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_ItemTaken);
			Print(concatText);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsTaken);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			Print(concatText);
		};
	};
};

