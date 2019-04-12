
func void B_MalcomExident()
{
	if(Malcom_Accident == FALSE)
	{
		if(!Npc_IsDead(Malcom))
		{
			AI_Teleport(Malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			B_StartOtherRoutine(Malcom,"Start");
			Npc_ChangeAttribute(Malcom,ATR_HITPOINTS,-Malcom.attribute[ATR_HITPOINTS_MAX]);
			AI_Teleport(Malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			Malcom_Accident = TRUE;
			if(!Npc_IsDead(Owen))
			{
				B_StartOtherRoutine(Owen,"Start");
			};
		};
	};
};

