
var int Rethon_ItemsGiven_Chapter_4;

func void B_GiveTradeInv_Rethon(var C_Npc slf)
{
	if((Kapitel >= 4) && (Rethon_ItemsGiven_Chapter_4 == FALSE))
	{
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			CreateInvItems(slf,ItMw_Inquisitor,1);
			CreateInvItems(slf,ItMw_Streitaxt2,1);
			CreateInvItems(slf,ItMw_Kriegshammer2,1);
			CreateInvItems(slf,ItMw_Orkschlaechter,1);
			CreateInvItems(slf,ItMw_Folteraxt,1);
			CreateInvItems(slf,ItMw_Krummschwert,1);
			CreateInvItems(slf,ItMw_Warrioraxt,1);
			CreateInvItems(slf,ItMw_2H_Hammer_02,1);
		}
		else
		{
			CreateInvItems(slf,ItMw_Inquisitor,1);
			CreateInvItems(slf,ItMw_Streitaxt2,1);
			CreateInvItems(slf,ItMw_Kriegshammer2,1);
			CreateInvItems(slf,ItMw_Orkschlaechter,1);
			CreateInvItems(slf,ItMw_Folteraxt,1);
			CreateInvItems(slf,ItMw_Krummschwert,1);
			CreateInvItems(slf,ItMw_Barbarenstreitaxt,1);
			CreateInvItems(slf,ItMw_Berserkeraxt,1);
			CreateInvItems(slf,ItMw_1h_Sld_Sword,1);
		};
		Rethon_ItemsGiven_Chapter_4 = TRUE;
	};
};

