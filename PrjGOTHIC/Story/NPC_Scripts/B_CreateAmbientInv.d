
func void B_CreateAmbientInv_VLK(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItMi_Gold,5);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Fish,1);
//		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItMi_Gold,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Flask,1);
		CreateInvItems(self,ItMi_Gold,17);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMi_Gold,17);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Gold,13);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,11);
	}
	else
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,1);
//		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItMi_Gold,12);
	};
};

func void B_CreateAmbientInv_BAU(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItFo_Milk,1);
		CreateInvItems(self,ItMi_Gold,12);
	}
	else if(InventorySet == 2)
	{
//		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Gold,10);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,17);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Gold,14);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMi_Gold,13);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItFo_Cheese,1);
//		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItMi_Gold,11);
	}
	else
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Beer,1);
	};
};

func void B_CreateAmbientInv_NOV(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItFo_Water,3);
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItFo_Fish,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Flask,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Apple,3);
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItMi_Sulfur,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItMi_Coal,1);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Bread,2);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Fish,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItPo_Mana_01,1);
	}
	else
	{
		CreateInvItems(self,ItPl_Planeberry,2);
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Cheese,1);
	};
};

func void B_CreateAmbientInv_SLD(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItMi_Gold,17);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,1);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItFo_Sausage,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItMi_Joint,2);
		CreateInvItems(self,ItMi_Gold,16);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Gold,15);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMi_Gold,11);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItMi_Gold,19);
	}
	else
	{
		CreateInvItems(self,ItPl_Mushroom_02,3);
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Gold,10);
		CreateInvItems(self,ItFoMutton,2);
	};
};

func void B_CreateAmbientInv_KDF(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,33);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Mana_02,1);
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItMi_Flask,1);
		CreateInvItems(self,ItMi_Gold,36);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItMi_Gold,30);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItPo_Health_03,1);
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Gold,36);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,1);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItPl_Mana_Herb_01,1);
		CreateInvItems(self,ItMi_Gold,39);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItMi_Gold,34);
	}
	else
	{
		CreateInvItems(self,ItPl_Mushroom_02,1);
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItMi_Gold,35);
	};
};

func void B_CreateAmbientInv_MIL(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,3);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItMi_Gold,15);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItPl_Health_Herb_01,3);
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItMi_Gold,17);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItPl_Health_Herb_01,1);
		CreateInvItems(self,ItMi_Gold,25);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItMi_Gold,30);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Booze,3);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItMi_Gold,14);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,1);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItPl_Mushroom_02,1);
		CreateInvItems(self,ItMi_Gold,26);
	}
	else
	{
		CreateInvItems(self,ItPl_Mushroom_02,1);
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItFo_Sausage,3);
		CreateInvItems(self,ItMi_Gold,25);
	};
};

func void B_CreateAmbientInv_DJG(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFo_Wine,1);
		CreateInvItems(self,ItPl_Mana_Herb_01,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItAt_WolfFur,1);
		CreateInvItems(self,ItMi_Gold,39);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Milk,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,46);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Bacon,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,1);
		CreateInvItems(self,ItAt_BugMandibles,1);
		CreateInvItems(self,ItMi_Gold,45);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItPl_SwampHerb,1);
		CreateInvItems(self,ItFo_Bacon,1);
		CreateInvItems(self,ItMi_Gold,44);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItMi_Gold,43);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPo_Health_02,1);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItFo_Wine,1);
		CreateInvItems(self,ItMi_Gold,46);
	}
	else
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItAt_SheepFur,1);
		CreateInvItems(self,ItMi_Gold,41);
	};
};

func void B_CreateAmbientInv_PAL(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFo_Wine,1);
		CreateInvItems(self,ItFo_Bacon,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItMi_Gold,20);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItFo_Milk,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPl_Mana_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,42);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Bacon,1);
		CreateInvItems(self,ItPl_Mana_Herb_01,2);
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItPl_Dex_Herb_01,1);
		CreateInvItems(self,ItMi_Gold,23);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItPl_Health_Herb_03,1);
		CreateInvItems(self,ItMi_Gold,46);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItMi_Gold,43);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPo_Health_02,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,2);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,37);
	}
	else
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItMi_Gold,40);
	};
};

