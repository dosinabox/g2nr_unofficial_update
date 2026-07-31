
var int Hodges_ItemsGiven_Chapter_1;

func void B_GiveTradeInv_Hodges(var C_Npc slf)
{
	if((Kapitel >= 1) && (Hodges_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItMw_1H_Mace_L_04,1);
		CreateInvItems(slf,ItMw_1H_SLD_Axe,1);
		CreateInvItems(slf,ItMw_1H_SLD_Sword,1);
		CreateInvItems(slf,ItMw_1H_Sword_L_03,1);
		if(ClassicMeleeWeaponsTraders == FALSE)
		{
			CreateInvItems(slf,ItMw_BattleSense,1);
			CreateInvItems(slf,ItMw_ShortSword2,1);
			CreateInvItems(slf,ItMw_Nagelknueppel,1);
		}
		else
		{
			CreateInvItems(slf,ItMw_1H_BAU_Axe,1);
			CreateInvItems(slf,ItMw_1H_VLK_Axe,1);
			CreateInvItems(slf,ItMw_Schwert,1);
		};
		Hodges_ItemsGiven_Chapter_1 = TRUE;
	};
};

