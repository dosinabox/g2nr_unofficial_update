
func void B_SelectWeapon(var C_Npc slf,var C_Npc oth)
{
	if(Npc_IsDead(slf))
	{
		return;
	};
	if(C_BodyStateContains(slf,BS_FALL))
	{
		return;
	};
	if(C_NpcIsSwimming(slf))
	{
		return;
	};
	if(B_SelectSpell(slf,oth))
	{
		return;
	};
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		if(!Npc_IsInFightMode(slf,FMODE_NONE))
		{
			AI_RemoveWeapon(slf);
		};
		AI_ReadyMeleeWeapon(slf);
		return;
	};
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) || !Npc_HasEquippedMeleeWeapon(slf))
		{
			return;
		};
	};
	if(Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		if((Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER) || !Npc_HasEquippedRangedWeapon(slf))
		{
			return;
		};
	};
	if(Npc_HasEquippedMeleeWeapon(slf) && (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER))
	{
		if(!Npc_IsInFightMode(slf,FMODE_NONE))
		{
			AI_RemoveWeapon(slf);
		};
		AI_ReadyMeleeWeapon(slf);
		return;
	};
	if(Npc_HasEquippedRangedWeapon(slf) && (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) && C_NpcHasAttackReasonToKill(slf))
	{
		if(!Npc_IsInFightMode(slf,FMODE_NONE))
		{
			AI_RemoveWeapon(slf);
		};
		AI_ReadyRangedWeapon(slf);
		return;
	};
	if(Npc_IsInFightMode(slf,FMODE_NONE))
	{
		if(Npc_HasEquippedMeleeWeapon(slf))
		{
			AI_ReadyMeleeWeapon(slf);
			return;
		};
		if(Npc_HasEquippedRangedWeapon(slf))
		{
			AI_ReadyRangedWeapon(slf);
			return;
		};
		AI_ReadyMeleeWeapon(slf);
		return;
	};
};

