
instance DIA_Jesper_EXIT(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 999;
	condition = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesper_Hallo(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Hallo_Condition()
{
	if(!Npc_IsDead(Cassia) && !Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Hallo_Info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//��, ��� �� ��� �������? ���� ��� �� �����!
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//��� ��� ����������, ��� �� ������� �����?
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"� ������ ����� ����.",DIA_Jesper_Hallo_Kill);
	Info_AddChoice(DIA_Jesper_Hallo,"� ������ ������������ �����.",DIA_Jesper_Hallo_NurSo);
	if(Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA))
	{
		if(Attila_Key == TRUE)
		{
			Info_AddChoice(DIA_Jesper_Hallo,"������ ��� ��� ����. ��� ������ � �����. ��� ��� ��� ����� �� ����?",DIA_Jesper_Hallo_Willkommen);
		}
		else if(Npc_IsDead(Attila))
		{
			Info_AddChoice(DIA_Jesper_Hallo,"� ��������� ������. ��� ��� ��� ���� �� �����������.",DIA_Jesper_Hallo_Umgelegt);
		};
	};
};

func void DIA_Jesper_Hallo_Kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//� ������ ����� ����.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//�������� ����. �� ��� �������, � ����� ����? ��, �����. ������ �� ����� ���� ������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Jesper_Hallo_NurSo()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//� ������ ������������ �����.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//����� �� ����� ������. ��� ������� ������, �������?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//��� ��� ������ ���� ������ �� ����� � ����� ���, ����� �� �����?
	if(!Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA))
	{
		Info_AddChoice(DIA_Jesper_Hallo,"������ ���� � ������ �������.",DIA_Jesper_Hallo_Anfuehrer);
	}
	else if(!Npc_IsDead(Attila))
	{
		if(Npc_HasItems(Attila,ItKe_ThiefGuildKey_MIS))
		{
			Info_AddChoice(DIA_Jesper_Hallo,"������ ���� � ������ �������.",DIA_Jesper_Hallo_Anfuehrer);
		};
	};
};

func void DIA_Jesper_Hallo_Willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//������ ��� ��� ����. ��� ������ � �����. ��� ��� ��� ����� �� ����?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//����� �� �� ������ ������ ���? �� ��������.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//��� � ������. ���� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//� ��������� ������. ��� ��� ��� ���� �� �����������.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(� ����������) �� ���� ������?! (������������) �, �����, �� ��� ����� ��� ��������� ����.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//�� � ���� ������������ ����. ���� �� �������� �� ����, � ���� ����.
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"��� �� ������� � ���� ������ ������� ����?",DIA_Jesper_Hallo_Was);
	Info_AddChoice(DIA_Jesper_Hallo,"������ ���� � ������ �������.",DIA_Jesper_Hallo_Anfuehrer);
};

func void DIA_Jesper_Hallo_Was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//��� �� ������� � ���� ������ ������� ����?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(�����) � ���� �����. ��� ���� ������ ������, � � ����� ����� �������� �����.
};

func void DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//������ ���� � ������ �������.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(������� ����) �� - � �������? � ������, ������ ������� ���������� � �����.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//��� ������ - � �� ������� �������� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Jesper_Bezahlen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Jesper_Bezahlen_Condition()
{
	if((Join_Thiefs == TRUE) && (Jesper_TeachSneak == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//�� ������ ������� ���� ����-������?
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		if(MIS_ThiefGuild_sucked == FALSE)
		{
			AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//�������, � ������, ��� ����� �������� - ��� ���� ���������.
			Jesper_TeachSneak = TRUE;
			Info_ClearChoices(DIA_Jesper_Bezahlen);
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//�� ������ ������, ��� ���������, �� ������� �� ������� �����? ��� ��������� ���� � 100 ������� �����.
			Info_ClearChoices(DIA_Jesper_Bezahlen);
			Info_AddChoice(DIA_Jesper_Bezahlen,"����� ����, �����...",DIA_Jesper_Bezahlen_Spaeter);
			Info_AddChoice(DIA_Jesper_Bezahlen,B_BuildPriceString("������, � ���� ��������� ��������.",100),DIA_Jesper_Bezahlen_Okay);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Jesper_TeachSneak = TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Spaeter()
{
	DIA_Common_MaybeLater();
	Info_ClearChoices(DIA_Jesper_Bezahlen);
};

func void DIA_Jesper_Bezahlen_Okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//������, � ���� ��������� ��������.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//��� ������.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//�������, ����� ������ �����.
		Jesper_TeachSneak = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//��� ������ �� �� ������� ������ ���������.
	};
	Info_ClearChoices(DIA_Jesper_Bezahlen);
};


instance DIA_Jesper_Schleichen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("����� ���� ��������",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1));
	description = B_BuildLearnString(NAME_Skill_Sneak,B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1));
};


