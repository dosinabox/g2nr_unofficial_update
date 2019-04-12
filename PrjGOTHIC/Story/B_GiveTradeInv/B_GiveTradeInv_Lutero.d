
var int Lutero_ItemsGiven_Chapter_1;
var int Lutero_ItemsGiven_Chapter_2;
var int Lutero_ItemsGiven_Chapter_3;
var int Lutero_ItemsGiven_Chapter_4;
var int Lutero_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Lutero(var C_Npc slf)
{
	if((Kapitel >= 1) && (Lutero_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_Quartz,1);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItLsTorch,10);
		CreateInvItems(slf,ItSc_Charm,1);
		CreateInvItems(slf,ItMi_HolyWater,1);
		CreateInvItems(slf,ItMi_Sulfur,1);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItMi_Coal,1);
		CreateInvItems(slf,ItMi_ApfelTabak,1);
		CreateInvItems(slf,ItAt_CrawlerMandibles,1);
		Lutero_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Lutero_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMi_HolyWater,1);
		CreateInvItems(slf,ItSc_Sleep,1);
		CreateInvItems(slf,ItMi_Aquamarine,1);
		CreateInvItems(slf,ItMi_Quartz,1);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItLsTorch,10);
		CreateInvItems(slf,ItSc_Charm,2);
		CreateInvItems(slf,ItAt_Sting,1);
		CreateInvItems(slf,ItPo_Speed,2);
		CreateInvItems(slf,ItWr_ZweihandBuch,1);
		CreateInvItems(slf,ItWr_EinhandBuch,1);
		Lutero_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Lutero_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItMi_DarkPearl,1);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItLsTorch,10);
		CreateInvItems(slf,ItPo_Speed,3);
		CreateInvItems(slf,ItSc_Charm,3);
		CreateInvItems(slf,ItAt_CrawlerMandibles,1);
		CreateInvItems(slf,ItBe_Addon_DEX_10,1);
		CreateInvItems(slf,ItRi_Dex_Strg_01,1);
		Lutero_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Lutero_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItMi_Rockcrystal,1);
		CreateInvItems(slf,ItAt_StoneGolemHeart,1);
		CreateInvItems(slf,ItPo_Speed,1);
		CreateInvItems(slf,ItPl_Temp_Herb,1);
		CreateInvItems(slf,ItPo_Speed,4);
		CreateInvItems(slf,ItLsTorch,10);
		CreateInvItems(slf,ItSc_Charm,3);
		Lutero_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Lutero_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		CreateInvItems(slf,ItSc_ArmyOfDarkness,1);
		CreateInvItems(slf,ItAt_DemonHeart,1);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItPo_Speed,1);
		Lutero_ItemsGiven_Chapter_5 = TRUE;
	};
};

