
instance DIA_Mil_310_Stadtwache_EXIT(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 999;
	condition = DIA_Mil_310_Stadtwache_EXIT_Condition;
	information = DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_310_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_CityMainGatesPass()
{
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
};

const string Mil_310_Checkpoint = "NW_CITY_ENTRANCE_MAIN";

var int MIL_310_Personal_AbsolutionLevel;

instance DIA_Mil_310_Stadtwache_FirstWarn(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_310_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_310_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if(C_NpcHasGuardStatus(self,Mil_310_Checkpoint,GP_NONE) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//����!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//(��������) ��� ���?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//�� ��� ������, ���!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//�� �������������� �� �������� � ������!
		}
		else if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//�� �� �������� ����� ������� �����!
		}
		else if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//��� �� ����� �������� � ������!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//� ���� �� ����, ��� �� ������ �������� ����?
	}
	else
	{
		if(!Npc_HasEquippedArmor(other))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//���?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//���� ���� ������!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//������?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//�� ����� ����������, ��� ��, ���� ��������!
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//� ������ � ��� ������� ������� ������. ��� �� ����� ����, � ������� ��� �����.
			if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (Mil_333_schonmalreingelassen == FALSE) && (PlayerEnteredCity == FALSE))
			{
				Log_CreateTopic(TOPIC_City,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_City,LOG_Running);
				B_LogEntry(TOPIC_City,"����� ��������� ��������� ��� ����� � �����, � ������ ��������� ���, ��� ����� � ���� ���� ������. ��, ��� � ������ ����� �����-������ ������ ������.");
			};
		}
		else if(VisibleGuild(other) == GIL_BAU)
		{
			if(self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//��� ���� ����� �� ���� ���?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//���� ������ ������.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//�? � ���� ���� �� �� ���� ��� ���� ������������ �������, ����� ������� � �����?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//�� ���� �� ���������� � ����� �������? � ������� �� ����� ����!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//� ������� ������� �� �������.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//��� ���� ����� � ������?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//(��������) ���?
			if((VisibleGuild(other) == GIL_PAL) || (VisibleGuild(other) == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//����� �������� ����, � ������ �������� ������.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//�� ������ ���������� ����?
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//�������, ���. �� ������ ���� ���������� ������.
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//� ������ ����� ����������� ����. ������, � ���� ���� ������. ������ ���������.
			};
			B_CityMainGatesPass();
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_310_Stadtwache_SecondWarn(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_310_Checkpoint,GP_FirstWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//������ ������. ��� ���� ��� - � � ������� ���� � �������!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Attack(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_Attack_Condition;
	information = DIA_Mil_310_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_310_Checkpoint,GP_SecondWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//�� ��� ����������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_310_Stadtwache_Bribe(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_Bribe_Condition;
	information = DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = "��� 100 �������. ������� ��� ������!";
};


func int DIA_Mil_310_Stadtwache_Bribe_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//��� 100 �������. ������� ��� ������!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(�����) 100 ������� - ��� �������. �������, �������.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//� ����� ��� � �����! ��� � � ��������� ��� ����� ������ � ���� 100 �������!
		};
		B_CityMainGatesPass();
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//���?! ���?! � �� ���� ������. ����������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Passierschein(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 4;
	condition = DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information = DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent = FALSE;
	description = "� ���� ���� �������!";
};


func int DIA_Mil_310_Stadtwache_Passierschein_Condition()
{
	if(Npc_HasItems(other,ItWr_Passierschein) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//� ���� ���� �������!
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ItWr_Passierschein,1);
	B_ReadFakeItem(self,other,Fakescroll,1);
	if(!Npc_HasEquippedArmor(other))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//�� ��? � ���� �� ���� ���� ���� �������?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//��� �� ��������� ��� ������ ��� ���?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//�����, ���, ���� � �� ���������!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//��� � �������. �������.
	};
	B_GiveInvItems(self,other,ItWr_Passierschein,1);
	B_CityMainGatesPass();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_ZumSchmied(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information = DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	permanent = FALSE;
	description = "� ���� ��������� � ��������. �� ������ �������� ���-����� ������.";
};


func int DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_ToTheCity) && (Mil_310_schonmalreingelassen == FALSE) && (VisibleGuild(other) == GIL_BAU))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//� ���� ��������� � ��������. �� ������ �������� ���-����� ������.
	if(Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//(���) ��? � ������ �� ��� ����� �� ������?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//��� ������ ���� ���������, ��� �� ������ �����������.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//���?! ��� ��� �������� ����� �����, � � ������ ����, ��� � �������� �� ����� �������, ����� �����������!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//������, �� ������ ���������.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//� ���� ������� �������, ����� ���, ����� ����� ������ ����� ����: �� ����� ������ � ���� �� ����! (������� ����)
	B_CityMainGatesPass();
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


func int C_SCHasHerbs(var int count)
{
	if(Npc_HasItems(other,ItPl_Blueplant) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Forestberry) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Planeberry) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_03) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_03) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Dex_Herb_01) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Strength_Herb_01) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Speed_Herb_01) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Temp_Herb) >= count)
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) >= count)
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Addon_Mil_310_Stadtwache_Constantino(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 2;
	condition = DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information = DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent = TRUE;
	description = "� ������ ����� ��� �������� �����������.";
};


