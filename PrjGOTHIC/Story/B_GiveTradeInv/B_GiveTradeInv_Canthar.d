
var int Canthar_ItemsGiven_Chapter_1;
var int Canthar_ItemsGiven_Chapter_2;
var int Canthar_ItemsGiven_Chapter_3;
var int Canthar_ItemsGiven_Chapter_4;
var int Canthar_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Canthar(var C_Npc slf)
{
	if((Kapitel >= 0) && (Canthar_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItPl_Beet,10);
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItMi_Pan,1);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,ItMi_Saw,1);
		CreateInvItems(slf,ItMw_Nagelkeule,1);
		CreateInvItems(slf,ItMw_ShortSword5,1);
		CreateInvItems(slf,ItMw_Hellebarde,1);
		CreateInvItems(slf,ItMw_Piratensaebel,1);
		CreateInvItems(slf,ItMw_Schwert2,2);
		CreateInvItems(slf,ItAm_Prot_Mage_01,1);
		Canthar_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Canthar_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		Canthar_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Canthar_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_Spicker,1);
		CreateInvItems(slf,ItMw_Bartaxt,1);
		CreateInvItems(slf,ItMw_Zweihaender3,1);
		CreateInvItems(slf,ItMw_Rabenschnabel,1);
		CreateInvItems(slf,ItMw_Streitkolben,1);
		CreateInvItems(slf,ItMw_Krummschwert,1);
		CreateInvItems(slf,ItMw_Sturmbringer,1);
		Canthar_ItemsGiven_Chapter_3 = TRUE;
	};
	if((Kapitel >= 4) && (Canthar_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		Canthar_ItemsGiven_Chapter_4 = TRUE;
	};
	if((Kapitel >= 5) && (Canthar_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		Canthar_ItemsGiven_Chapter_5 = TRUE;
	};
};

