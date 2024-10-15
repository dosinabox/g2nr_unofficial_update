
func void B_MalcomExident()
{
	if(Malcom_Accident == FALSE)
	{
		if(!Npc_IsDead(Malcom))
		{
			B_StartOtherRoutine(Malcom,"START");
			AI_Teleport(Malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			B_KillNpc(Malcom);
			Wld_InsertNpc(Lurker_SecretCave1,"ADW_PIRATECAMP_SECRETCAVE_01");
			Wld_InsertNpc(Lurker_SecretCave2,"ADW_PIRATECAMP_SECRETCAVE_01");
			B_StartOtherRoutine(Owen,"START");
			Malcom_Accident_Deadly = TRUE;
		};
		Malcom_Accident = TRUE;
	};
};

