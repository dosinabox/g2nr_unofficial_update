
func void B_LastWarningVatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//Негодяй, что ты сделал?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//Орден Воды много раз предупреждал тебя об опасности попасться в сети зла.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//Тем не менее, я узнал, что ты ушел с пути всесохраняющего равновесия.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//Ты убивал и грабил всех и вся. Ты виновен во многих преступлениях.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//Множество невинных людей погибли от ТВОЕЙ руки.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//Теперь ты - союзник сил тьмы.
};

func void B_VatrasPissedOff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//Отныне ты не можешь рассчитывать на нашу помощь.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//Убирайся. Для меня ты теперь пария.
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		Crewmember_Count = Crewmember_Count - 1;
	};
	Vatras_IsOnBoard = LOG_FAILED;
	self.flags = 0;
	VatrasPissedOffForever = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRAY");
};

