
func void B_TransferSarahItemsToCanthar()
{
	if(!Npc_IsDead(Sarah) && !Npc_IsDead(Canthar))
	{
		B_TransferAllInvItems(Sarah,Canthar,ItRw_Arrow);
		B_TransferAllInvItems(Sarah,Canthar,ItRi_HP_01);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_ShortSword3);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_ShortSword4);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_ShortSword5);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Kriegshammer1);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_1h_Vlk_Sword);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_1h_Nov_Mace);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_1H_Sword_L_03);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Stabkeule);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Steinbrecher);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Schwert2);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Bartaxt);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Zweihaender2);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Schwert5);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Inquisitor);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Kriegshammer2);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Zweihaender4);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Krummschwert);
		SarahWeaponsRemoved = TRUE;
	};
};

func void B_RemoveSarah()
{
	if(!Npc_IsDead(Sarah))
	{
		if(SarahWeaponsRemoved == FALSE)
		{
			B_GiveTradeInv_Sarah(Sarah);
			B_TransferSarahItemsToCanthar();
		};
		B_DeletePetzCrime(Sarah);
		B_RemoveNpc(VLK_470_Sarah);
	};
};

