
func void B_EquipFakeRangerArmor(var C_Npc ranger)
{
	if(!ArmorEquipped(ranger,ITAR_Fake_RANGER))
	{
		if(!Npc_HasItems(ranger,ITAR_Fake_RANGER))
		{
			CreateInvItems(ranger,ITAR_Fake_RANGER,1);
		};
		AI_EquipArmor(ranger,ITAR_Fake_RANGER);
	};
};

var int LaresRangerArmorEquipped;

func void B_MakeRangerReadyForMeeting(var C_Npc ranger)
{
	if(Hlp_GetInstanceID(ranger) != Hlp_GetInstanceID(Lares))
	{
		B_EquipFakeRangerArmor(ranger);
	}
	else if(LaresRangerArmorEquipped == FALSE)
	{
		B_EquipFakeRangerArmor(ranger);
		LaresRangerArmorEquipped = TRUE;
	};
	ranger.npcType = NPCTYPE_FRIEND;
};

func void B_MakeRangerReadyToLeaveMeeting(var C_Npc ranger)
{
	if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Martin))
	{
		AI_EquipArmor(ranger,ITAR_MIL_L);
	}
	else if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Lares))
	{
		if(LaresRangerArmorEquipped == TRUE)
		{
			AI_EquipArmor(ranger,ITAR_Vlk_L);
			LaresRangerArmorEquipped = FALSE;
		};
	}
	else if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Cord))
	{
		AI_EquipArmor(ranger,ITAR_SLD_H);
	}
	else if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Gaan))
	{
		AI_EquipArmor(ranger,ITAR_Bau_L);
	}
	else if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Orlan))
	{
		AI_EquipArmor(ranger,ITAR_Bau_M);
	}
	else if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Cavalorn))
	{
		if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
		{
			AI_EquipArmor(ranger,ITAR_Bau_L);
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
	B_StartOtherRoutine(Orlan,"Start");
	B_StartOtherRoutine(Lares,"Parking");
	B_StartOtherRoutine(Cord,"Parking");
	B_StartOtherRoutine(Gaan,"Parking");
	B_StartOtherRoutine(Martin,"Parking");
	Lares_HaltsMaul = TRUE;
};

func void B_SchlussMitRangerMeeting()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"Stadt");
	};
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
	B_StartOtherRoutine(Cord,"Start");
	B_ResetLares();
	Lares_HaltsMaul = LOG_OBSOLETE;
};

