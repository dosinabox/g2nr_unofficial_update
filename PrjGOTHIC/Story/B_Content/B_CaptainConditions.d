
func int B_CaptainConditions(var C_Npc captain)
{
	if(Npc_GetDistToWP(captain,"NW_WAITFOR_SHIP_CAPTAIN") > 2000)
	{
		return FALSE;
	};
	if(!Npc_HasItems(hero,ItWr_Seamap_Irdorath))
	{
		return FALSE;
	};
	if((Crewmember_Count + CrewmemberFree_Count) < Min_Crew)
	{
		return FALSE;
	};
	if(MIS_ShipIsFree == FALSE)
	{
		return FALSE;
	};
	return TRUE;
};

