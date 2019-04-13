
func void B_NpcSetDrunk(var int DrunkTime)
{
	if((Npc_IsPlayer(self) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rukhar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dyrian))) && (DrunkTime > 0))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN",DrunkTime * 1000);
	};
};