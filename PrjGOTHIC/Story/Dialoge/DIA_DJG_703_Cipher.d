
instance DIA_CipherDJG_EXIT(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 999;
	condition = DIA_CipherDJG_EXIT_Condition;
	information = DIA_CipherDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_HALLO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_Cipher_HALLO_Condition;
	information = DIA_Cipher_HALLO_Info;
	description = "�������� ������.";
};


func int DIA_Cipher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info()
{
	AI_Output(other,self,"DIA_Cipher_HALLO_15_00");	//�������� ������.
	AI_Output(self,other,"DIA_Cipher_HALLO_07_01");	//������� ����. ����� ������, ��� �� ����������. ������� ����� �������� � �������� �������.
};


instance DIA_CipherDJG_HELLOAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_HELLOAGAIN_Condition;
	information = DIA_CipherDJG_HELLOAGAIN_Info;
	description = "��� �� ������� �����?";
};


func int DIA_CipherDJG_HELLOAGAIN_Condition()
{
	if(!Npc_IsDead(SwampDragon) && Npc_KnowsInfo(other,DIA_Cipher_HALLO))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_HELLOAGAIN_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_01");	//� ����� ��� ����� ����. ������� ���������� ������.
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_02");	//���������� ������? ��� ����?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_03");	//��� ���-�� ������ ��������� ������. ��� ������� ������ �������� ��� ������ ������ ����� ����, ��� �� �������� �����.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_04");	//� ��� ������ ����� �����, ����� ����� ���������� ���� ���� ��������.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_05");	//�� ������ � �� �� ��� �� ����� ���� ����.
	if(!Npc_IsDead(DJG_Rod))
	{
		AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_06");	//������, �� ���� ���. �� �� ������� ����� ������ ���� ��� ���� ������� ����.
	};
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_07");	//� ��� ������ ����? �� ���� ���� ������ ���� �� �� ��������, ������? ������ ���� ������.
	B_LogEntry(TOPIC_Dragonhunter,"����� ������ ���, ��� � ������� ������ �������� ����� ������.");
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN,"� ����������� ����������� � ��������.",DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN,"������ �� � ���. ������ ��� �� ��������.",DIA_CipherDJG_HELLOAGAIN_GoTogether);
};

func void DIA_CipherDJG_HELLOAGAIN_GoAlone()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00");	//� ����������� ����������� � ��������.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01");	//��� ������. ������, � �������� � ����!
	AI_StopProcessInfos(self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00");	//������ �� � ���. ������ ��� �� ��������.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01");	//��� ������. ����� �, �������, ����� ��������� ������. ��� ���� ����������.
	DJG_SwampParty = TRUE;
	Info_ClearChoices(DIA_CipherDJG_HELLOAGAIN);
};


instance DIA_CipherDJG_GOTOGETHERAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information = DIA_CipherDJG_GOTOGETHERAGAIN_Info;
	description = "� ���������! ������ ������!";
};


func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_CipherDJG_HELLOAGAIN) && (DJG_SwampParty == FALSE) && !Npc_IsDead(SwampDragon))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_GOTOGETHERAGAIN_15_00");	//� ���������! ������ ������!
//	AI_Output(self,other,"DIA_CipherDJG_GOTOGETHERAGAIN_07_01");	//������ ��� ��� �����!
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//��, ��. ����� �����������.
	DJG_SwampParty = TRUE;
};


instance DIA_CipherDJG_GO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GO_Condition;
	information = DIA_CipherDJG_GO_Info;
	description = "������ ����� ���������� ������, ����� ���� ����!";
};


func int DIA_CipherDJG_GO_Condition()
{
	if((DJG_SwampParty == TRUE) && !Npc_IsDead(SwampDragon))
	{
		return TRUE;
	};
};


var int DJG_SwampParty_GoGoGo;

func void DIA_CipherDJG_GO_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_GO_15_00");	//������ ����� ���������� ������, ����� ���� ����!
	AI_Output(self,other,"DIA_CipherDJG_GO_07_01");	//����� ������!
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_StopProcessInfos(self);
	DJG_SwampParty_GoGoGo = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait1");
	if(!Npc_IsDead(DJG_Rod))
	{
		if(C_BodyStateContains(DJG_Rod,BS_SIT))
		{
			AI_Standup(DJG_Rod);
		};
		DJG_Rod.npcType = NPCTYPE_FRIEND;
		DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
		B_StartOtherRoutine(DJG_Rod,"SwampWait1");
	};
};


