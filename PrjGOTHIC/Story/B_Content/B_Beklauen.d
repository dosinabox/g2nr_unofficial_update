
func int C_Beklauen(var int TheftDex,var int TheftGold)
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff)) && (NpcObsessedByDMT == FALSE))
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
};

func void B_Beklauen()
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		B_GiveInvItems(self,other,ItMi_Gold,TheftGoldGlob);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Snd_Play("Geldbeutel");
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