func int DIA_Jesper_Schleichen_Condition()
{
	if((Jesper_TeachSneak == TRUE) && !Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Schleichen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//����� ���� ��������.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//������ �������� ����� ����� ��� ������ ����. ��������, ���� �� ������ �� ������ ����.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//��� ������ ������, ��� �� ��� ������� ������. ����������� ����� ���� ����� ������ ����.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//������ ����� �� ���������, ����� �� ������� ����, � �� ������� �������� ����������������.
	};
};


instance DIA_Jesper_Killer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Killer_Condition()
{
	if(Npc_IsDead(Cassia) || Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Killer_Info()
{
	if(Npc_IsDead(Cassia) && Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//�� ���� ���� ������. ����� �� ������ ���, ������?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//� �������� ���� � ������� �������.
	}
	else if(Npc_IsDead(Cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//������! �� ���� ������! �� �� ���� ���� �� ����!
	}
	else if(Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//� ����� ������� � ��������� � ����� ��� ���� ������ ������, ��� �� ������ ���� �����������.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//� �� ���� � ���� ���, ������� ���! �� ������ ������ ����� ��������!
	};
	B_ThievesKiller();
};


instance DIA_Jesper_Bogen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent = FALSE;
	description = "�����, �� ������ �� ������ � ���� �������?";
};


func int DIA_Jesper_Bogen_Condition()
{
	if(Mob_HasItems("BOW_CHEST",ItRw_Bow_L_03_MIS) && (MIS_Bosper_Bogen == LOG_Running) && (Join_Thiefs == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bogen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//�����, �� ������ �� ������ � ���� �������?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//�� ������ � ���� ��� ����� ������������? ��, � �������� ��� � ���� �� ��������.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//�� ��� ����� ���� ������. �� ������ ������� ���, ���� �� ������� ���� ������.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//��, ��, ������� ��, ���� ������ ������. ���� �������� �������� �����. (����������) �������, � ���� ���� �������.
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_03");
};


instance DIA_Jesper_Tuer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent = FALSE;
	description = "� ��� �� ���� �������� ������?";
};


func int DIA_Jesper_Tuer_Condition()
{
//	if((MIS_CassiaRing == LOG_SUCCESS) && (Kapitel >= 3))
	if(Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_Tuer_Info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//� ��� �� ���� �������� ������?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(����������) �� ��� ��������� ������ - ������ �������-������������ ������c�.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//�� �������� ����� ���������� ������� ����� �� ����, ��� �� ��� ��� ������ �� ������� ������� ���.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//� ���������, �� ���-�� ������� - � ��� �������� �� ������, ��� ��, ��������, � ����.
	if(Npc_HasItems(self,ItKe_Fingers))
	{
		AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//�� ���� �� ������ ���������� ������� ��� ������, ��� ���� �� ���� �������.
		B_GiveInvItems(self,other,ItKe_Fingers,1);
	};
};


instance DIA_Jesper_Truhe(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent = FALSE;
	description = "��� ������� ������� ������.";
};


func int DIA_Jesper_Truhe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jesper_Tuer))
	{
		if(Mob_HasItems("MOB_FINGERS",ItMi_Gold) < 300)
		{
			return TRUE;
		};
		if(Mob_HasItems("MOB_FINGERS",ItMi_SilverCup) < 5)
		{
			return TRUE;
		};
		if(!Mob_HasItems("MOB_FINGERS",ItMi_GoldCup))
		{
			return TRUE;
		};
		if(!Mob_HasItems("MOB_FINGERS",ItAm_Strg_01))
		{
			return TRUE;
		};
		if(!Mob_HasItems("MOB_FINGERS",ItPo_Perm_DEX))
		{
			return TRUE;
		};
	};
};

func void DIA_Jesper_Truhe_Info()
{
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//��� ������� ������� ������.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//��� ����������! ������, � ��� �������� ����� ������-�����������.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//����������!
	B_GivePlayerXP(XP_JesperTruhe);
};

