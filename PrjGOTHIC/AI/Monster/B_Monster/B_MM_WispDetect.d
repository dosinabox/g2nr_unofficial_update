
func void B_GetWispDetectedItem()
{
	var int randy;
	if(!Hlp_IsValidItem(item))
	{
		return;
	};
	if(Npc_GetHeightToItem(self,item) > 500)
	{
		return;
	};
	randy = Hlp_Random(100);
	AI_GotoItem(self,item);
	if((Npc_GetDistToItem(self,item) < 1000) && (randy <= 1))
	{
		Wld_PlayEffect("spellFX_ItemAusbuddeln",item,item,0,0,0,FALSE);
	};
};

func int B_WispDetectedItem()
{
	var int WispSearchFlags;
	if(WispSearching == WispSearch_Follow)
	{
	}
	else
	{
		WispSearchFlags = 0;
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_NF)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_NF;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_FF)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_FF | ITEM_KAT_MUN;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_NONE)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_NONE | ITEM_KAT_KEYS | ITEM_KAT_LIGHT | ITEM_KAT_ARMOR;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_RUNE)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_RUNE | ITEM_KAT_DOCS;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_MAGIC)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_MAGIC;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_FOOD)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_FOOD;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_POTIONS)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_POTIONS;
		};
		if(WispSearchFlags != 0)
		{
			if(Wld_DetectItem(self,WispSearchFlags))
			{
				B_GetWispDetectedItem();
			};
		};
		return WispSearchFlags;
	};
	return 0;
};

func int B_MM_WispDetect()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	{
		Npc_PerceiveAll(self);
		if(Wld_DetectNpc(self,Wisp_Detector,NOFUNC,-1))
		{
			B_RemoveNpc(self);
		};
		if((Npc_GetDistToNpc(self,hero) < 2000) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			self.aivar[AIV_SummonTime] = 0;
			B_WispDetectedItem();
			return LOOP_END;
		}
		else
		{
			if(Npc_GetDistToNpc(self,hero) < 500)
			{
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				self.aivar[AIV_TAPOSITION] = NOTINPOS;
				Npc_ClearAIQueue(self);
				AI_GotoNpc(self,hero);
			};
			return LOOP_END;
		};
	};
};

