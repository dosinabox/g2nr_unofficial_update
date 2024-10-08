
instance DIA_Mil_333_Stadtwache_EXIT(C_Info)
{
	npc = MIL_333_Stadtwache;
	nr = 999;
	condition = DIA_Mil_333_Stadtwache_EXIT_Condition;
	information = DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_CitySecondGatesPass()
{
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
	Mil_333_schonmalreingelassen = TRUE;
	B_CheckLog();
};

const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29";

var int MIL_333_Personal_AbsolutionLevel;

instance DIA_Mil_333_Stadtwache_FirstWarn(C_Info)
{
	npc = MIL_333_Stadtwache;
	nr = 1;
	condition = DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_333_Checkpoint) <= 800)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_333_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if(C_NpcHasGuardStatus(self,Mil_333_Checkpoint,GP_NONE) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//����!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(��������) ��� ���?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//�� ��������� ������, ���!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//�� �������������� �� �������� � ������!
		}
		else if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//�� �� �������� ����� ������� �����!
		}
		else if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//��� �� ����� �������� � ������!
		};
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//� ���� �� ����, ��� �� ������ �������� ����?
	}
	else
	{
		if(!Npc_HasEquippedArmor(other) || (VisibleGuild(other) == GIL_BAU))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//��?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//�� ����� �� ������. � ���� ������ ��� �� ����� ����, � ������� ��� �����.
			if(Npc_HasItems(other,ItWr_Passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//�� � ���� ���� �������!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//�� ����� ������ ��� ������ �����!
			};
			if(Npc_KnowsInfo(other,DIA_Mil_310_Stadtwache_MilizWerden) && (other.guild == GIL_NONE))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//�� � ���� �������� � ��������� ������!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//��! �� ����� ����! ��� � ������ ������� � �������� ���������� ��� ���.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//� ��� ��� ���, ��� ��������� ���� ����.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(������� ����) ��, ������! ��� ������ �������� � ��� ������ ��������...
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(��������) ���?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//� ������ ����� ���������� �� ����. ��, �� ������, � ���� ���� ������. �������.
			B_CitySecondGatesPass();
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_333_Stadtwache_SecondWarn(C_Info)
{
	npc = MIL_333_Stadtwache;
	nr = 2;
	condition = DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_333_Checkpoint,GP_FirstWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//� ���� �� ������ ��� � �������? ��� ���� ���, � �� ������������� � ���� �����!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_333_Stadtwache_Attack(C_Info)
{
	npc = MIL_333_Stadtwache;
	nr = 3;
	condition = DIA_Mil_333_Stadtwache_Attack_Condition;
	information = DIA_Mil_333_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_333_Checkpoint,GP_SecondWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//�� ��� ����������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_333_Stadtwache_Bribe(C_Info)
{
	npc = MIL_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_Bribe_Condition;
	information = DIA_Mil_333_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = "��� 100 �������. ������� ��� ������!";
};


func int DIA_Mil_333_Stadtwache_Bribe_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_Bribe_15_00");	//��� 100 �������. ������� ��� ������!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_01");	//(�����) 100 ������� - ��� �������. �������, �������.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_02");	//� ����� ��� � �����! ��� � � ��������� ��� ����� ������ � ���� 100 �������!
		};
		B_CitySecondGatesPass();
		MIL_333_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_03");	//���?! ���?! � �� ���� ������. ����������!
		AI_PlayAni(self,"T_GETLOST");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_333_Stadtwache_PERM(C_Info)
{
	npc = MIL_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_PERM_Condition;
	information = DIA_Mil_333_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	B_StopLookAt(self);
	AI_PlayAni(self,"T_HGUARD_COMEIN");
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//�������!
	AI_StopProcessInfos(self);
};

