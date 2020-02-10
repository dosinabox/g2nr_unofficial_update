
instance DIA_264_Ritter_PICKPOCKET(C_Info)
{
	npc = PAL_264_Ritter;
	nr = 900;
	condition = DIA_264_Ritter_PICKPOCKET_Condition;
	information = DIA_264_Ritter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80_Key;
};


func int DIA_264_Ritter_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItKe_OC_Store))
	{
		return C_StealItem(70,Hlp_GetInstanceID(ItKe_OC_Store));
	};
	return FALSE;
};

func void DIA_264_Ritter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_264_Ritter_PICKPOCKET);
	Info_AddChoice(DIA_264_Ritter_PICKPOCKET,Dialog_Back,DIA_264_Ritter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_264_Ritter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_264_Ritter_PICKPOCKET_DoIt);
};

func void DIA_264_Ritter_PICKPOCKET_DoIt()
{
	B_StealItem(70,Hlp_GetInstanceID(ItKe_OC_Store));
	Info_ClearChoices(DIA_264_Ritter_PICKPOCKET);
};

func void DIA_264_Ritter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_264_Ritter_PICKPOCKET);
};

