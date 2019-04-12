
instance DIA_Gestath_EXIT(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 999;
	condition = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_EXIT_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(����) ������� �������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gestath_HALLO(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_HALLO_Condition;
	information = DIA_Gestath_HALLO_Info;
	description = "��� ����?";
};


func int DIA_Gestath_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(����) ��� ������������ �������� - ������ ����. � �� �� ����������, �����?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices(DIA_Gestath_HALLO);
	Info_AddChoice(DIA_Gestath_HALLO,"��� ����� ���� �����������?",DIA_Gestath_HALLO_waszusehen);
	Info_AddChoice(DIA_Gestath_HALLO,"� ��� �� ������� �����?",DIA_Gestath_HALLO_was);
};

func void DIA_Gestath_HALLO_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//� ���� ������� �������.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//��. ����� ������� �����. ��� �� �������� ���������. ������ �� ����� ����� ������ �� ��� ����.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//� ��� ����������� �����, � �������. ��� ��� ���� �������� ���������, � ���� ���� ������ ������� ���� ������. ���� ������ - ������.
	Wolf_ProduceCrawlerArmor = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,Dialog_Back,DIA_Gestath_HALLO_Back);
	Info_AddChoice(DIA_Gestath_HALLO,"� ��� ������ �����?",DIA_Gestath_HALLO_plate_woWolf);
};

func void DIA_Gestath_HALLO_plate_woWolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//� ��� ������ �����?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//� ����� ��� �� ����� ���. ������ �� ��� ��������� �����, � �������.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//� �����, �� ��� ��� �� ������ �������.
};

func void DIA_Gestath_HALLO_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//� ��� �� ������� �����?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//����������� ������.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//�����, ��� ��� ������?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//� �������. ��������������� �� ������� �������.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//�������� �����, ��������, �������� ��������... ������ �� �������� �� ����� ������. ��� �������� �������� ������.
	Info_AddChoice(DIA_Gestath_HALLO,"� ���� ������� �������.",DIA_Gestath_HALLO_plate);
};

func void DIA_Gestath_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//��� ����� ���� �����������?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//���� �������� ������, ����� � ��� �� ���� ����. ������ � �� �����.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//� ���� �� �� ���������. �����, ��� ����� ���, �� �������� ����������.
};

func void DIA_Gestath_HALLO_Back()
{
	Info_ClearChoices(DIA_Gestath_HALLO);
};


instance DIA_Gestath_Drachen(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_Drachen_Condition;
	information = DIA_Gestath_Drachen_Info;
	permanent = TRUE;
	description = "�� ������ ��������� ��������?";
};


var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_Drachen_Info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//�� ������ ��������� ��������?
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_01");	//(�������) ������ ���� �� ���� �������, ����� ������ ����� � ����-������ ���������, ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//�������. ������ ���?
		Gestath_DragonTrophy = TRUE;
	};
};


instance DIA_Gestath_TEACHHUNTING(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 12;
	condition = DIA_Gestath_TEACHHUNTING_Condition;
	information = DIA_Gestath_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "����� ���� ��������� ��������.";
};


func int DIA_Gestath_TEACHHUNTING_Condition()
{
	if(Gestath_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Gestath_TEACHHUNTING_OneTime;

func void DIA_Gestath_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//����� ���� ��������� ��������.
	if((player_talent_takeanimaltrophy[TROPHY_FireTongue] == FALSE) || (player_talent_takeanimaltrophy[TROPHY_CrawlerPlate] == FALSE) || (player_talent_takeanimaltrophy[TROPHY_Mandibles] == FALSE) || (player_talent_takeanimaltrophy[TROPHY_DrgSnapperHorn] == FALSE) || ((Gestath_DragonTrophy == TRUE) && ((player_talent_takeanimaltrophy[TROPHY_DragonScale] == FALSE) || (player_talent_takeanimaltrophy[TROPHY_DragonBlood] == FALSE))))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//������ ���? � ���� ���� ������� ���������� �������.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//��� �� ������ ������?
		};
		Info_AddChoice(DIA_Gestath_TEACHHUNTING,Dialog_Back,DIA_Gestath_TEACHHUNTING_BACK);
		if(player_talent_takeanimaltrophy[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_TEACHHUNTING_FireTongue);
		};
		if(player_talent_takeanimaltrophy[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("�������� �������� ���������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_TEACHHUNTING_CrawlerPlate);
		};
		if(player_talent_takeanimaltrophy[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_TEACHHUNTING_Mandibles);
		};
		if(player_talent_takeanimaltrophy[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("��� ���������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(player_talent_takeanimaltrophy[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("�������� ����� ��������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_TEACHHUNTING_DragonScale);
			};
			if(player_talent_takeanimaltrophy[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,B_BuildLearnString("���� ����� �������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//������ � ���� �� �����������, ���� ��� ����� ������� ����.
	};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//���� ��������� ����� ����� �������� ����� ������ ��������� ����, ��������� ��� ��� ���� ������ �����.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//����� ����� ������� � ��������, ����� ������� ������� ���.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//��������� ����� ������� � ������ ������� �������� � ���������. ����� �������� ��, ����� ��������� ��������� ������.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//����� ����� �������� ��� ���������� �������� �� ������ ��� ������ �������� ����.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//����� ������� ����� ������ ��������. �� ����� �� ��� �������, ��� � ���� ������ �� ���������, ��� - � ��� ��� �� ����������.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//����� ����� ����� ����� �� �����. ����� ������ ����� � ����� ���� ������ ���.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};


instance DIA_Gestath_PICKPOCKET(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 900;
	condition = DIA_Gestath_PICKPOCKET_Condition;
	information = DIA_Gestath_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Gestath_PICKPOCKET_Condition()
{
	return C_Beklauen(81,350);
};

func void DIA_Gestath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,Dialog_Back,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};
