
func void B_RemoveNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		B_ClearRuneInv(npc);
		AI_Teleport(npc,"TOT");
		B_StartOtherRoutine(npc,"TOT");
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		AI_Teleport(npc,"TOT");
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

func void B_PlayerEnteredCity()
{
	if(Canthar_InStadt == FALSE)
	{
		if(!Npc_IsDead(Canthar))
		{
			Npc_ExchangeRoutine(Canthar,"START");
		};
		if(Npc_KnowsInfo(hero,DIA_Lester_SEND_XARDAS) && (Kapitel < 3))
		{
			B_StartOtherRoutine(Lester,"XARDAS");
		};
		if(Lobart.aivar[AIV_IGNORE_Theft] == TRUE)
		{
			Lobart.aivar[AIV_IGNORE_Theft] = FALSE;
		};
		Canthar_InStadt = TRUE;
	};
};

