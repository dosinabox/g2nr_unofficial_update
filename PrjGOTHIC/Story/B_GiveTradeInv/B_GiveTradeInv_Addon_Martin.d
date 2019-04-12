
var int Martin_ItemsGiven_Chapter_1;
var int Martin_ItemsGiven_Chapter_2;
var int Martin_ItemsGiven_Chapter_3;
var int Martin_ItemsGiven_Chapter_4;
var int Martin_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Addon_Martin(var C_Npc slf)
{
	if((Kapitel >= 1) && (Martin_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItSc_PalHolyBolt,2);
		CreateInvItems(slf,ItSc_PalMediumHeal,1);
		CreateInvItems(slf,ItSc_PalLight,10);
		CreateInvItems(slf,ItMi_Moleratlubric_MIS,1);
		CreateInvItems(slf,ItMw_ShortSword1,3);
		CreateInvItems(slf,ItMw_Schwert2,2);
		CreateInvItems(slf,ItMW_Addon_Hacker_1h_01,1);
		CreateInvItems(slf,ItMW_Addon_Hacker_2h_01,1);
		CreateInvItems(slf,ItMw_Meisterdegen,1);
		CreateInvItems(slf,ItMw_ShortSword5,1);
		CreateInvItems(slf,ItMw_Schwert4,1);
		CreateInvItems(slf,ItMw_Runenschwert,1);
		CreateInvItems(slf,ItRi_Mana_01,1);
		Martin_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Martin_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItSc_PalHolyBolt,2);
		CreateInvItems(slf,ItSc_PalMediumHeal,1);
		CreateInvItems(slf,ItSc_PalRepelEvil,1);
		CreateInvItems(slf,ItSc_PalFullHeal,1);
		Martin_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Martin_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItSc_PalHolyBolt,2);
		CreateInvItems(slf,ItSc_PalMediumHeal,1);
		CreateInvItems(slf,ItSc_PalRepelEvil,1);
		CreateInvItems(slf,ItSc_PalFullHeal,2);
		Martin_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Martin_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItSc_PalHolyBolt,2);
		CreateInvItems(slf,ItSc_PalMediumHeal,1);
		CreateInvItems(slf,ItMi_Nugget,1);
		CreateInvItems(slf,ItSc_PalDestroyEvil,1);
		CreateInvItems(slf,ItSc_PalRepelEvil,2);
		CreateInvItems(slf,ItSc_PalFullHeal,3);
		Martin_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Martin_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItSc_PalHolyBolt,2);
		CreateInvItems(slf,ItSc_PalMediumHeal,1);
		CreateInvItems(slf,ItSc_PalDestroyEvil,2);
		CreateInvItems(slf,ItSc_PalRepelEvil,3);
		CreateInvItems(slf,ItSc_PalFullHeal,2);
		Martin_ItemsGiven_Chapter_5 = TRUE;
	};
};

