
func string B_BuildPickpocketString()
{
	if(self.aivar[AIV_DexToSteal] <= 20)
	{
		if(self.aivar[AIV_Gender] == FEMALE)
		{
			return Pickpocket_20_Female;
		};
		return Pickpocket_20;
	};
	if(self.aivar[AIV_DexToSteal] <= 40)
	{
		if(self.aivar[AIV_Gender] == FEMALE)
		{
			return Pickpocket_40_Female;
		};
		return Pickpocket_40;
	};
	if(self.aivar[AIV_DexToSteal] <= 60)
	{
		if(self.aivar[AIV_Gender] == FEMALE)
		{
			return Pickpocket_60_Female;
		};
		return Pickpocket_60;
	};
	if(self.aivar[AIV_DexToSteal] <= 80)
	{
		if(self.aivar[AIV_Gender] == FEMALE)
		{
			return Pickpocket_80_Female;
		};
		return Pickpocket_80;
	};
	if(self.aivar[AIV_DexToSteal] <= 100)
	{
		if(self.aivar[AIV_Gender] == FEMALE)
		{
			return Pickpocket_100_Female;
		};
		return Pickpocket_100;
	};
	if(self.aivar[AIV_Gender] == FEMALE)
	{
		return Pickpocket_120_Female;
	};
	return Pickpocket_120;
};

instance DIA_Pickpocket(C_Info)
{
	nr = 998;
	condition = DIA_Pickpocket_Condition;
	information = DIA_Pickpocket_Info;
	permanent = TRUE;
	description = DIALOG_PICKPOCKET;
};


func int DIA_Pickpocket_Condition()
{
	if(C_CanStealFromNpc(self.aivar[AIV_DexToSteal]))
	{
		DIA_Pickpocket.description = B_BuildPickpocketString();
		return TRUE;
	};
};

func void DIA_Pickpocket_Info()
{
	Info_ClearChoices(DIA_Pickpocket);
	Info_AddChoice(DIA_Pickpocket,Dialog_Back,DIA_Pickpocket_BACK);
	Info_AddChoice(DIA_Pickpocket,DIALOG_PICKPOCKET,DIA_Pickpocket_DoIt);
};

func void DIA_Pickpocket_DoIt()
{
	B_StealGold();
	Info_ClearChoices(DIA_Pickpocket);
};

func void DIA_Pickpocket_BACK()
{
	Info_ClearChoices(DIA_Pickpocket);
};

func void B_AssignPickpocket(var C_Npc slf)
{
	DIA_Pickpocket.npc = Hlp_GetInstanceID(slf);
};

