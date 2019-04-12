
var int Constantino_ItemsGiven_Chapter_1;
var int Constantino_ItemsGiven_Chapter_2;
var int Constantino_ItemsGiven_Chapter_3;
var int Constantino_ItemsGiven_Chapter_4;
var int Constantino_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Constantino(var C_Npc slf)
{
	if((Kapitel >= 1) && (Constantino_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,31);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,ItAt_GoblinBone,1);
		CreateInvItems(slf,ItAt_Wing,3);
		CreateInvItems(slf,ITWr_Addon_Health_04,1);
		CreateInvItems(slf,ITWr_Addon_Mana_04,1);
		CreateInvItems(slf,ItWr_Astronomy_Mis,1);
		Constantino_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Constantino_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,60);
		CreateInvItems(slf,ItMi_Flask,15);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItPl_SwampHerb,2);
		CreateInvItems(slf,ItPl_Health_Herb_01,5);
		CreateInvItems(slf,ItPl_Health_Herb_02,2);
		CreateInvItems(slf,ItPl_Mana_Herb_01,5);
		CreateInvItems(slf,ItAt_Wing,2);
		CreateInvItems(slf,ItMi_Rockcrystal,2);
		CreateInvItems(slf,ItAt_GoblinBone,2);
		CreateInvItems(slf,ItPl_Mushroom_01,5);
		Constantino_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Constantino_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,120);
		CreateInvItems(slf,ItMi_Flask,20);
		CreateInvItems(slf,ItPl_Temp_Herb,2);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_SwampHerb,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,9);
		CreateInvItems(slf,ItPl_Mana_Herb_01,12);
		CreateInvItems(slf,ItPl_Mana_Herb_02,7);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItPl_Dex_Herb_01,1);
		CreateInvItems(slf,ItPl_Blueplant,9);
		CreateInvItems(slf,ItPl_Mushroom_01,3);
		CreateInvItems(slf,ItPl_Mushroom_02,2);
		CreateInvItems(slf,ItMi_Quartz,2);
		CreateInvItems(slf,ItAt_ShadowHorn,1);
		CreateInvItems(slf,ItAt_SkeletonBone,1);
		CreateInvItems(slf,ItBe_Addon_Prot_FIRE,1);
		Constantino_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Constantino_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,220);
		CreateInvItems(slf,ItMi_Flask,25);
		CreateInvItems(slf,ItPl_Temp_Herb,3);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,16);
		CreateInvItems(slf,ItPl_Health_Herb_02,8);
		CreateInvItems(slf,ItPl_Health_Herb_03,3);
		CreateInvItems(slf,ItPl_Mana_Herb_01,7);
		CreateInvItems(slf,ItPl_Mana_Herb_02,4);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		CreateInvItems(slf,ItPl_Dex_Herb_01,2);
		CreateInvItems(slf,ItAt_GoblinBone,2);
		CreateInvItems(slf,ItAt_SkeletonBone,1);
		CreateInvItems(slf,ItAt_ShadowHorn,2);
		CreateInvItems(slf,ItAt_Wing,2);
		CreateInvItems(slf,ItAt_WolfFur,1);
		CreateInvItems(slf,ItPo_Health_01,6);
		Constantino_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Constantino_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,321);
		CreateInvItems(slf,ItMi_Flask,25);
		CreateInvItems(slf,ItPl_Temp_Herb,4);
		CreateInvItems(slf,ItPl_Perm_Herb,2);
		CreateInvItems(slf,ItPl_SwampHerb,2);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Health_Herb_01,24);
		CreateInvItems(slf,ItPl_Health_Herb_02,9);
		CreateInvItems(slf,ItPl_Health_Herb_03,6);
		CreateInvItems(slf,ItPl_Mana_Herb_01,9);
		CreateInvItems(slf,ItPl_Mana_Herb_02,6);
		CreateInvItems(slf,ItPl_Mana_Herb_03,3);
		CreateInvItems(slf,ItPl_Speed_Herb_01,2);
		Constantino_ItemsGiven_Chapter_5 = TRUE;
	};
};

