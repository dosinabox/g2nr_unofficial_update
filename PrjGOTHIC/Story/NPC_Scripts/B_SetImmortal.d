
func void B_SetImmortal(var C_Npc npc)
{
	if(C_NpcIsValidAndAlive(npc))
	{
		if(npc.attribute[ATR_HITPOINTS] == 1)
		{
			npc.attribute[ATR_HITPOINTS] += 1;
		};
		npc.flags = npc.flags | NPC_FLAG_IMMORTAL;
	};
};

func void B_SetMortal(var C_Npc npc)
{
	if(C_NpcIsValidAndAlive(npc))
	{
		npc.flags = npc.flags & ~NPC_FLAG_IMMORTAL;
	};
};

