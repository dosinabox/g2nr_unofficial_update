
var int Milten_DI_ItemsGiven;

func void B_GiveTradeInv_Milten_DI(var C_Npc slf)
{
	if(Milten_DI_ItemsGiven == FALSE)
	{
//		CreateInvItems(slf,ItMi_Gold,380);
		CreateInvItems(slf,ItPl_SwampHerb,13);
		CreateInvItems(slf,ItPl_Temp_Herb,9);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItMi_Aquamarine,3);
		CreateInvItems(slf,ItMi_Rockcrystal,3);
		CreateInvItems(slf,ItPl_Health_Herb_01,25);
		CreateInvItems(slf,ItPl_Health_Herb_02,14);
		CreateInvItems(slf,ItPl_Health_Herb_03,9);
		CreateInvItems(slf,ItPl_Mana_Herb_01,13);
		CreateInvItems(slf,ItPl_Mana_Herb_02,8);
		CreateInvItems(slf,ItPl_Mana_Herb_03,2);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPo_Health_02,25);
		CreateInvItems(slf,ItPo_Health_03,20);
		CreateInvItems(slf,ItPo_Mana_01,40);
		CreateInvItems(slf,ItPo_Mana_02,20);
		CreateInvItems(slf,ItPo_Speed,2);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItMi_Flask,10);
		CreateInvItems(slf,ItBe_Addon_Prot_FIRE,1);
		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(slf,ItWr_Addon_Runemaking_KDF_CIRC1,1);
			CreateInvItems(slf,ItWr_Addon_Runemaking_KDF_CIRC2,1);
			CreateInvItems(slf,ItWr_Addon_Runemaking_KDF_CIRC3,1);
			CreateInvItems(slf,ItWr_Addon_Runemaking_KDF_CIRC4,1);
			CreateInvItems(slf,ItWr_Addon_Runemaking_KDF_CIRC5,1);
			CreateInvItems(slf,ItWr_Addon_Runemaking_KDF_CIRC6,1);
		};
		Milten_DI_ItemsGiven = TRUE;
	};
};