func void B_CreateAmbientInv_DMT(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPo_Mana_01,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItMi_Gold,42);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Mana_02,1);
		CreateInvItems(self,ItMi_Gold,35);
		CreateInvItems(self,ItMi_Aquamarine,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItMi_Gold,23);
		CreateInvItems(self,ItPo_Mana_01,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,46);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItMi_Gold,43);
		CreateInvItems(self,ItPo_Health_02,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPo_Speed,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,37);
	}
	else
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,40);
	};
};

func void B_CreateAmbientInv_STRF(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItLsTorchburned,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_Gold,1);
		CreateInvItems(self,ItLsTorchburned,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Cheese,1);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItLsTorchburned,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItLsTorchburned,1);
	}
	else
	{
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItLsTorchburned,1);
	};
};

func void B_CreateAmbientInv_PIR(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItMi_Gold,12);
		CreateInvItems(self,ItMi_Joint,3);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_GoldRing,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Addon_Grog,2);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItMi_Gold,9);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItFo_Addon_Pfeffer_01,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItMi_Gold,23);
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
	}
	else
	{
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItFo_Bread,1);
	};
};

func void B_CreateAmbientInv_BDT(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItKe_Lockpick,2);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItMi_GoldNugget_Addon,1);
		CreateInvItems(self,ItMi_Joint,3);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_SilverRing,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItKe_Lockpick,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItMi_GoldNugget_Addon,1);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItLsTorchburned,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItMi_GoldNugget_Addon,2);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItMi_Gold,23);
		CreateInvItems(self,ItPl_Forestberry,1);
		if(!Npc_HasItems(self,ItMw_Addon_BanditTrader))
		{
			CreateInvItems(self,ItMw_Addon_BanditTrader,1);
		};
	}
	else
	{
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItKe_Lockpick,3);
	};
};

func void B_CreateAmbientInv(var C_Npc slf)
{
	var int zufall;
	zufall = Hlp_Random(7);
	if(slf.guild == GIL_VLK)
	{
		B_CreateAmbientInv_VLK(zufall);
	}
	else if(slf.guild == GIL_NOV)
	{
		B_CreateAmbientInv_NOV(zufall);
	}
	else if(slf.guild == GIL_SLD)
	{
		B_CreateAmbientInv_SLD(zufall);
	}
	else if(slf.guild == GIL_KDF)
	{
		B_CreateAmbientInv_KDF(zufall);
	}
	else if(slf.guild == GIL_MIL)
	{
		B_CreateAmbientInv_MIL(zufall);
	}
	else if(slf.guild == GIL_DJG)
	{
		B_CreateAmbientInv_DJG(zufall);
	}
	else if(slf.guild == GIL_PAL)
	{
		B_CreateAmbientInv_PAL(zufall);
	}
	else if(slf.guild == GIL_DMT)
	{
		B_CreateAmbientInv_DMT(zufall);
	}
	else if(slf.guild == GIL_STRF)
	{
		B_CreateAmbientInv_STRF(zufall);
	}
	else if(slf.guild == GIL_PIR)
	{
		B_CreateAmbientInv_PIR(zufall);
	}
	else if(slf.guild == GIL_BDT)
	{
		B_CreateAmbientInv_BDT(zufall);
	}
	else
	{
		B_CreateAmbientInv_BAU(zufall);
	};
};

func void B_SetItemToSteal(var C_Npc slf,var int dex,var int itemInstance,var int amount)
{
	slf.aivar[AIV_DexToSteal] = dex;
	slf.aivar[AIV_ItemToSteal] = itemInstance;
	slf.aivar[AIV_AmountToSteal] = amount;
};

