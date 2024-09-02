
func void B_Awake_StoneGuardian(var C_Npc slf)
{
	if(RavenIsDead == TRUE)
	{
		return;
	};
	if(Npc_IsDead(slf))
	{
		return;
	};
	if(slf.aivar[AIV_EnemyOverride] == FALSE)
	{
		return;
	};
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",slf,slf,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",slf,slf,0,0,0,FALSE);
	slf.aivar[AIV_EnemyOverride] = FALSE;
};

func int C_StoneGuardianIsAwaken(var C_Npc slf)
{
	if(!Npc_IsDead(slf))
	{
		if(slf.aivar[AIV_EnemyOverride] == FALSE)
		{
			return TRUE;
		};
	};
	return FALSE;
};

