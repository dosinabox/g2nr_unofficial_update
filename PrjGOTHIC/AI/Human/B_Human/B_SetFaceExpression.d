
func void B_SetFaceExpression(var C_Npc slf,var C_Npc oth)
{
	var int attitude;
	attitude = Npc_GetAttitude(slf,oth);
	if(Npc_IsInState(slf,ZS_Flee) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(VLK_448_Joe)))
	{
		Mdl_StartFaceAni(slf,"S_FRIGHTENED",1,-1);
	}
	else if((attitude == ATT_HOSTILE) && !C_PlayerIsFakeBandit(slf,oth) && (slf.guild == GIL_BDT))
	{
		Mdl_StartFaceAni(slf,"S_HOSTILE",1,-1);
	}
	else if((attitude == ATT_ANGRY) || (slf.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		Mdl_StartFaceAni(slf,"S_ANGRY",1,-1);
	}
	else if(attitude == ATT_NEUTRAL)
	{
		Mdl_StartFaceAni(slf,"S_NEUTRAL",1,-1);
	}
	else if(attitude == ATT_FRIENDLY)
	{
		Mdl_StartFaceAni(slf,"S_NEUTRAL",1,-1);
	};
};

func void B_ResetFaceExpression(var C_Npc slf)
{
	Mdl_StartFaceAni(slf,"S_NEUTRAL",1,-1);
};

