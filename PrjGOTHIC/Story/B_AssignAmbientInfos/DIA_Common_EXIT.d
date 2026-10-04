
func int DIA_Common_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Common_EXIT_Info()
{
	if(self.aivar[AIV_NPCIsTrader] == TRUE)
	{
		B_EquipTrader(self);
	};
	AI_StopProcessInfos(self);
};

