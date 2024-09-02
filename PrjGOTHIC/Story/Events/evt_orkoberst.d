
func void evt_orkoberst()
{
	if(OrkSturmDI == FALSE)
	{
		if(!Npc_IsDead(AntiPaladin_DI))
		{
			AntiPaladin_DI.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(OrcElite_DIOberst1_Rest))
		{
			OrcElite_DIOberst1_Rest.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(OrcElite_DIOberst2_Rest))
		{
			OrcElite_DIOberst2_Rest.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(OrcElite_DIOberst3_Rest))
		{
			OrcElite_DIOberst3_Rest.aivar[AIV_EnemyOverride] = FALSE;
		};
		Wld_InsertNpc(OrcWarrior_Roam,"SHIP_DECK_05");
		Wld_InsertNpc(OrcWarrior_Roam,"SHIP_DECK_17");
		Wld_InsertNpc(OrcWarrior_Roam,"SHIP_IN_22");
		Wld_InsertNpc(OrcWarrior_Roam,"DI_SHIP_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DI_ORK_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DI_ORK_03");
		if(TorlofIsCaptain == TRUE)
		{
			Wld_InsertNpc(OrcWarrior_Roam,"DI_SHIP_04");
			B_StartOtherRoutine(Torlof_DI,"OrkSturmDI");
		}
		else if(JackIsCaptain == TRUE)
		{
			B_StartOtherRoutine(Jack_DI,"OrkSturmDI");
		};
		B_StartOtherRoutine(Biff_DI,"OrkSturmDI");
		if(Vatras_PedroFound == FALSE)
		{
			B_SetImmortal(Vatras_DI);
		};
		if(!Npc_IsDead(Mario_DI))
		{
			CreateInvItem(Mario_DI,ITWR_DementorObsessionBook_MIS);
			Npc_ExchangeRoutine(Mario_DI,"OrkSturmDI");
			B_SetGuild(Mario_DI,GIL_DMT);
			Mario_DI.aivar[AIV_PARTYMEMBER] = FALSE;
			Wld_InsertNpc(Skeleton_Mario1,"FP_ROAM_DI_MARIOSSKELETONS_01");
			Wld_InsertNpc(Skeleton_Mario2,"FP_ROAM_DI_MARIOSSKELETONS_02");
			Wld_InsertNpc(Skeleton_Mario3,"FP_ROAM_DI_MARIOSSKELETONS_03");
			Wld_InsertNpc(Skeleton_Mario4,"FP_ROAM_DI_MARIOSSKELETONS_04");
			Mario_DI_ReadyForAmbush = TRUE;
		}
		else
		{
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_DI_MARIOSSKELETONS_01");
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_DI_MARIOSSKELETONS_02");
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_DI_MARIOSSKELETONS_03");
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_DI_MARIOSSKELETONS_04");
		};
		B_LogEntry(TOPIC_HallenVonIrdorath,"Полковник орков - крепкий орешек. Где-то в его тронном зале должен быть какой-то секрет.");
		OrkSturmDI = TRUE;
	};
};