instance DIA_CipherDJG_SwampWait2(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SwampWait2_Condition;
	information = DIA_CipherDJG_SwampWait2_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SwampWait2_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01") < 700) && !Npc_IsDead(SwampDragon))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_00");	//������ ���������� ����� �� ����������� ���������. � ��������� ���� ����� ����!
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_01");	//��, �� ����� ������ ��������� ��� ��� ������, ����� ��� ����� �� ������ �� ��� �����. ��� �� ���������?
	AI_Output(other,self,"DIA_CipherDJG_SwampWait2_15_02");	//�� ����� ������ �������!
	Info_AddChoice(DIA_CipherDJG_SwampWait2,Dialog_Ende,DIA_CipherDJG_SwampWait2_weiter);
};

func void DIA_CipherDJG_SwampWait2_weiter()
{
	AI_StopProcessInfos(self);
	DJG_SwampParty = TRUE;
	DJG_SwampParty_GoGoGo = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
	if(!Npc_IsDead(DJG_Rod))
	{
		DJG_Rod.npcType = NPCTYPE_FRIEND;
		DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
		B_StartOtherRoutine(DJG_Rod,"SwampWait2");
	};
};


instance DIA_CipherDJG_GoForSwampDragon(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GoForSwampDragon_Condition;
	information = DIA_CipherDJG_GoForSwampDragon_Info;
	important = TRUE;
};


func int DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01") < 1000) && !Npc_IsDead(SwampDragon))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GoForSwampDragon_Info()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Exit))
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_00");	//(�����) � �����!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SwampDragon");
		B_StartOtherRoutine(DJG_Rod,"SwampDragon");
	}
	else
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_01");	//� ��� ����� ��� �����. �� ������ ���� ���������!
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_02");	//��� ������ � ��������, ����� �� �� ���������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_CipherDJG_SWAMPDRAGONDEAD(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information = DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition()
{
	if(Npc_IsDead(SwampDragon) && (DJG_SwampParty == TRUE) && (DJG_SwampParty_GoGoGo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info()
{
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_00");	//����. �� �����?
	AI_Output(other,self,"DIA_CipherDJG_SWAMPDRAGONDEAD_15_01");	//���������. ��� �������!
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_02");	//��, �� � ���������.
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_CipherDJGDeadDragon);
	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	if(!Npc_IsDead(DJG_Rod))
	{
		DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
		B_StartOtherRoutine(DJG_Rod,"Start");
	};
};


instance DIA_CipherDJG_WHATNEXT(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_WHATNEXT_Condition;
	information = DIA_CipherDJG_WHATNEXT_Info;
	permanent = TRUE;
	description = "�������� ������ �����! ��� �� ������ ������ ������?";
};


func int DIA_CipherDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(SwampDragon))
	{
		return TRUE;
	};
};

var int DIA_CipherDJG_WHATNEXT_Once;

func void DIA_CipherDJG_WHATNEXT_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_WHATNEXT_15_00");	//�������� ������ �����! ��� �� ������ ������ ������?
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_01");	//������� �� ����. � ��� �� ���� �� �����. � �� ������ ������ ��������� � ������� ��� �����.
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_02");	//�������, �� ���� ����� ������� ���������. ������� ��� ����.
	if(DIA_CipherDJG_WHATNEXT_Once == FALSE)
	{
		B_LogEntry(TOPIC_Dragonhunter,"����� ������, ��� ������, ����� �������� ������ �����, �� ����� ���������� ���� ����� ��� ������� '�����'. ��� �, ���������.");
		DIA_CipherDJG_WHATNEXT_Once = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_KrautPaket_OW(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 800;
	condition = DIA_Cipher_KrautPaket_Condition;
	information = DIA_Cipher_KrautPaket_Info;
	description = "��� �������� �� ���� ��� �������� �����?";
};

instance DIA_Cipher_DarDieb_OW(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 801;
	condition = DIA_Cipher_DarDieb_Condition;
	information = DIA_Cipher_DarDieb_Info;
	description = "� ����, ��� ���� ���� �����.";
};

