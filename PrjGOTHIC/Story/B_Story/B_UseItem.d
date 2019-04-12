
func void B_UseItem(var C_Npc slf,var int itmInstance)
{
	var C_Npc target;
	if(C_BodyStateContains(slf,BS_SIT))
	{
		return;
	};
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(slf);
		AI_UseItem(slf,itmInstance);
		B_LookAtNpc(slf,target);
	}
	else
	{
		AI_UseItem(slf,itmInstance);
	};
};

