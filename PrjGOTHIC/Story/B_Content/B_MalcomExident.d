
func void B_MalcomExident()
{
	if(Malcom_Accident == FALSE)
	{
		if(!Npc_IsDead(Malcom))
		{
			AI_Teleport(Malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			CreateInvItems(Malcom,ItWr_TwoHStonePlate3_Addon,1);
			B_StartOtherRoutine(Malcom,"Start");
			Npc_ChangeAttribute(Malcom,ATR_HITPOINTS,-Malcom.attribute[ATR_HITPOINTS_MAX]);
			AI_Teleport(Malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			Wld_InsertNpc(Lurker_SecretCave1,"ADW_PIRATECAMP_SECRETCAVE_01");
			Wld_InsertNpc(Lurker_SecretCave2,"ADW_PIRATECAMP_SECRETCAVE_01");
			Malcom_Accident = TRUE;
			if(!Npc_IsDead(Owen))
			{
				B_StartOtherRoutine(Owen,"Start");
			};
		};
	};
};

