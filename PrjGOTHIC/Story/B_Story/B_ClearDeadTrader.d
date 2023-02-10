
func void B_ClearDeadTrader(var C_Npc trader)
{
	Npc_ClearInventory(trader);
	if(trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(trader);
	};
	trader.aivar[AIV_ChapterInv] = Kapitel - 1;
};

func void B_ClearInfiniteTools(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		B_RemoveEveryInvItem(slf,ItMi_Stomper);
		B_RemoveEveryInvItem(slf,ItMi_Hammer);
		B_RemoveEveryInvItem(slf,ItMi_Scoop);
		B_RemoveEveryInvItem(slf,ItMi_Saw);
		B_RemoveEveryInvItem(slf,ItMi_Rake);
		B_RemoveEveryInvItem(slf,ItMi_Broom);
		B_RemoveEveryInvItem(slf,ItMi_Lute);
		B_RemoveEveryInvItem(slf,ItMi_IEHarfe);
		B_RemoveEveryInvItem(slf,ItMi_Brush);
		B_RemoveEveryInvItem(slf,ItMw_TrainSword);
	};
};

func void B_RemoveSarahWeapons()
{
	if(!Npc_IsDead(Sarah) && !Npc_IsDead(Canthar))
	{
		B_TransferAllInvItems(Sarah,Canthar,ItRw_Arrow);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_ShortSword3);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_ShortSword4);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_ShortSword5);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_Kriegshammer1);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_1h_Vlk_Sword);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_1h_Nov_Mace);
		B_TransferAllInvItems(Sarah,Canthar,ItMw_1H_Sword_L_03);
		B_TransferAllInvItems(Sarah,Canthar,ItRi_HP_01);
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

