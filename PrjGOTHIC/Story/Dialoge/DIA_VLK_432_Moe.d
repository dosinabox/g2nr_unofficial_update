
instance DIA_Moe_EXIT(C_Info)
{
	npc = VLK_432_Moe;
	nr = 999;
	condition = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Moe_Hallo(C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_Hallo_Condition;
	information = DIA_Moe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_Hallo_Condition()
{
	if(Npc_RefuseTalk(self))
	{
		return FALSE;
	};
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) || Npc_IsInState(self,ZS_Talk))
	{
		if((other.guild != GIL_PAL) && (other.guild != GIL_KDF) && (other.guild != GIL_MIL) && !C_LehmarDebtIsOverdue() && !Npc_IsDead(Lehmar))
		{
			return TRUE;
		};
	};
};

func void DIA_Moe_Hallo_Info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//��, � �� ���� ����. ���� ���� ����� �����? �� ����� � �����?
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"���, � �� ��� � �����...",DIA_Moe_Hallo_Gehen);
	Info_AddChoice(DIA_Moe_Hallo,"��, ��� ��� �������� �������. � �-�� ������ ��� �� ������ �����������.",DIA_Moe_Hallo_Witz);
	Info_AddChoice(DIA_Moe_Hallo,"�� ������ ���-�� ������?",DIA_Moe_Hallo_Reizen);
};

func void DIA_Moe_Hallo_Gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//���, � �� ��� � �����...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//� ��� � �������. �� ��� �� ��� �� ����� - �� ����� ������� ����� � ����.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//��� ��� �� ����� �������, � ���� ������� ���� ���������� �����������. �� ���� ��� 50 ������� ����� � ������ ���� ������.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//��� ����� �� ��������� ���� � �����.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"����� �������, ��� ������ �� ����� ������ ���������...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice(DIA_Moe_Hallo,"������ �� ����, �� �� �������� �� �����!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo,"������, � �������.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice(DIA_Moe_Hallo,"�� � �� ���� ���� � �����!",DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//�� � �� ���� ���� � �����!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//���������, ���� ��� ������ ��� ������� � �����. ��� ��� ����� ���� ��������� ����� ������ - � ������ ��� �������� �� ����� ��������� ����.
};

func void DIA_Moe_Hallo_Witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//��, ��� ��� �������� �������. � �-�� ������ ��� �� ������ �����������.
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//�� - ����� ���� ������� ��� ����, ������, ��� � �������� ���� ������ ��������� �� ��������.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"�������, ����� ������ ������, ��� �������� ������� ���� ���� �����.",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo,"�� ��������� ������� ��� ��������?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo,"���������, � ������ ����� ������ ����.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice(DIA_Moe_Hallo,"�� � �� ���� ���� � �����!",DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//�� ������ ���-�� ������?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//���� ������ ����� ������, �����.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"�������, ����� ������ ������, ��� �������� ������� ���� ���� �����.",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo,"�� ��������� ������� ��� ��������?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo,"���������, � ������ ����� ������ ����.",DIA_Moe_Hallo_Ruhig);
};

func void DIA_Moe_Hallo_Miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//����� �������, ��� ������ �� ����� ������ ���������...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(�������) ��������� ����� ���. � �� ������, ������ �� ����� �� ������?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//�� ���������� � �������� ��������, �����. ����� �� ��������� �� ��������� �������� ����� � ����� �� ����.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//��� ������ ������ ����������� � '������� ������'. ���������, ����� ���� ������ �� � �. (������� �������)
};

func void DIA_Moe_Hallo_Pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//�������, ����� ������ ������, ��� �������� ������� ���� ���� �����.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//������ �����������, �����. ������ ���, �� ��� �� ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//�� ��������� ������� ��� ��������?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//�������, � ������ ��������� ��������. ��� ��� ���������, ������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//���������, � ������ ����� ������ ����.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//������, �� ��� ����� ������ ���� 50 �����. ��� ����� �� ����. (����������)
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"������ �� ����, �� �� �������� �� �����!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo,"������, � �������.",DIA_Moe_Hallo_Zahlen);
};

