
instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hallo(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hallo_Info;
	permanent = FALSE;
	description = "��� �� ������?";
};


func int DIA_Edda_Hallo_Condition()
{
	if(Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//��� �� ������?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//���. �����, ��� �� �������� �������, ��, �� ������� ����, ��� ������� ���.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//���� ������ ���� �������, ���� ������.
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//� ������� ��� ����. ��� ���� ����, ���� ��������. ���, ��� ��� ����� - ��� ����� �� ������ ��� ����.
};


func void B_Edda_AboutStolenStatue()
{
	if(Wld_IsTime(8,0,22,0))
	{
		AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//�� ���� �� �����, ��� ������������ �� ����, ������ ������� � ���� ������. ��� ���� ��� ���� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Stadt_17_02_add");	//���� �� �����, ��� ������������ �� ����, ������ ������� � ���� ������. ���� ��� ���� �������.
	};
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//� �� �� ������� �����?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//������������ ������ ����, ��� � ���� ����, ��� �������.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//���-�� ����� ��� ������ ������.
	Edda_Schlafplatz = TRUE;
};

instance DIA_Edda_Sleep(C_Info)
{
	npc = VLK_471_Edda;
	nr = 3;
	condition = DIA_Edda_Sleep_Condition;
	information = DIA_Edda_Sleep_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Edda_Sleep_Condition()
{
	if(Wld_IsTime(22,0,8,0) && Npc_IsInState(self,ZS_Talk) && (Edda_Schlafplatz == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Edda_Sleep_Info()
{
	B_Edda_AboutStolenStatue();
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 9;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ������?";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//��� �� ������ ���������� ��� � ������?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//����������� ������� ��������� �����. ������� ����� �� ������� � ����� ����.
	if(Edda_Schlafplatz == FALSE)
	{
		B_Edda_AboutStolenStatue();
	};
};


instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "�� ������ ������� ��� ���� ���?";
};


func int DIA_Edda_Suppe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//�� ������ ������� ��� ���� ���?
	if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//� ����������� ��� �� ������ ��������� � �������� ��� ������ ����.
	}
	else if(Wld_IsTime(22,0,8,0))
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03_add");	//������ �������.
	}
	else if(Edda_Day != Wld_GetDay())
	{
		if(Npc_HasItems(other,ItFo_Fish) || Npc_HasItems(other,ItFo_SmellyFish))
		{
			if(Npc_HasItems(other,ItFo_Fish))
			{
				B_GiveInvItems(other,self,ItFo_Fish,1);
				B_RemoveEveryInvItem(self,ItFo_Fish);
			}
			else
			{
				B_GiveInvItems(other,self,ItFo_SmellyFish,1);
				B_RemoveEveryInvItem(self,ItFo_SmellyFish);
			};
			AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//��� ������ �����. ���, ����� �������.
			B_GiveInvItems(self,other,ItFo_EddasFishSoup,1);
			Edda_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//������� ��� ����, � � ����� ���� ������� ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//���, �� �������. ������� ������.
	};
};


instance DIA_Edda_Statue(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = "��������, � ������ ������ ������ ��� ����.";
};


func int DIA_Edda_Statue_Condition()
{
	if(Edda_Schlafplatz == TRUE)
	{
		if(Npc_HasItems(other,ItMi_EddasStatue) || Npc_HasItems(other,ItMi_InnosStatue) || Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
		{
			return TRUE;
		};
	};
};

func void DIA_Edda_Statue_Info()
{
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//��������, � ������ ������ ������ ��� ����.
	if(Npc_HasItems(other,ItMi_EddasStatue))
	{
		B_GiveInvItems(other,self,ItMi_EddasStatue,1);
		B_SetItemToSteal(self,20,ItMi_EddasStatue,1);
		B_GivePlayerXP(XP_Edda_Statue * 2);
		AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//��! ��� ���! �������� ���� �������!
	}
	else
	{
		if(Npc_HasItems(other,ItMi_InnosStatue))
		{
			B_GiveInvItems(other,self,ItMi_InnosStatue,1);
			B_SetItemToSteal(self,20,ItMi_InnosStatue,1);
		}
		else if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
		{
			B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1);
			B_SetItemToSteal(self,20,ItMi_LostInnosStatue_Daron,1);
		};
		B_GivePlayerXP(XP_Edda_Statue);
		AI_Output(self,other,"DIA_Edda_Statue_17_01");	//�� - �������� ���� �������. �� �� ������� ���� ���� ������...
	};
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//�� ����� ��������������.
	B_AssignPickpocket(self);
};

