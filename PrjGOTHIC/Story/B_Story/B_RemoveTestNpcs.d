
func void B_RemoveTestNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc))
	{
		if(!Npc_IsPlayer(npc))
		{
			Wld_RemoveNpc(npcInstance);
		};
	};
};

func void B_RemoveTestNpcs()
{
	B_RemoveTestNpc(CH);
	B_RemoveTestNpc(SH);
	B_RemoveTestNpc(PC_Rockefeller);
	B_RemoveTestNpc(PC_Itemfeller);
	B_RemoveTestNpc(Itemhoshi);
	B_RemoveTestNpc(PC_L10);
	B_RemoveTestNpc(PC_L20);
	B_RemoveTestNpc(PC_L40);
	B_RemoveTestNpc(PC_L60);
};