func void DIA_Moe_Hallo_Zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//������, � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//�������. ��� ������� �� ����� ������, ������ �� ������ ������ ��� ��� ���������� ������ ��������.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo,"������ �� ����, �� �� �������� �� �����!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo,"������, ��� ���, ��� � ���� ����.",DIA_Moe_Hallo_Alles);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//... �� � ���� ��� � ����� ������� ������.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//��� �� �����. ������ ����� ��� ���, ��� � ���� ����.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo,"������ �� ����, �� �� �������� �� �����!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo,"������, ��� ���, ��� � ���� ����.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//... �� � ���� ��� ���� � 10 �����.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//����, ������� ������� ��� �� �������?!
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//������, (�����) �� ������ ����.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Moe_Hallo_Vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//������ �� ����, �� �� �������� �� �����!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//����� � ������ ���, ��� � ���� ����, � �� ������ ������ ������������� �� ����� ������ ����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//������, ��� ���, ��� � ���� ����.
	if(Npc_HasItems(hero,ItMi_Gold) > 0)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
		AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//�������, ����� ����������. � ������� �����������. (����������)
	}
	else
	{
		B_Say(self,other,"$SHITNOGOLD");
		B_Say(self,other,"$GETOUTOFHERE");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Moe_Harbor(C_Info)
{
	npc = VLK_432_Moe;
	nr = 800;
	condition = DIA_Moe_Harbor_Condition;
	information = DIA_Moe_Harbor_Info;
	permanent = TRUE;
	description = "�� ������ � ����� ����� ���, ��?";
};


func int DIA_Moe_Harbor_Condition()
{
	return TRUE;
};

func void DIA_Moe_Harbor_Info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//�� ������ � ����� ����� ���, ��?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//�������. � ���?
	Info_ClearChoices(DIA_Moe_Harbor);
	Info_AddChoice(DIA_Moe_Harbor,Dialog_Back,DIA_Moe_Harbor_Back);
	Info_AddChoice(DIA_Moe_Harbor,"��� ��� � ���������?",DIA_Moe_Harbor_Ship);
	Info_AddChoice(DIA_Moe_Harbor,"������ � �� ���� ����� ������ �� ���������?",DIA_Moe_Harbor_Militia);
	Info_AddChoice(DIA_Moe_Harbor,"����� ����� ������ � ��������� �����?",DIA_Moe_Harbor_Rumors);
};

func void DIA_Moe_Harbor_Back()
{
	Info_ClearChoices(DIA_Moe_Harbor);
};

func void DIA_Moe_Harbor_Ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//��� ��� � ���������?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//������������ �������, ������� ������ �� ��������� ����� - ��� ������� ���������.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//�� ����� ��� ���, �� ������� � ���-������.
};

func void DIA_Moe_Harbor_Militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//������ � �� ���� ����� ������ �� ���������?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//��� �� ������������ �������� ����. � ��� ����� ���� �������.
};

func void DIA_Moe_Harbor_Rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//����� ����� ������ ��������� �����?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//�� ����� �� ����� �����, ������� ������ ������� ����� ��������. ��������, ���� ��� ������.
	}
	else if(Kapitel == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//������, �� � ��� ����� ���������? ��� ����.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(��������) ��� �����. ������� ������� �������, �� �� ��� ��� �������� �� ������� � ���������� ����.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//������ ���������� ���� ����.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//��� �� ��� �������� ����� ��� ���? � ������� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//���������� �����. ���� ����� �������� ������ ���� ��� ����, ��� ��� ������ ������.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//��� ����� ������� �� ��������, ��� ����� ������� ����.
		};
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//� ��� ���, ��� ����������, ��� �������� �� ����� ��������� � ����� ��������, ��������� �� ������������ ���� ����������� ����.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//� �����, ��� ������ ���� ������ � ������������ �����. � �� ���, ��� ���� �����.
		}
		else
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//� ����� ���� �� �� ����� �������� ���������.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//� ������ ����?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//� ����� �������� �������� ���, �������. � �� �� ����� ����� ������� � ��������� ������ ����, ����� ������� ��������� ����� �����.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//� ����, ��� �� �� ������ � ����� �������� ���������, �� �������� �������� ������ �������� ���� �������.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//������ ��������� �����? ���� ����� ��������� �� ������. �� ������� ����, �� ��������� �����.
			};
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//����� ��������� ������ �� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//�������-�� ��� ����������� �������� �������� ������. ����� ����.
	};
};


instance DIA_Moe_LEHMARGELDEINTREIBEN(C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information = DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition()
{
	if(Npc_RefuseTalk(self))
	{
		return FALSE;
	};
	if(Npc_IsDead(Lehmar))
	{
		return TRUE;
	};
	if(C_LehmarDebtIsOverdue())
	{
		return TRUE;
	};
};

func void DIA_Moe_LEHMARGELDEINTREIBEN_Info()
{
	if(!Npc_IsDead(Lehmar))
	{
		AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//��, ��! ����� �������� ���� ������.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		B_Say(self,other,"$YOUMURDERER");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};

