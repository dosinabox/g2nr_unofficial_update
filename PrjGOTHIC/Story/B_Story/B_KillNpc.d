
func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		B_ClearRuneInv(npc);
		CreateInvItem(npc,ItMi_OldCoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		if((npc.guild == GIL_PAL) && (RandomGoblinBerries == FALSE))
		{
			Npc_RemoveInvItems(npc,ItPl_Dex_Herb_01,Npc_HasItems(npc,ItPl_Dex_Herb_01));
		};
	};
};

func void B_Check_Version()
{
	if(FIX_VERSION_SAVE < LEAST_SUPPORTED)
	{
		PrintScreen(PRINT_OldSave1,50,50,FONT_ScreenSmall,10);
		PrintScreen(PRINT_OldSave2,50,53,FONT_ScreenSmall,10);
		AI_Wait(hero,10);
	};
};

func string B_Check_Dist(var C_NPC slf, var string wp)
{
	return IntToString(Npc_GetDistToWP(slf,wp));
};

func int C_WorldIsFixed(var int world)
{
	if(world == NEWWORLD_ZEN)
	{
		if(Mob_HasItems("KVI_SECRET_DEV_CHEST",ItPl_Mushroom_01))
		{
			return TRUE;
		};
	}
	else if(world == OLDWORLD_ZEN)
	{
		if(Mob_HasItems("D36_SECRET_WASTELAND_CHEST",ItPl_Mushroom_02))
		{
			return TRUE;
		};
	};
	return FALSE;
};

