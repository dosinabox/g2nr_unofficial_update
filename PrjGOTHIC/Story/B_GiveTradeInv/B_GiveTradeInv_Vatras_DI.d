
var int Vatras_DI_ItemsGiven;

func void B_GiveTradeInv_Vatras_DI(var C_Npc slf)
{
	if(Vatras_DI_ItemsGiven == FALSE)
	{
		CreateInvItems(slf,ItMi_Gold,230);
		CreateInvItems(slf,ItPl_Temp_Herb,4);
		CreateInvItems(slf,ItPl_Perm_Herb,2);
		CreateInvItems(slf,ItSc_LightHeal,2);
		CreateInvItems(slf,ItSc_Zap,2);
		CreateInvItems(slf,ItSc_Icebolt,2);
		CreateInvItems(slf,ItSc_LightningFlash,1);
		CreateInvItems(slf,ItSc_TrfScavenger,1);
		CreateInvItems(slf,ItSc_IceWave,2);
		CreateInvItems(slf,ItPo_Health_03,30);
		CreateInvItems(slf,ItPo_Mana_02,30);
		CreateInvItems(slf,ItPo_Mana_03,20);
		Vatras_DI_ItemsGiven = TRUE;
	};
};

