
func void evt_oc_maingate_func_s1()
{
	if(MIS_OCGateOpen == FALSE)
	{
		Wld_InsertNpc(OrcElite_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcElite_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcShaman_Sit,"OC_TO_GUARD");
		Wld_InsertNpc(OrcElite_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(Warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(Warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcElite_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcElite_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_04");
		Wld_InsertNpc(OrcElite_Roam,"OC_TRAIN_04");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(Warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(Warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(OrcElite_Roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CENTER_02");
		Wld_InsertNpc(OrcElite_Roam,"OC_CENTER_02");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CENTER_03");
		Wld_InsertNpc(OrcElite_Roam,"OC_CENTER_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcShaman_Sit,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(OrcShaman_Sit,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(Warg,"OC_EBR_HALL_THRONE");
		B_KillNpc(VLK_4143_HaupttorWache);
		B_KillNpc(VLK_4145_Waffenknecht);
		B_KillNpc(VLK_4146_Waffenknecht);
		B_KillNpc(VLK_4147_Waffenknecht);
		B_KillNpc(VLK_4101_Waffenknecht);
		B_KillNpc(VLK_4102_Waffenknecht);
		B_KillNpc(VLK_4103_Waffenknecht);
		B_KillNpc(VLK_4104_Waffenknecht);
		B_KillNpc(VLK_4105_Waffenknecht);
		B_KillNpc(VLK_4108_Engor);
		Garond.flags = 0;
		Brutus.flags = NPC_FLAG_IMMORTAL;
		PlayVideo("ORCATTACK.BIK");
		MIS_OCGateOpen = TRUE;
	};
};

