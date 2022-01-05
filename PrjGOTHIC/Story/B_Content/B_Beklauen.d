
var int TotalTheftGold;

func int C_Beklauen(var int TheftDex,var int TheftGold)
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff)) && (NpcObsessedByDMT == FALSE))
	{
		if(Npc_IsInState(self,ZS_Talk))
		{
			if(TheftDex <= 20)
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
	return FALSE;
};

func void B_Beklauen()
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		B_GiveInvItems(self,other,ItMi_Gold,TheftGoldGlob);
		TotalTheftGold += TheftGoldGlob;
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Snd_Play("Geldbeutel");
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketSuccess));
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func int C_StealItem(var int TheftDex)
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff)) && (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_StealItem(var int TheftDex,var int Itm)
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDex)
	{
		B_GiveInvItems(self,other,Itm,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketSuccess));
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

