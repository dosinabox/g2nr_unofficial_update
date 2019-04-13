
func void B_NpcSetDrunk(var int DrunkTime)
{
	if(Npc_IsPlayer(self) && (DrunkTime > 0) && (self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX]) && (self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX]))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN",DrunkTime * 1000);
	};
};