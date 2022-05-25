
func int C_CanStealFromNpc(var int TheftDex) //TODO убрать TheftDex и использовать AIV_DexToSteal
{
	var int itm;
	if(!Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET))
	{
		return FALSE;
	};
	if(self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		return FALSE;
	};
	if(other.attribute[ATR_DEXTERITY] < (TheftDex - Theftdiff))
	{
		return FALSE;
	};
	if(NpcObsessedByDMT == TRUE)
	{
		return FALSE;
	};
	itm = self.aivar[AIV_ItemToSteal];
	if(itm != 0)
	{
		if(Hlp_IsItem(ItMi_Gold,itm))
		{
			return TRUE;
		};
		if(itm == self.aivar[AIV_HiddenTradeItem])
		{
			return TRUE;
		};
		if(!Npc_HasItems(self,itm))
		{
			return FALSE;
		};
	};
	return TRUE;
};

func void B_StealItem(var int dex,var int itm,var int amount) //TODO убрать TheftDex и использовать AIV_DexToSteal
{
	var string text;
	/*if((dex <= 20) && (EasyLowDexPickpocketDisabled == FALSE))
	{
		dex = 10;
	};*/
	if(other.attribute[ATR_DEXTERITY] >= dex)
	{
		B_GiveInvItems(self,other,itm,amount);
		Npc_GetInvItem(other,itm);
		text = ConcatStrings(self.name[0],PRINT_PickPocketSuccess);
		if(Hlp_IsItem(item,ItMi_Gold))
		{
			text = ConcatStrings(text,IntToString(amount));
			text = ConcatStrings(text,PRINT_Gold);
			Snd_Play("Geldbeutel");
			TotalTheftGold += amount;
		}
		else
		{
			text = ConcatStrings(text,item.description);
			Snd_Play("Scroll_Unfold");
			if(Hlp_StrCmp(item.name,NAME_Beutel))
			{
				TotalTheftGold += item.value;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lehmar))
		{
			Lehmar_StealBook_Day = B_GetDayPlus();
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Franco))
		{
			UnEquip_ItAm_Addon_Franco();
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Richter))
		{
			self.flags = 0;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Edgor))
		{
			B_Say(self,self,"$AWAKE");
		};
		B_LogEntry(Topic_PickPocket,ConcatStrings(text,"."));
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		if(C_IsNpc(self,MIL_328_Miliz))
		{
			B_Attack(self,other,AR_KILL,1);
		}
		else
		{
			B_Attack(self,other,AR_Theft,1);
		};
	};
};

func void AI_StopProcessInfos_Pickpocket(var int TheftDex) //TODO убрать TheftDex и использовать AIV_DexToSteal
{
	if(!C_CanStealFromNpc(TheftDex))
	{
		AI_StopProcessInfos(self);
	};
};

