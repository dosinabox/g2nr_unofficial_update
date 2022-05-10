
func int C_CanStealFromNpc(var int TheftDex) //TODO убрать TheftDex и использовать AIV_DexToSteal
{
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
	if(self.aivar[AIV_ItemToSteal] != 0)
	{
		if(self.aivar[AIV_ItemToSteal] == self.aivar[AIV_HiddenTradeItem])
		{
			return TRUE;
		};
		if(!Npc_HasItems(self,self.aivar[AIV_ItemToSteal]))
		{
			return FALSE;
		};
	};
	return TRUE;
};

func int C_Beklauen(var int TheftDex,var int TheftGold) //TODO поддержка старых сохранений - удалить вместе с диалогами
{
	/*if(self.aivar[AIV_DexToSteal] > 0)
	{
		return FALSE;
	};*/
	if(!C_CanStealFromNpc(TheftDex))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_Talk))
	{
		if((TheftDex <= 20) && (EasyLowDexPickpocketDisabled == FALSE))
		{
			TheftDexGlob = 10;
		}
		else
		{
			TheftDexGlob = TheftDex;
		};
		TheftGoldGlob = TheftGold;
	};
	return TRUE;
};

func void B_Beklauen() //TODO поддержка старых сохранений - удалить вместе с диалогами
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		var string text;
		B_GiveInvItems(self,other,ItMi_Gold,TheftGoldGlob);
		TotalTheftGold += TheftGoldGlob;
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Snd_Play("Geldbeutel");
		text = ConcatStrings(self.name[0],PRINT_PickPocketSuccess);
		text = ConcatStrings(text,IntToString(TheftGoldGlob));
		text = ConcatStrings(text,PRINT_Gold);
		text = ConcatStrings(text,".");
		B_LogEntry(Topic_PickPocket,text);
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
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
			//Snd_Play("Map_Unfold");
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

