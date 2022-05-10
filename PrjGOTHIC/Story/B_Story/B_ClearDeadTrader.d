
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
		Npc_RemoveInvItems(slf,ItMi_Stomper,Npc_HasItems(slf,ItMi_Stomper));
		Npc_RemoveInvItems(slf,ItMi_Hammer,Npc_HasItems(slf,ItMi_Hammer));
		Npc_RemoveInvItems(slf,ItMi_Scoop,Npc_HasItems(slf,ItMi_Scoop));
		Npc_RemoveInvItems(slf,ItMi_Saw,Npc_HasItems(slf,ItMi_Saw));
		Npc_RemoveInvItems(slf,ItMi_Rake,Npc_HasItems(slf,ItMi_Rake));
		Npc_RemoveInvItems(slf,ItMi_Broom,Npc_HasItems(slf,ItMi_Broom));
		Npc_RemoveInvItems(slf,ItMi_Lute,Npc_HasItems(slf,ItMi_Lute));
		Npc_RemoveInvItems(slf,ItMi_IEHarfe,Npc_HasItems(slf,ItMi_IEHarfe));
		Npc_RemoveInvItems(slf,ItMi_Brush,Npc_HasItems(slf,ItMi_Brush));
		Npc_RemoveInvItems(slf,ItMw_TrainSword,Npc_HasItems(slf,ItMw_TrainSword));
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

