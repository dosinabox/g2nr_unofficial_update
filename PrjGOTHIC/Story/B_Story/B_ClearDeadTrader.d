
func void B_ClearDeadTrader(var C_Npc Trader)
{
	Npc_ClearInventory(Trader);
	if(Trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(Trader);
	};
	Trader.aivar[AIV_ChapterInv] = Kapitel - 1;
};