func void B_CreateItemToSteal(var C_Npc slf,var int dex,var int itemInstance,var int amount)
{
	//TODO убрать лишние проверки к релизу 29 версии
	if((slf.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (slf.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		if(!Hlp_IsItem(ItMi_Gold,itemInstance))
		{
			if(!Npc_HasItems(slf,itemInstance))
			{
				CreateInvItems(slf,itemInstance,amount);
			};
		};
	};
	B_SetItemToSteal(slf,dex,itemInstance,amount);
};

func void B_SyncItemsToSteal()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_CreateItemToSteal(BAU_4300_Addon_Cavalorn,25,ItMi_ArrowPack,1);
		B_CreateItemToSteal(BAU_902_Gunnar,45,ItMi_Gold,70);
		B_CreateItemToSteal(BAU_903_Bodo,30,ItMi_Gold,60);
		B_CreateItemToSteal(BAU_907_Wasili,55,ItMi_Gold,90);
		B_CreateItemToSteal(BAU_908_Hodges,15,ItMi_Gold,10);
		B_CreateItemToSteal(BAU_910_Maria,60,ItMi_Gold,110);
		B_CreateItemToSteal(BAU_911_Elena,30,ItMi_Gold,35);
		B_CreateItemToSteal(BAU_912_Pepe,15,ItMi_Gold,25);
		B_CreateItemToSteal(BAU_913_Thekla,53,ItMi_Gold,60);
		B_CreateItemToSteal(BAU_930_Sekob,75,ItMi_Gold,230);
		B_CreateItemToSteal(BAU_931_Till,36,ItMi_Gold,40);
		B_CreateItemToSteal(BAU_932_Balthasar,10,ItMi_Gold,10);
		B_CreateItemToSteal(BAU_933_Rega,25,ItMi_Gold,40);
		B_CreateItemToSteal(BAU_934_Babera,20,ItMi_Gold,30);
		B_CreateItemToSteal(BAU_935_Bronko,54,ItMi_Gold,80);
		B_CreateItemToSteal(BAU_936_Rosi,30,ItMi_Gold,75);
		B_CreateItemToSteal(BAU_940_Akil,37,ItMi_Gold,30);
		B_CreateItemToSteal(BAU_941_Kati,13,ItMi_Gold,15);
		B_CreateItemToSteal(BAU_942_Randolph,58,ItMi_Gold,2);
		B_CreateItemToSteal(BAU_944_Ehnim,76,ItMi_Gold,35);
		B_CreateItemToSteal(BAU_945_Egill,45,ItMi_Gold,24);
		B_CreateItemToSteal(BAU_950_Lobart,65,ItMi_Gold,80);
		B_CreateItemToSteal(BAU_951_Hilda,26,ItMi_Gold,35);
		B_CreateItemToSteal(BAU_952_Vino,34,ItMi_Gold,60);
		B_CreateItemToSteal(BAU_954_Maleth,10,ItMi_Gold,10);
		B_CreateItemToSteal(BAU_960_Bengar,28,ItMi_Gold,50);
		B_CreateItemToSteal(BAU_961_Gaan,23,ItMi_Gold,35);
		B_CreateItemToSteal(BAU_963_Malak,43,ItMi_Gold,40);
		B_CreateItemToSteal(BAU_970_Orlan,89,ItMi_Gold,260);
		B_CreateItemToSteal(BAU_973_Rukhar,26,ItMi_Gold,30);
		B_CreateItemToSteal(BAU_980_Sagitta,103,ItMi_Gold,360);
		B_CreateItemToSteal(BAU_981_Grom,75,ItMi_Gold,40);
		B_CreateItemToSteal(BAU_982_Grimbald,85,ItMi_Gold,250);
		B_CreateItemToSteal(BAU_983_Dragomir,47,ItMi_Gold,70);
		B_CreateItemToSteal(BAU_984_Niclas,27,ItMi_Gold,20);
		B_CreateItemToSteal(BDT_1030_Morgahard,73,ItMi_Gold,45);
		B_CreateItemToSteal(BDT_1060_Dexter,96,ItMi_Gold,370);
		B_CreateItemToSteal(DJG_705_Angar_NW,47,ItMi_Gold,34);
		B_CreateItemToSteal(DJG_713_Biff_NW,92,ItMi_Gold,250);
		B_CreateItemToSteal(KDF_500_Pyrokar,108,ItMi_Gold,550);
		B_CreateItemToSteal(KDF_501_Serpentes,86,ItMi_Gold,380);
		B_CreateItemToSteal(KDF_502_Ulthar,74,ItMi_Gold,320);
		B_CreateItemToSteal(KDF_503_Karras,49,ItMi_Gold,35);
		B_CreateItemToSteal(KDF_505_Marduk,36,ItMi_Gold,40);
		B_CreateItemToSteal(KDF_506_Neoras,72,ItMi_Gold,140);
		B_CreateItemToSteal(KDF_507_Talamon,87,ItMi_Gold,140);
		B_CreateItemToSteal(KDF_508_Gorax,80,ItKe_KlosterSchatz,1);
		B_CreateItemToSteal(KDF_509_Isgaroth,48,ItMi_Gold,50);
		B_CreateItemToSteal(KDF_510_Hyglas,73,ItMi_Gold,200);
		B_CreateItemToSteal(KDF_511_Daron,47,ItMi_Gold,80);
		B_CreateItemToSteal(MIL_312_Wulfgar,58,ItMi_Gold,80);
		B_CreateItemToSteal(MIL_314_Mortis,38,ItMi_Gold,60);
		B_CreateItemToSteal(MIL_316_Wambo,50,ItKe_City_Tower_04,1);
		B_CreateItemToSteal(MIL_317_Ruga,40,ItKe_City_Tower_03,1);
		B_CreateItemToSteal(MIL_319_Pablo,20,ItKe_City_Tower_01,1);
		B_CreateItemToSteal(MIL_321_Rangar,30,ItKe_City_Tower_02,1);
		B_CreateItemToSteal(MIL_324_Peck,60,ItKe_City_Tower_05,1);
		B_CreateItemToSteal(MIL_328_Miliz,35,ItKe_Storage,1);
		B_CreateItemToSteal(MIL_335_Rumbold,24,ItMi_Gold,45);
		B_CreateItemToSteal(MIL_336_Rick,10,ItMi_Gold,45);
		B_CreateItemToSteal(MIL_337_Mika,65,ItMi_Gold,75);
		B_CreateItemToSteal(MIL_350_Addon_Martin,65,ItMi_Gold,77);
		B_CreateItemToSteal(NONE_101_Mario,71,ItMi_Gold,220);
		B_CreateItemToSteal(NOV_600_Pedro,45,ItMi_Gold,60);
		B_CreateItemToSteal(NOV_601_Igaraz,40,ItKe_IgarazChest_Mis,1);
		B_CreateItemToSteal(NOV_602_Ulf,34,ItMi_Gold,50);
		B_CreateItemToSteal(NOV_603_Agon,23,ItMi_Gold,12);
		B_CreateItemToSteal(NOV_604_Dyrian,10,ItMi_Gold,15);
		B_CreateItemToSteal(NOV_605_Opolos,54,ItMi_Gold,70);
		B_CreateItemToSteal(NOV_608_Garwig,52,ItMi_Gold,80);
		B_CreateItemToSteal(NOV_612_Babo,17,ItMi_Gold,25);
		B_CreateItemToSteal(PAL_201_Ingmar,105,ItWr_Manowar,1);
		B_CreateItemToSteal(PAL_202_Albrecht,41,ItMi_Gold,160);
		B_CreateItemToSteal(PAL_203_Lothar,56,ItMi_Gold,95);
		B_CreateItemToSteal(PAL_207_Girion,73,ItMi_Gold,280);
		B_CreateItemToSteal(PAL_216_Cedric,37,ItMi_Gold,55);
		B_CreateItemToSteal(PAL_299_Sergio,78,ItMi_Gold,85);
		B_CreateItemToSteal(PC_Fighter_DJG,10,ItMi_Gold,35);
		B_CreateItemToSteal(PC_Fighter_NW_nach_DJG,10,ItMi_Gold,25);
		B_CreateItemToSteal(PC_Mage_NW,56,ItMi_Gold,75);
		B_CreateItemToSteal(PC_Psionic,76,ItMi_Gold,20);
		B_CreateItemToSteal(PC_Thief_NW,120,ItMi_Gold,600);
		B_CreateItemToSteal(SLD_801_Torlof,76,ItMi_Gold,120);
		B_CreateItemToSteal(SLD_802_Buster,34,ItMi_Gold,60);
		B_CreateItemToSteal(SLD_803_Cipher,65,ItMi_Gold,65);
		B_CreateItemToSteal(SLD_804_Rod,15,ItMi_Gold,35);
		B_CreateItemToSteal(SLD_805_Cord,65,ItMi_Gold,75);
		B_CreateItemToSteal(SLD_806_Sylvio,80,ItMi_Gold,120);
		B_CreateItemToSteal(SLD_807_Bullco,56,ItMi_Gold,35);
		B_CreateItemToSteal(SLD_808_Jarvis,41,ItMi_Gold,55);
		B_CreateItemToSteal(SLD_809_Bennet,35,ItMi_Gold,45);
		B_CreateItemToSteal(SLD_810_Dar,67,ItMi_Gold,35);
		B_CreateItemToSteal(SLD_811_Wolf,32,ItMi_Gold,35);
		B_CreateItemToSteal(SLD_814_Sentenza,56,ItMi_SilverRing,1);
		B_CreateItemToSteal(SLD_816_Fester,27,ItMi_Gold,45);
		B_CreateItemToSteal(SLD_822_Raoul,45,ItMi_Gold,85);
		B_CreateItemToSteal(SLD_823_Khaled,78,ItMi_Gold,85);
		B_CreateItemToSteal(SLD_840_Alvares,20,ItMi_Gold,15);
		B_CreateItemToSteal(SLD_841_Engardo,34,ItMi_Gold,45);
		B_CreateItemToSteal(STRF_1123_Addon_Patrick_NW,35,ItMi_Gold,50);
		B_CreateItemToSteal(STRF_1124_Addon_Monty_NW,60,ItMi_Gold,60);
		B_CreateItemToSteal(STRF_1125_Addon_Tonak_NW,80,ItMi_Gold,160);
		B_CreateItemToSteal(STRF_1126_Addon_Telbor_NW,60,ItMi_Gold,55);
		B_CreateItemToSteal(STRF_1127_Addon_Pardos_NW,85,ItMi_Gold,10);
		B_CreateItemToSteal(VLK_400_Larius,35,ItMi_Gold,120);
		B_CreateItemToSteal(VLK_402_Richter,30,ItKe_Richter,1);
		B_CreateItemToSteal(VLK_403_Gerbrandt,30,ItSe_GoldPocket100,1);
		B_CreateItemToSteal(VLK_404_Lutero,58,ItMi_Gold,65);
		B_CreateItemToSteal(VLK_405_Fernando,50,ItSe_GoldPocket100,1);
		B_CreateItemToSteal(VLK_407_Hakon,45,ItMi_Gold,65);
		B_CreateItemToSteal(VLK_408_Jora,31,ItMi_Gold,45);
		B_CreateItemToSteal(VLK_410_Baltram,76,ItMi_Gold,175);
		B_CreateItemToSteal(VLK_411_Gaertner,40,ItMi_Gold,50);
		B_CreateItemToSteal(VLK_412_Harad,14,ItMi_Gold,35);
		B_CreateItemToSteal(VLK_413_Bosper,67,ItMi_Gold,120);
		B_CreateItemToSteal(VLK_414_Hanna,45,ItMi_Gold,25);
		B_CreateItemToSteal(VLK_415_Meldor,34,ItMi_Gold,55);
		B_CreateItemToSteal(VLK_416_Matteo,80,ItMi_Gold,150);
		B_CreateItemToSteal(VLK_417_Constantino,59,ItMi_Gold,90);
		B_CreateItemToSteal(VLK_418_Gritta,20,ItMi_Gold,20);
		B_CreateItemToSteal(VLK_420_Coragon,40,ItMi_Gold,45);
		B_CreateItemToSteal(VLK_4201_Wirt,60,ItMi_Gold,65);
		B_CreateItemToSteal(VLK_421_Valentino,30,ItKe_Valentino,1);
		B_CreateItemToSteal(VLK_422_Salandril,30,ItKe_Salandril,1);
		B_CreateItemToSteal(VLK_424_Alwin,20,ItMi_Gold,10);
		B_CreateItemToSteal(VLK_425_Regis,40,ItMi_Gold,35);
		B_CreateItemToSteal(VLK_4250_Jorgen,59,ItMi_Gold,70);
		B_CreateItemToSteal(VLK_4301_Addon_Farim,20,ItMi_Gold,11);
		B_CreateItemToSteal(VLK_4302_Addon_Elvrich,62,ItMi_Gold,110);
		B_CreateItemToSteal(VLK_4303_Addon_Erol,43,ItMi_Gold,42);
		B_CreateItemToSteal(VLK_431_Kardif,55,ItMi_Gold,85);
		B_CreateItemToSteal(VLK_432_Moe,25,ItMi_Gold,30);
		B_CreateItemToSteal(VLK_433_Bromor,50,ItKe_Bromor,1);
		B_CreateItemToSteal(VLK_434_Borka,80,ItMi_Gold,120);
		B_CreateItemToSteal(VLK_435_Nadja,40,ItMi_Gold,40);
		B_CreateItemToSteal(VLK_436_Sonja,58,ItMi_Gold,70);
		B_CreateItemToSteal(VLK_437_Brahim,15,ItMi_Gold,15);
		B_CreateItemToSteal(VLK_438_Alrik,55,ItMi_Gold,50);
		B_CreateItemToSteal(VLK_439_Vatras,91,ItMi_Gold,250);
		B_CreateItemToSteal(VLK_440_Bartok,30,ItMi_ArrowPack,1);
		B_CreateItemToSteal(VLK_441_Garvell,10,ItSe_GoldPocket25,1);
		B_CreateItemToSteal(VLK_444_Jack,50,ItMi_Gold,100);
		B_CreateItemToSteal(VLK_445_Ramirez,90,ItMi_Gold,300);
		B_CreateItemToSteal(VLK_446_Jesper,80,ItMi_Gold,180);
		B_CreateItemToSteal(VLK_447_Cassia,100,ItMi_Gold,400);
		B_CreateItemToSteal(VLK_448_Joe,25,ItMi_Gold,25);
		B_CreateItemToSteal(VLK_449_Lares,95,ItMi_Gold,350);
		B_CreateItemToSteal(VLK_456_Abuyin,75,ItMi_Gold,200);
		B_CreateItemToSteal(VLK_457_Brian,55,ItMi_Gold,100);
		B_CreateItemToSteal(VLK_458_Rupert,18,ItMi_Gold,10);
		B_CreateItemToSteal(VLK_461_Carl,34,ItMi_Gold,40);
		B_CreateItemToSteal(VLK_462_Thorben,30,ItMi_Gold,28);
		B_CreateItemToSteal(VLK_468_Canthar,20,ItMi_Gold,25);
		B_CreateItemToSteal(VLK_469_Halvor,78,ItMi_Gold,150);
		B_CreateItemToSteal(VLK_470_Sarah,57,ItMi_Gold,60);
		B_CreateItemToSteal(VLK_476_Fenia,50,ItMi_Gold,75);
		B_CreateItemToSteal(VLK_480_Fellan,40,ItMi_Gold,40);
		B_CreateItemToSteal(VLK_484_Lehmar,20,ItWr_Schuldenbuch,1);
		B_CreateItemToSteal(VLK_491_Vanja,20,ItMi_Gold,10);
		B_CreateItemToSteal(VLK_492_Rengaru,20,ItMi_SilverRing,1);
		B_CreateItemToSteal(VLK_493_Nagur,75,ItMi_Gold,150);
		B_CreateItemToSteal(VLK_494_Attila,55,ItMi_Gold,100);
		B_CreateItemToSteal(VLK_498_Ignaz,38,ItMi_Gold,50);
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		B_CreateItemToSteal(DJG_700_Sylvio,78,ItMi_Gold,560);
		B_CreateItemToSteal(DJG_701_Bullco,34,ItMi_Gold,65);
		B_CreateItemToSteal(DJG_702_Rod,16,ItMi_Gold,320);
		B_CreateItemToSteal(DJG_703_Cipher,79,ItMi_Gold,220);
		B_CreateItemToSteal(DJG_705_Angar,47,ItMi_Gold,55);
		B_CreateItemToSteal(DJG_708_Kurgan,34,ItMi_Gold,120);
		B_CreateItemToSteal(DJG_709_Rethon,78,ItMi_Gold,230);
		B_CreateItemToSteal(DJG_710_Kjorn,47,ItMi_Gold,75);
		B_CreateItemToSteal(DJG_711_Godar,16,ItMi_Gold,160);
		B_CreateItemToSteal(DJG_712_Hokurn,69,ItMi_Gold,210);
		B_CreateItemToSteal(DJG_713_Biff,92,ItMi_Gold,320);
		B_CreateItemToSteal(DJG_714_Jan,37,ItMi_Gold,95);
		B_CreateItemToSteal(DJG_715_Ferros,56,ItMi_Gold,75);
		B_CreateItemToSteal(PAL_217_Marcos,65,ItMi_Gold,380);
		B_CreateItemToSteal(PAL_251_Oric,85,ItSc_PalRepelEvil,1);
		B_CreateItemToSteal(PAL_252_Parcival,84,ItMi_Gold,460);
		B_CreateItemToSteal(PAL_258_Keroloth,25,ItMi_Gold,45);
		B_CreateItemToSteal(PAL_260_Tandor,47,ItMi_Gold,90);
		B_CreateItemToSteal(PAL_261_Gerold,71,ItMi_Gold,170);
		B_CreateItemToSteal(PAL_264_Ritter,70,ItKe_OC_Store,1);
		B_CreateItemToSteal(PAL_267_Sengrath,32,ItMi_Gold,35);
		B_CreateItemToSteal(PAL_268_Udar,20,ItMi_Gold,15);
		B_CreateItemToSteal(PAL_280_Tengron,32,ItMi_Gold,50);
		B_CreateItemToSteal(PAL_281_Fajeth,56,ItMi_Gold,95);
		B_CreateItemToSteal(PC_Mage_OW,80,ItPo_Perm_Mana,1);
		B_CreateItemToSteal(PC_ThiefOW,120,ItMi_Gold,600);
		B_CreateItemToSteal(STRF_1106_Fed,32,ItMi_Gold,8);
		B_CreateItemToSteal(STRF_1115_Geppert,56,ItMi_Gold,5);
		B_CreateItemToSteal(STRF_1116_Kervo,34,ItMi_Gold,10);
		B_CreateItemToSteal(VLK_4100_Brutus,14,ItMi_Gold,35);
		B_CreateItemToSteal(VLK_4106_Dobar,79,ItMi_Nugget,1);
		B_CreateItemToSteal(VLK_4107_Parlaf,34,ItMi_Gold,12);
		B_CreateItemToSteal(VLK_4108_Engor,40,ItWr_Map_OldWorld,1);
		B_CreateItemToSteal(VLK_4110_Jergan,84,ItMi_Gold,110);
		B_CreateItemToSteal(VLK_4111_Grimes,43,ItMi_Gold,21);
		B_CreateItemToSteal(VLK_4120_Bilgot,20,ItMi_Gold,30);
		B_CreateItemToSteal(VLK_4130_Talbin,40,ItMi_Gold,25);
		B_CreateItemToSteal(VLK_4131_Engrom,10,ItMi_Gold,5);
		B_CreateItemToSteal(VLK_4148_Gestath,81,ItMi_Gold,350);
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		B_CreateItemToSteal(DJG_705_Angar_DI,47,ItMi_Gold,45);
		B_CreateItemToSteal(DJG_713_Biff_DI,92,ItMi_Gold,450);
		B_CreateItemToSteal(NONE_101_Mario_DI,71,ItMi_Gold,110);
		B_CreateItemToSteal(PAL_207_Girion_DI,71,ItMi_Gold,260);
		B_CreateItemToSteal(PC_Fighter_DI,10,ItMi_Gold,45);
		B_CreateItemToSteal(PC_Mage_DI,45,ItMi_Gold,120);
		B_CreateItemToSteal(PC_Psionic_DI,56,ItMi_Gold,25);
		B_CreateItemToSteal(PC_Thief_DI,120,ItMi_Gold,600);
		B_CreateItemToSteal(SLD_800_Lee_DI,110,ItMi_Gold,570);
		B_CreateItemToSteal(SLD_801_Torlof_DI,76,ItMi_Gold,120);
		B_CreateItemToSteal(SLD_809_Bennet_DI,35,ItMi_Gold,65);
		B_CreateItemToSteal(SLD_811_Wolf_DI,32,ItMi_Gold,45);
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		B_CreateItemToSteal(BDT_10004_Addon_Finn,35,ItMi_Gold,50);
		B_CreateItemToSteal(BDT_10005_Addon_Wache_02,38,ItMi_Gold,101);
		B_CreateItemToSteal(BDT_10008_Addon_Bandit,55,ItMi_Gold,99);
		B_CreateItemToSteal(BDT_10014_Addon_Thorus,60,ItKe_Addon_Thorus,1);
		B_CreateItemToSteal(BDT_10015_Addon_Emilio,76,ItMi_Gold,112);
		B_CreateItemToSteal(BDT_10017_Addon_Juan,65,ItMi_Gold,73);
		B_CreateItemToSteal(BDT_10022_Addon_Miguel,40,ItMi_Gold,48);
		B_CreateItemToSteal(BDT_10024_Addon_Garaz,80,ItMi_Gold,80);
		B_CreateItemToSteal(BDT_1070_Addon_Paul,22,ItMi_Gold,19);
		B_CreateItemToSteal(BDT_1072_Addon_Logan,59,ItMi_Gold,50);
		B_CreateItemToSteal(BDT_1073_Addon_Sancho,50,ItMi_Gold,40);
		B_CreateItemToSteal(BDT_1074_Addon_Edgor,10,ItMi_Gold,7);
		B_CreateItemToSteal(BDT_1075_Addon_Fortuno,10,ItMi_Gold,25);
		B_CreateItemToSteal(BDT_1079_Addon_Carlos,71,ItMi_Gold,85);
		B_CreateItemToSteal(BDT_1080_Addon_Tom,40,ItMi_Gold,52);
		B_CreateItemToSteal(BDT_1081_Addon_Wache_01,38,ItMi_Gold,99);
		B_CreateItemToSteal(BDT_1082_Addon_Skinner,100,ItMi_Gold,200);
		B_CreateItemToSteal(BDT_1083_Addon_Esteban,105,ItMi_Gold,500);
		B_CreateItemToSteal(BDT_1084_Addon_Senyan,45,ItMi_Gold,88);
		B_CreateItemToSteal(BDT_1085_Addon_Bloodwyn,90,ItMi_Gold,250);
		B_CreateItemToSteal(BDT_1086_Addon_Scatty,60,ItMi_Gold,90);
		B_CreateItemToSteal(BDT_1091_Addon_Lucia,80,ItMi_Gold,100);
		B_CreateItemToSteal(BDT_1093_Addon_Franco,60,ItAm_Addon_Franco,1);
		B_CreateItemToSteal(BDT_1095_Addon_Crimson,66,ItMi_Gold,66);
		B_CreateItemToSteal(BDT_1096_Addon_Lennar,65,ItMi_Gold,100);
		B_CreateItemToSteal(BDT_1097_Addon_Fisk,118,ItMi_Gold,300);
		B_CreateItemToSteal(BDT_1098_Addon_Snaf,49,ItMi_Gold,56);
		B_CreateItemToSteal(BDT_1099_Addon_Huno,85,ItMi_Gold,102);
		B_CreateItemToSteal(PIR_1320_Addon_Greg,111,ItMi_Gold,666);
		B_CreateItemToSteal(PIR_1350_Addon_Francis,40,ItKe_Greg_Addon_MIS,1);
		B_CreateItemToSteal(PIR_1352_Addon_AlligatorJack,100,ItMi_Gold,333);
		B_CreateItemToSteal(PIR_1353_Addon_Morgan,20,ItMi_Gold,43);
		B_CreateItemToSteal(PIR_1354_Addon_Henry,40,ItMi_Gold,60);
		B_CreateItemToSteal(PIR_1355_Addon_Skip,20,ItMi_Gold,43);
		B_CreateItemToSteal(PIR_1356_Addon_Bill,80,ItMi_Gold,205);
		B_CreateItemToSteal(PIR_1357_Addon_Garett,36,ItMi_Gold,55);
		B_CreateItemToSteal(PIR_1362_Addon_Bones,75,ItMi_Gold,104);
		B_CreateItemToSteal(PIR_1365_Addon_Matt,55,ItMi_Gold,91);
		B_CreateItemToSteal(PIR_1367_Addon_Owen,20,ItMi_Gold,30);
		B_CreateItemToSteal(PIR_1368_Addon_Malcom,20,ItMi_Gold,30);
	};
};

