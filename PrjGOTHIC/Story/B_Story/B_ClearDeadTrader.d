
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
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
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

func void B_RemoveSarahWeapons()
{
	if(!Npc_IsDead(Sarah) && !Npc_IsDead(Canthar))
	{
		if(Npc_HasItems(Sarah,ItRw_Arrow))
		{
			CreateInvItems(Canthar,ItRw_Arrow,Npc_HasItems(Sarah,ItRw_Arrow));
			Npc_RemoveInvItems(Sarah,ItRw_Arrow,Npc_HasItems(Sarah,ItRw_Arrow));
		};
		if(Npc_HasItems(Sarah,ItMw_ShortSword3))
		{
			CreateInvItems(Canthar,ItMw_ShortSword3,Npc_HasItems(Sarah,ItMw_ShortSword3));
			Npc_RemoveInvItems(Sarah,ItMw_ShortSword3,Npc_HasItems(Sarah,ItMw_ShortSword3));
		};
		if(Npc_HasItems(Sarah,ItMw_ShortSword4))
		{
			CreateInvItems(Canthar,ItMw_ShortSword4,Npc_HasItems(Sarah,ItMw_ShortSword4));
			Npc_RemoveInvItems(Sarah,ItMw_ShortSword4,Npc_HasItems(Sarah,ItMw_ShortSword4));
		};
		if(Npc_HasItems(Sarah,ItMw_ShortSword5))
		{
			CreateInvItems(Canthar,ItMw_ShortSword5,Npc_HasItems(Sarah,ItMw_ShortSword5));
			Npc_RemoveInvItems(Sarah,ItMw_ShortSword5,Npc_HasItems(Sarah,ItMw_ShortSword5));
		};
		if(Npc_HasItems(Sarah,ItMw_Kriegshammer1))
		{
			CreateInvItems(Canthar,ItMw_Kriegshammer1,Npc_HasItems(Sarah,ItMw_Kriegshammer1));
			Npc_RemoveInvItems(Sarah,ItMw_Kriegshammer1,Npc_HasItems(Sarah,ItMw_Kriegshammer1));
		};
		if(Npc_HasItems(Sarah,ItMw_1h_Vlk_Sword))
		{
			CreateInvItems(Canthar,ItMw_1h_Vlk_Sword,Npc_HasItems(Sarah,ItMw_1h_Vlk_Sword));
			Npc_RemoveInvItems(Sarah,ItMw_1h_Vlk_Sword,Npc_HasItems(Sarah,ItMw_1h_Vlk_Sword));
		};
		if(Npc_HasItems(Sarah,ItMw_1h_Nov_Mace))
		{
			CreateInvItems(Canthar,ItMw_1h_Nov_Mace,Npc_HasItems(Sarah,ItMw_1h_Nov_Mace));
			Npc_RemoveInvItems(Sarah,ItMw_1h_Nov_Mace,Npc_HasItems(Sarah,ItMw_1h_Nov_Mace));
		};
		if(Npc_HasItems(Sarah,ItMw_1H_Sword_L_03))
		{
			CreateInvItems(Canthar,ItMw_1H_Sword_L_03,Npc_HasItems(Sarah,ItMw_1H_Sword_L_03));
			Npc_RemoveInvItems(Sarah,ItMw_1H_Sword_L_03,Npc_HasItems(Sarah,ItMw_1H_Sword_L_03));
		};
		if(Npc_HasItems(Sarah,ItRi_HP_01))
		{
			CreateInvItems(Canthar,ItRi_HP_01,Npc_HasItems(Sarah,ItRi_HP_01));
			Npc_RemoveInvItems(Sarah,ItRi_HP_01,Npc_HasItems(Sarah,ItRi_HP_01));
		};
		if(Npc_HasItems(Sarah,ItMw_Stabkeule))
		{
			CreateInvItems(Canthar,ItMw_Stabkeule,Npc_HasItems(Sarah,ItMw_Stabkeule));
			Npc_RemoveInvItems(Sarah,ItMw_Stabkeule,Npc_HasItems(Sarah,ItMw_Stabkeule));
		};
		if(Npc_HasItems(Sarah,ItMw_Steinbrecher))
		{
			CreateInvItems(Canthar,ItMw_Steinbrecher,Npc_HasItems(Sarah,ItMw_Steinbrecher));
			Npc_RemoveInvItems(Sarah,ItMw_Steinbrecher,Npc_HasItems(Sarah,ItMw_Steinbrecher));
		};
		if(Npc_HasItems(Sarah,ItMw_Schwert2))
		{
			CreateInvItems(Canthar,ItMw_Schwert2,Npc_HasItems(Sarah,ItMw_Schwert2));
			Npc_RemoveInvItems(Sarah,ItMw_Schwert2,Npc_HasItems(Sarah,ItMw_Schwert2));
		};
		if(Npc_HasItems(Sarah,ItMw_Bartaxt))
		{
			CreateInvItems(Canthar,ItMw_Bartaxt,Npc_HasItems(Sarah,ItMw_Bartaxt));
			Npc_RemoveInvItems(Sarah,ItMw_Bartaxt,Npc_HasItems(Sarah,ItMw_Bartaxt));
		};
		if(Npc_HasItems(Sarah,ItMw_Zweihaender2))
		{
			CreateInvItems(Canthar,ItMw_Zweihaender2,Npc_HasItems(Sarah,ItMw_Zweihaender2));
			Npc_RemoveInvItems(Sarah,ItMw_Zweihaender2,Npc_HasItems(Sarah,ItMw_Zweihaender2));
		};
		if(Npc_HasItems(Sarah,ItMw_Schwert5))
		{
			CreateInvItems(Canthar,ItMw_Schwert5,Npc_HasItems(Sarah,ItMw_Schwert5));
			Npc_RemoveInvItems(Sarah,ItMw_Schwert5,Npc_HasItems(Sarah,ItMw_Schwert5));
		};
		if(Npc_HasItems(Sarah,ItMw_Inquisitor))
		{
			CreateInvItems(Canthar,ItMw_Inquisitor,Npc_HasItems(Sarah,ItMw_Inquisitor));
			Npc_RemoveInvItems(Sarah,ItMw_Inquisitor,Npc_HasItems(Sarah,ItMw_Inquisitor));
		};
		if(Npc_HasItems(Sarah,ItMw_Kriegshammer2))
		{
			CreateInvItems(Canthar,ItMw_Kriegshammer2,Npc_HasItems(Sarah,ItMw_Kriegshammer2));
			Npc_RemoveInvItems(Sarah,ItMw_Kriegshammer2,Npc_HasItems(Sarah,ItMw_Kriegshammer2));
		};
		if(Npc_HasItems(Sarah,ItMw_Zweihaender4))
		{
			CreateInvItems(Canthar,ItMw_Zweihaender4,Npc_HasItems(Sarah,ItMw_Zweihaender4));
			Npc_RemoveInvItems(Sarah,ItMw_Zweihaender4,Npc_HasItems(Sarah,ItMw_Zweihaender4));
		};
		if(Npc_HasItems(Sarah,ItMw_Krummschwert))
		{
			CreateInvItems(Canthar,ItMw_Krummschwert,Npc_HasItems(Sarah,ItMw_Krummschwert));
			Npc_RemoveInvItems(Sarah,ItMw_Krummschwert,Npc_HasItems(Sarah,ItMw_Krummschwert));
		};
		SarahWeaponsRemoved = TRUE;
	};
};

