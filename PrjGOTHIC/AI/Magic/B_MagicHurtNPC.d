
func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	if(((oth.flags != NPC_FLAG_IMMORTAL) || (oth.protection[PROT_MAGIC] != IMMUNE)) && (oth.protection[PROT_MAGIC] < damage))
	{
		Npc_ChangeAttribute(oth,ATR_HITPOINTS,-(damage - oth.protection[PROT_MAGIC]));
	};
	if(Npc_IsDead(oth))
	{
		B_GiveDeathXP(slf,oth);
	};
};

func void B_FireHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	if(((oth.flags != NPC_FLAG_IMMORTAL) || (oth.protection[PROT_FIRE] != IMMUNE)) && (oth.protection[PROT_FIRE] < damage))
	{
		Npc_ChangeAttribute(oth,ATR_HITPOINTS,-(damage - oth.protection[PROT_FIRE]));
	};
	if(Npc_IsDead(oth))
	{
		B_GiveDeathXP(slf,oth);
	};
};

