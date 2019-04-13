
var int Cipher_ItemsGiven_Chapter_1;
var int Cipher_ItemsGiven_Chapter_2;
var int Cipher_ItemsGiven_Chapter_3;

func void B_GiveTradeInv_Cipher(var C_Npc slf)
{
	if((Kapitel >= 1) && (Cipher_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf,ItRw_Arrow,40);
//		CreateInvItems(slf,ItRw_Bow_L_02,1);
		CreateInvItems(slf,ItRw_Sld_Bow,1);
		CreateInvItems(slf,ItMw_1h_Sld_Sword,1);
		CreateInvItems(slf,ItLsTorch,8);
		if(MIS_Cipher_Paket == LOG_SUCCESS)
		{
			CreateInvItems(slf,ItMi_Joint,20);
		};
		Cipher_ItemsGiven_Chapter_1 = TRUE;
	};
	if((Kapitel >= 2) && (Cipher_ItemsGiven_Chapter_2 == FALSE))
	{
		if(MIS_Cipher_Paket == LOG_SUCCESS)
		{
			CreateInvItems(slf,ItMi_Joint,20);
		};
		Cipher_ItemsGiven_Chapter_2 = TRUE;
	};
	if((Kapitel >= 3) && (Cipher_ItemsGiven_Chapter_3 == FALSE))
	{
		if(MIS_Cipher_Paket == LOG_SUCCESS)
		{
			CreateInvItems(slf,ItMi_Joint,20);
		};
		Cipher_ItemsGiven_Chapter_3 = TRUE;
	};
};

