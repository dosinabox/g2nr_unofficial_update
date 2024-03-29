
instance DIA_Sylvio_EXIT(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 999;
	condition = DIA_Sylvio_EXIT_Condition;
	information = DIA_Sylvio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sylvio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Hallo(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 1;
	condition = DIA_Sylvio_Hallo_Condition;
	information = DIA_Sylvio_Hallo_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Sylvio_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Hallo_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Sylvio_Hallo_09_01");	//����� � ����� ���� ���������� ���������� �� ���?
	Sylvio_angequatscht += 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Thekla(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 2;
	condition = DIA_Sylvio_Thekla_Condition;
	information = DIA_Sylvio_Thekla_Info;
	permanent = FALSE;
	description = "����� �������, ��� � ��� �������� � �����.";
};


func int DIA_Sylvio_Thekla_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_00");	//����� �������, ��� � ��� �������� � �����.
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_01");	//��? � ��� �� �������� � ���� ����� ����? � ������ ��� �� ������ ����?
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_02");	//�� ��������� ������, ���� ������...
	if(!Npc_IsDead(Bullco) && (SLD_Bullco_Defeated == FALSE))
	{
		AI_Output(self,other,"DIA_Sylvio_Thekla_09_03");	//(�������-����������) ������ �� ���� �� �������� ���� ������ � ���� ������ ������?
	}
	else
	{
		B_Say(self,other,"$GETOUTOFHERE");
	};
	Sylvio_angequatscht += 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Gossip(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 3;
	condition = DIA_Sylvio_Gossip_Condition;
	information = DIA_Sylvio_Gossip_Info;
	permanent = FALSE;
	description = "� ���� ������ �������...";
};


func int DIA_Sylvio_Gossip_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Gossip_15_00");	//� ���� ������ �������...
	AI_Output(self,other,"DIA_Sylvio_Gossip_09_01");	//��� ������ ������� ������� �����.
	Sylvio_angequatscht += 1;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_AboutLee(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 4;
	condition = DIA_Sylvio_AboutLee_Condition;
	information = DIA_Sylvio_AboutLee_Info;
	permanent = FALSE;
	description = "��� �� ������� � ��?";
};


func int DIA_Sylvio_AboutLee_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info()
{
	AI_Output(other,self,"DIA_Sylvio_AboutLee_15_00");	//��� �� ������� � ��?
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_01");	//(������ ��������) ��, �� ������� ����. � �� �� ���� �������� � ������� � ���.
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_02");	//(�������) ���� �������, �� ����� ���� �� ��������.
	Sylvio_angequatscht += 1;
	AI_StopProcessInfos(self);
};


func int C_Rod_Defeated()
{
	if(!Npc_IsDead(Rod))
	{
		if(Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Rod_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Sentenza_Defeated()
{
	if(!Npc_IsDead(Sentenza))
	{
		if(Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Sentenza_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Fester_Defeated()
{
	if(!Npc_IsDead(Fester))
	{
		if(Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Fester_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Raoul_Defeated()
{
	if(!Npc_IsDead(Raoul))
	{
		if(Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Raoul_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Bullco_Defeated()
{
	if(!Npc_IsDead(Bullco))
	{
		if(Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	}
	else if(Bullco_KilledByPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_Sylvio_MenDefeated()
{
	var int victories;
	victories = 0;
	if(C_Rod_Defeated())
	{
		victories += 1;
	};
	if(C_Sentenza_Defeated())
	{
		victories += 1;
	};
	if(C_Fester_Defeated())
	{
		victories += 1;
	};
	if(C_Raoul_Defeated())
	{
		victories += 1;
	};
	if(C_Bullco_Defeated())
	{
		victories += 1;
	};
	return victories;
};

instance DIA_Sylvio_MenDefeated(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 5;
	condition = DIA_Sylvio_MenDefeated_Condition;
	information = DIA_Sylvio_MenDefeated_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sylvio_MenDefeated_Condition()
{
	if(C_Sylvio_MenDefeated() >= 2)
	{
		return TRUE;
	};
};

func void DIA_Sylvio_MenDefeated_Info()
{
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_00");	//��� �������, �� ������ ��� �� ���� ������!
	if(Lee.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_01");	//��������� � ����, �� ���� �� ������� ��.
	};
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_02");	//� ������������ ����! ����� ����� ������ �����������, � ����� �� �������� � ����� ���������!
	Sylvio_MenDefeated = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_Asshole(C_Info)
{
	npc = SLD_806_Sylvio;
	nr = 2;
	condition = DIA_Sylvio_Asshole_Condition;
	information = DIA_Sylvio_Asshole_Info;
	permanent = FALSE;
	description = "��, ������...";
};


func int DIA_Sylvio_Asshole_Condition()
{
	if(Sylvio_angequatscht >= 1)
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Asshole_Info()
{
	AI_Output(other,self,"DIA_Sylvio_Asshole_15_00");	//��, ������...
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_01");	//�� ���, ������������� �������, ��� � ������ ���� �� �����?
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_02");	//���������� ����, ������ �� ������.
	Sylvio_angequatscht += 1;
	AI_StopProcessInfos(self);
};

