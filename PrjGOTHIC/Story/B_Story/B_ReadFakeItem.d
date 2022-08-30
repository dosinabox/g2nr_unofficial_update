
func void B_ReadFakeItem(var C_Npc reader,var C_Npc oth,var int itm,var float time)
{
	var C_Npc target;
	if(C_BodyStateContains(reader,BS_SIT))
	{
		AI_Standup(reader);
		B_TurnToNpc(reader,oth);
	};
	AI_RemoveWeapon(reader);
	if(!Npc_HasItems(reader,itm))
	{
		CreateInvItem(reader,itm);
	};
	target = Npc_GetLookAtTarget(reader);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(reader);
		AI_UseItemToState(reader,itm,1);
		AI_Wait(reader,time);
		AI_UseItemToState(reader,itm,-1);
		B_LookAtNpc(reader,oth);
	}
	else
	{
		AI_UseItemToState(reader,itm,1);
		AI_Wait(reader,time);
		AI_UseItemToState(reader,itm,-1);
	};
};

