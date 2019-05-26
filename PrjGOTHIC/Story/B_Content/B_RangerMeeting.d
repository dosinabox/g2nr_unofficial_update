
var int LaresRangerArmorEquipped;

func void B_MakeRangerReadyForMeeting(var C_Npc Ranger)
{
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Lares))
	{
		if(LaresRangerArmorEquipped == FALSE)
		{
			CreateInvItems(Ranger,ITAR_Fake_RANGER,1);
			AI_EquipArmor(Ranger,ITAR_Fake_RANGER);
			LaresRangerArmorEquipped = TRUE;
		};
	}
	else
	{
		CreateInvItems(Ranger,ITAR_Fake_RANGER,1);
		AI_EquipArmor(Ranger,ITAR_Fake_RANGER);
	};
	Ranger.npcType = NPCTYPE_FRIEND;
};

func void B_MakeRangerReadyToLeaveMeeting(var C_Npc Ranger)
{
	/*AI_UnequipArmor(Ranger);
	Npc_RemoveInvItems(Ranger,ITAR_RANGER_Addon,Npc_HasItems(Ranger,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(Ranger,ITAR_Fake_RANGER,Npc_HasItems(Ranger,ITAR_Fake_RANGER));
	AI_EquipBestArmor(Ranger);*/
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Martin))
	{
		AI_EquipArmor(Ranger,ITAR_MIL_L);
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Lares))
	{
		if(LaresRangerArmorEquipped == TRUE)
		{
			AI_EquipArmor(Ranger,ITAR_Vlk_L);
			LaresRangerArmorEquipped = FALSE;
		};
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Cord))
	{
		AI_EquipArmor(Ranger,ITAR_SLD_H);
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Gaan))
	{
		AI_EquipArmor(Ranger,ITAR_Bau_L);
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Orlan))
	{
		AI_EquipArmor(Ranger,ITAR_Bau_M);
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Cavalorn))
	{
		if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
		{
			AI_EquipArmor(Ranger,ITAR_Bau_L);
		};
	};
};

func void B_MakeRangerReadyForMeetingALL()
{
	B_MakeRangerReadyForMeeting(Martin);
	B_MakeRangerReadyForMeeting(Lares);
	B_MakeRangerReadyForMeeting(Cord);
	B_MakeRangerReadyForMeeting(Gaan);
	B_MakeRangerReadyForMeeting(Orlan);
	B_MakeRangerReadyForMeeting(Cavalorn);
};

func void B_MakeRangerReadyToLeaveMeetingALL()
{
	B_MakeRangerReadyToLeaveMeeting(Martin);
	B_MakeRangerReadyToLeaveMeeting(Lares);
	B_MakeRangerReadyToLeaveMeeting(Cord);
	B_MakeRangerReadyToLeaveMeeting(Gaan);
	B_MakeRangerReadyToLeaveMeeting(Orlan);
	B_MakeRangerReadyToLeaveMeeting(Cavalorn);
	/*AI_UnequipArmor(Cavalorn);
	Npc_RemoveInvItems(Cavalorn,ITAR_Fake_RANGER,Npc_HasItems(Cavalorn,ITAR_Fake_RANGER));
	AI_EquipBestArmor(Cavalorn);*/
};

func void B_Addon_Orlan_RangersReadyForComing()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"PreRangerMeeting");
	};
	B_StartOtherRoutine(Martin,"PreRangerMeeting");
	B_StartOtherRoutine(Lares,"PreRangerMeeting");
	B_StartOtherRoutine(Cord,"PreRangerMeeting");
	B_StartOtherRoutine(Gaan,"PreRangerMeeting");
	Lares.aivar[AIV_PARTYMEMBER] = FALSE;
};

func void B_Addon_Orlan_ComingRanger()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"RangerMeeting");
	};
	B_StartOtherRoutine(Martin,"RangerMeeting");
	B_StartOtherRoutine(Lares,"RangerMeeting");
	B_StartOtherRoutine(Cord,"RangerMeeting");
	B_StartOtherRoutine(Gaan,"RangerMeeting");
	B_StartOtherRoutine(Orlan,"RangerMeeting");
	RangerMeetingRunning = LOG_Running;
};

func void B_RangerMeetingParking()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"Stadt");
	};
	B_StartOtherRoutine(Orlan,"START");
	Lares_HaltsMaul = TRUE;
	B_StartOtherRoutine(Lares,"Parking");
	B_StartOtherRoutine(Cord,"Parking");
	B_StartOtherRoutine(Gaan,"Parking");
	B_StartOtherRoutine(Martin,"Parking");
	/*if(Gaan.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_StartOtherRoutine(Gaan,"Parking");
	}
	else
	{
		B_StartOtherRoutine(Gaan,"Parking");
	};
	if(MIS_Addon_Martin_GetRangar == FALSE)
	{
		B_StartOtherRoutine(Martin,"Parking");
	}
	else
	{
		B_StartOtherRoutine(Martin,"Parking");
	};*/
};

func void B_SchlussMitRangerMeeting()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"Stadt");
	};
	if(LaresGuide_ZuOnar != LOG_SUCCESS)
	{
		LaresGuide_ZuOnar = FALSE;
	};
	if(LaresGuide_ZumPortal != 8)
	{
		LaresGuide_ZumPortal = 0;
	};
	if(LaresGuide_OrnamentForest != 3)
	{
		LaresGuide_OrnamentForest = 0;
	};
	B_StartOtherRoutine(Lares,"Start");
	B_StartOtherRoutine(Cord,"Start");
	if(Gaan.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_StartOtherRoutine(Gaan,"PreStart");
	}
	else
	{
		B_StartOtherRoutine(Gaan,"Start");
	};
	if(MIS_Addon_Martin_GetRangar == FALSE)
	{
		B_StartOtherRoutine(Martin,"PreStart");
	}
	else
	{
		B_StartOtherRoutine(Martin,"Start");
	};
	B_StartOtherRoutine(Orlan,"Start");
	Lares_HaltsMaul = LOG_OBSOLETE;
};

