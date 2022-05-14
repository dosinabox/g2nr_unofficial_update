
func void B_ClearDeadTrader(var C_Npc Trader)
{
	Npc_ClearInventory(Trader);
	if(Trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(Trader);
	};
	Trader.aivar[AIV_ChapterInv] = Kapitel - 1;
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

func void B_MoveSarahItemToCanthar(var int itm)
{
	var int count;
	count = Npc_HasItems(Sarah,itm);
	if(count > 0)
	{
		Npc_RemoveInvItems(Sarah,itm,count);
		CreateInvItems(Canthar,itm,count);
	};
};

func void B_RemoveSarahWeapons()
{
	if(!Npc_IsDead(Sarah) && !Npc_IsDead(Canthar))
	{
		B_MoveSarahItemToCanthar(ItRw_Arrow);
		B_MoveSarahItemToCanthar(ItMw_ShortSword3);
		B_MoveSarahItemToCanthar(ItMw_ShortSword4);
		B_MoveSarahItemToCanthar(ItMw_ShortSword5);
		B_MoveSarahItemToCanthar(ItMw_Kriegshammer1);
		B_MoveSarahItemToCanthar(ItMw_1h_Vlk_Sword);
		B_MoveSarahItemToCanthar(ItMw_1h_Nov_Mace);
		B_MoveSarahItemToCanthar(ItMw_1H_Sword_L_03);
		B_MoveSarahItemToCanthar(ItRi_HP_01);
		B_MoveSarahItemToCanthar(ItMw_Stabkeule);
		B_MoveSarahItemToCanthar(ItMw_Steinbrecher);
		B_MoveSarahItemToCanthar(ItMw_Schwert2);
		B_MoveSarahItemToCanthar(ItMw_Bartaxt);
		B_MoveSarahItemToCanthar(ItMw_Zweihaender2);
		B_MoveSarahItemToCanthar(ItMw_Schwert5);
		B_MoveSarahItemToCanthar(ItMw_Inquisitor);
		B_MoveSarahItemToCanthar(ItMw_Kriegshammer2);
		B_MoveSarahItemToCanthar(ItMw_Zweihaender4);
		B_MoveSarahItemToCanthar(ItMw_Krummschwert);
		SarahWeaponsRemoved = TRUE;
	};
};

