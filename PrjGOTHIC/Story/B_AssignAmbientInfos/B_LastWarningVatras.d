
func void B_LastWarningVatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//�������, ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//����� ���� ����� ��� ������������ ���� �� ��������� ��������� � ���� ���.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//��� �� �����, � �����, ��� �� ���� � ���� ��������������� ����������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//�� ������ � ������ ���� � ���. �� ������� �� ������ �������������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//��������� �������� ����� ������� �� ����� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//������ �� - ������� ��� ����.
	VatrasMadKillerCount = MadKillerCount;
};

func void B_VatrasPissedOff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//������ �� �� ������ ������������ �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//��������. ��� ���� �� ������ �����.
	AI_StopProcessInfos(self);
	if((CurrentLevel == NEWWORLD_ZEN) && (VatrasPissedOffForever == FALSE))
	{
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"PRAY");
			Crewmember_Count -= 1;
		};
		Vatras_IsOnBoard = LOG_FAILED;
		self.flags = 0;
	};
	VatrasPissedOffForever = TRUE;
};

