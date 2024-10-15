
func void B_MakeRangerReadyForMeeting(var C_Npc ranger)
{
	if(Npc_IsDead(ranger))
	{
		return;
	};
	if(ArmorEquipped(ranger,ITAR_Fake_RANGER))
	{
		return;
	};
	if(!Npc_HasItems(ranger,ITAR_Fake_RANGER))
	{
		CreateInvItem(ranger,ITAR_Fake_RANGER);
	};
	AI_EquipArmor(ranger,ITAR_Fake_RANGER);
	ranger.npcType = NPCTYPE_FRIEND;
};

func void B_MakeRangerReadyToLeaveMeeting(var C_Npc ranger)
{
	if(Npc_IsDead(ranger))
	{
		return;
	};
	if(!ArmorEquipped(ranger,ITAR_Fake_RANGER))
	{
		return;
	};
	if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Martin))
	{
		AI_EquipArmor(ranger,ITAR_MIL_L);
	}
	else if(Hlp_GetInstanceID(ranger) == Hlp_GetInstanceID(Lares))
	{
		AI_EquipArmor(ranger,ITAR_Vlk_L);
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
		B_StartOtherRoutine(Cavalorn,"PRERANGERMEETING");
	};
	B_StartOtherRoutine(Martin,"PRERANGERMEETING");
	B_StartOtherRoutine(Lares,"PRERANGERMEETING");
	B_StartOtherRoutine(Cord,"PRERANGERMEETING");
	B_StartOtherRoutine(Gaan,"PRERANGERMEETING");
	Lares.aivar[AIV_PARTYMEMBER] = FALSE;
};

func void B_Addon_Orlan_ComingRanger()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"RANGERMEETING");
	};
	B_StartOtherRoutine(Martin,"RANGERMEETING");
	B_StartOtherRoutine(Lares,"RANGERMEETING");
	B_StartOtherRoutine(Cord,"RANGERMEETING");
	B_StartOtherRoutine(Gaan,"RANGERMEETING");
	B_StartOtherRoutine(Orlan,"RANGERMEETING");
	RangerMeetingRunning = LOG_Running;
};

func void B_RangerMeetingParking()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"STADT");
	};
	B_StartOtherRoutine(Orlan,"START");
	B_StartOtherRoutine(Lares,"PARKING");
	B_StartOtherRoutine(Cord,"PARKING");
	B_StartOtherRoutine(Gaan,"PARKING");
	B_StartOtherRoutine(Martin,"PARKING");
	Lares_HaltsMaul = TRUE;
};

func void B_SchlussMitRangerMeeting()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		B_StartOtherRoutine(Cavalorn,"STADT");
	};
	if(Gaan.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_StartOtherRoutine(Gaan,"PRESTART");
	}
	else
	{
		B_StartOtherRoutine(Gaan,"START");
	};
	if(MIS_Addon_Martin_GetRangar == FALSE)
	{
		B_StartOtherRoutine(Martin,"PRESTART");
	}
	else
	{
		B_StartOtherRoutine(Martin,"START");
	};
	B_StartOtherRoutine(Orlan,"START");
	B_StartOtherRoutine(Cord,"START");
	B_ResetLares();
	Lares_HaltsMaul = LOG_OBSOLETE;
};

