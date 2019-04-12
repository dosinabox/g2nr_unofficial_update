
func void B_StopLookAt(var C_Npc slf)
{
	var C_Npc target;
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		AI_StopLookAt(slf);
	};
};

func void B_LookAtNpc(var C_Npc slf,var C_Npc oth)
{
	B_StopLookAt(slf);
	AI_LookAtNpc(slf,oth);
};

func void B_TurnToNpc(var C_Npc slf,var C_Npc oth)
{
	AI_TurnToNPC(slf,oth);
};