func int DIA_Addon_Mil_310_Stadtwache_Constantino_Condition()
{
	if((MIS_Addon_Lester_PickForConstantino == LOG_Running) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Mil_310_Stadtwache_Constantino_Info()
{
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//� ������ ����� ��� �������� �����������.
	if(C_SCHasHerbs(1) || Npc_HasItems(other,ItPl_Beet) || Npc_HasItems(other,ItPl_Weed) || Npc_HasItems(other,ItPl_SwampHerb) || Npc_HasItems(other,ItPl_Sagitta_Herb_MIS))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//������? �� �� �� ������ ���������, ���� � ������� �� ���, �� ��� ��?
		if(C_SCHasHerbs(MinimumPassagePlants))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//��-�. �������� �������. ������, �� ������ ������. �� �� �������� �������, �� �����?
			B_CityMainGatesPass();
			MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			B_GivePlayerXP(XP_Addon_PickForConstantino);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03");	//���? ��� ��� �����?
			if(Npc_HasItems(other,ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//���, ���������, ������� ����� ������ � ���� �������� �����? �� ������ ���������� ���� ����? ����������!
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//� ������� � �� ����������, �� ���� ��� �������, ��� ���� ����� �� ������ ������ �� ������ �������� �� �����������.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//����� �����? � ���� ��� ������� ����. ��������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_MilizWerden(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information = DIA_Mil_310_Stadtwache_MilizWerden_Info;
	permanent = FALSE;
	description = "� ������, ����� �������� � ���������!";
};


func int DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{
	if(Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//� ������, ����� �������� � ���������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//�� �� ���?! �������� ���������� ��� ������ � ������ ����� - �����, ��� ������� �� ���.
	Mil_310_Scheisse_erzaehlt = TRUE;
};


instance DIA_Mil_310_Stadtwache_Paladine(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_Paladine_Condition;
	information = DIA_Mil_310_Stadtwache_Paladine_Info;
	permanent = FALSE;
	description = "��� ����� ������� ����� ���������! � ���� ������ ��������� ��� ����!";
};


func int DIA_Mil_310_Stadtwache_Paladine_Condition()
{
	if(Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Paladine_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//��� ����� ������� ����� ���������! � ���� ������ ��������� ��� ����!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//��? � ��� ��� �� ������ ���������?
	Mil_310_Scheisse_erzaehlt = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"����� ����� ������������ ���������!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���� ��� ���������� � ������ ��������!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"� ������, ����� �������� ���� ������!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//� ������, ����� �������� ���� ������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//���? ������� �� ������ � ���. � ��� ��� �����?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//��� ����� ������ ��������.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//�� �� ����� �� ������� ����������. � ���� ���� �����-������ ���������?
	if(!Npc_HasItems(other,ItWr_Passierschein))
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//���!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//����� �� ����� ��� ����� �������!
	};
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//���� ��� ���������� � ������ ��������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//� ������ ��������? �� ������ ������? �� ����� ��� �����?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���, �� ���� ������ �������, ������� ����� ��.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���. �� � ����, ��� �� ����� �������!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"��. � ��� � ������ ��������. � ����� ��� ���������� ��������!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//����� ����� ������������ ���������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//���? ����? �����? �� ����� �����?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���, �� ���� ������ �������, ������� ����� ��.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���. �� � ����, ��� �� ����� �������!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"��. � ��� � ������ ��������. � ����� ��� ���������� ��������!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//���. �� � ����, ��� �� ����� �������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//�� �������! � ��� ������� ������������� ��������� �����.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//� �� �����, ��� �� �������� ���� ������� ��� �������� ������� �� ���� ����� ������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//����������!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//���, �� ���� ������ �������, ������� ����� ��.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//(�����������) ��� ������ ����?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"� �� ������ ������������ ���� �� ����.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"�������.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//��. � ��� � ������ ��������. � ����� ��� ���������� ��������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//�� �����! ������ � ������ ������ � ����� ������. ����� �� ������� ���!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//�������� ������!
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_AMage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//���.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//�� ������ ������� �� ����? ����� � ����, �������, ���� ������ � �������� ��������������?!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//���.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//���? ���� ������ ���� ����� ��������� ������.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//�� �� ���� ���.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//� �� ���� ����. ���� �� ��������� ���������, �� �����, ���������� ���� ������� ��� ����������!
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"� ���� �������� ��� ��������� ������ ���������!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"����� ��� ����������� �������!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//�������.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//��, ��� �������� - �������� �������� ������ � ������ ��������.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//��� ��� ���� ���������, � � ������ � ����.
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"� ���� �������� ��� ��������� ������ ���������!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"����� ��� ����������� �������!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//� �� ������ ������������ ���� �� ����.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//�� ������ ���, ��� �������! � ������ � ��������� ������.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//�� ������ ���������� ��� ���. ����, ��� ������ ����?
};

func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//����� ��� ����������� �������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//���? ��� �� ����� ���� �������. � � ���� �� ������� ����!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//���� �� �� ��������� ��� ������� ����� ������, �� �� ������� ���� �� ����������.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//����������!
	AI_PlayAni(self,"T_GETLOST");
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//� ���� �������� ��� ��������� ������ ���������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//��� �� ���������, ��� �������!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//� �� �� ��� �� ������� ���� ���������� � ����� ������, ���� �� ���� ������, ��� �� �� ��������� ��� ����������� ����� �������.
	Player_KnowsLordHagen = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"���. ��� ��������� ������������� ������ ���������.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"����� ��� ����������� �������!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//���. ��� ��������� ������������� ������ ���������.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//����� ���� ���� ������������ �����, ���������.
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_PERM(C_Info)
{
	npc = MIL_310_Stadtwache;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_PERM_Condition;
	information = DIA_Mil_310_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	B_StopLookAt(self);
	AI_PlayAni(self,"T_LGUARD_COMEIN");
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//�������!
	AI_StopProcessInfos(self);
};

