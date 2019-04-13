
func void B_NpcSetDrunk(var int DrunkTime)
{
	if(Npc_IsPlayer(self) && (DrunkTime > 0))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN",DrunkTime * 1000);
	};
};