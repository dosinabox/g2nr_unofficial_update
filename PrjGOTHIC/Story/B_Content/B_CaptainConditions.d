
func int B_CaptainConditions(var C_Npc Captain)
{
	if((Kapitel == 5) && (SCGotCaptain == TRUE) && Npc_HasItems(hero,ItWr_Seamap_Irdorath) && (Npc_GetDistToWP(Captain,"NW_WAITFOR_SHIP_CAPTAIN") < 2000))
	{
		if((Crewmember_Count + CrewmemberFree_Count) >= Min_Crew)
		{
			if(Npc_IsDead(Schiffswache_212) && Npc_IsDead(Schiffswache_213))
			{
				MIS_ShipIsFree = TRUE;
			};
			if(MIS_ShipIsFree == TRUE)
			{
				return TRUE;
			};
		};
	};
	return FALSE;
};

