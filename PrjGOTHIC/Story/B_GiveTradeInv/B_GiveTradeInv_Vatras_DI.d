
var int Vatras_DI_ItemsGiven;

func void B_GiveTradeInv_Vatras_DI(var C_Npc slf)
{
	if(Vatras_DI_ItemsGiven == FALSE)
	{
//		CreateInvItems(slf,ItMi_Gold,230);
		CreateInvItems(slf,ItPl_Temp_Herb,4);
		CreateInvItems(slf,ItPl_Perm_Herb,2);
		CreateInvItems(slf,ItSc_LightHeal,2);
		CreateInvItems(slf,ItSc_Zap,2);
		CreateInvItems(slf,ItSc_Icebolt,2);
		CreateInvItems(slf,ItSc_LightningFlash,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		CreateInvItems(slf,ItSc_IceWave,2);
		CreateInvItems(slf,ItSc_Waterfist,1);
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC1,1);
			if(!Npc_HasItems(hero,ItSc_HarmUndead) && !Npc_HasItems(hero,ItRu_HarmUndead))
			{
				CreateInvItems(slf,ItSc_HarmUndead,1);
			};
			if(!Npc_HasItems(hero,ItSc_ChargeFireBall) && !Npc_HasItems(hero,ItRu_ChargeFireBall))
			{
				CreateInvItems(slf,ItSc_ChargeFireBall,1);
			};
			if(!Npc_HasItems(hero,ItSc_SumGol) && !Npc_HasItems(hero,ItRu_SumGol))
			{
				CreateInvItems(slf,ItSc_SumGol,1);
			};
			if(!Npc_HasItems(hero,ItSc_LightningFlash) && !Npc_HasItems(hero,ItRu_LightningFlash))
			{
				CreateInvItems(slf,ItSc_LightningFlash,1);
			};
			if(!Npc_HasItems(hero,ItSc_FullHeal) && !Npc_HasItems(hero,ItRu_FullHeal))
			{
				CreateInvItems(slf,ItSc_FullHeal,1);
			};
			if(!Npc_HasItems(hero,ItSc_Pyrokinesis) && !Npc_HasItems(hero,ItRu_Pyrokinesis))
			{
				CreateInvItems(slf,ItSc_Pyrokinesis,1);
			};
			if(!Npc_HasItems(hero,ItSc_SumDemon) && !Npc_HasItems(hero,ItRu_SumDemon))
			{
				CreateInvItems(slf,ItSc_SumDemon,1);
			};
			if(!Npc_HasItems(hero,ItSc_ArmyOfDarkness) && !Npc_HasItems(hero,ItRu_ArmyOfDarkness))
			{
				CreateInvItems(slf,ItSc_ArmyOfDarkness,1);
			};
			if(!Npc_HasItems(hero,ItSc_BreathOfDeath) && !Npc_HasItems(hero,ItRu_BreathOfDeath))
			{
				CreateInvItems(slf,ItSc_BreathOfDeath,1);
			};
			if(!Npc_HasItems(hero,ItSc_Firerain) && !Npc_HasItems(hero,ItRu_Firerain))
			{
				CreateInvItems(slf,ItSc_Firerain,1);
			};
			if(!Npc_HasItems(hero,ItSc_Shrink) && !Npc_HasItems(hero,ItRu_Shrink))
			{
				CreateInvItems(slf,ItSc_Shrink,1);
			};
			if(!Npc_HasItems(hero,ItSc_MassDeath) && !Npc_HasItems(hero,ItRu_MassDeath))
			{
				CreateInvItems(slf,ItSc_MassDeath,1);
			};
		};
		CreateInvItems(slf,ItPo_Health_03,30);
		CreateInvItems(slf,ItPo_Mana_02,30);
		CreateInvItems(slf,ItPo_Mana_03,20);
		Vatras_DI_ItemsGiven = TRUE;
	};
};

