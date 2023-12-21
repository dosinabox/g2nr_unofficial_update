
func void B_ClearDeadTrader(var C_Npc trader)
{
	Npc_ClearInventory(trader);
	if(trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(trader);
	};
	trader.aivar[AIV_ChapterInv] = Kapitel - 1;
};

