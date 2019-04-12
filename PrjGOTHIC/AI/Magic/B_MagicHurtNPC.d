
func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	Npc_ChangeAttribute(oth,ATR_HITPOINTS,-damage);
	if(Npc_IsDead(oth))
	{
		if((Npc_IsPlayer(slf) || (slf.aivar[AIV_PARTYMEMBER] == TRUE)) && (oth.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP(self.level * XP_PER_VICTORY);
			oth.aivar[AIV_VictoryXPGiven] = TRUE;
		};
	};
};

