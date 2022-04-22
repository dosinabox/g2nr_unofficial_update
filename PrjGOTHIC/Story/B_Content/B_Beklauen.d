
var int TotalTheftGold;

func int C_CanStealFromNpc(var int TheftDex)
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
	return TRUE;
};

func int C_Beklauen(var int TheftDex,var int TheftGold)
{
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

func void B_Beklauen()
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

func void B_StealItem(var int TheftDex,var int itemInstance)
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDex)
	{
		var string text;
		B_GiveInvItems(self,other,itemInstance,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Npc_GetInvItem(other,itemInstance);
		text = ConcatStrings(self.name[0],PRINT_PickPocketSuccess);
		text = ConcatStrings(text,item.description);
		text = ConcatStrings(text,".");
		B_LogEntry(Topic_PickPocket,text);
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lehmar))
		{
			Lehmar_StealBook_Day = B_GetDayPlus();
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Franco))
		{
			UnEquip_ItAm_Addon_Franco();
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gerbrandt)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fernando)))
		{
			TotalTheftGold += 100;
		}
		else if(C_IsNpc(self,VLK_441_Garvell))
		{
			TotalTheftGold += 25;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Richter))
		{
			self.flags = 0;
		};
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

func void AI_StopProcessInfos_Pickpocket(var int TheftDex)
{
	if(!C_CanStealFromNpc(TheftDex))
	{
		AI_StopProcessInfos(self);
	};
};

