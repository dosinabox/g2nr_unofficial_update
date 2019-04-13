
instance DIA_Lee_DI_EXIT(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 999;
	condition = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_DI_Hallo(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_Hallo_Condition;
	information = DIA_Lee_DI_Hallo_Info;
	description = "Что ты будешь делать?";
};


func int DIA_Lee_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_Hallo_15_00");	//Что ты будешь делать?
	AI_Output(self,other,"DIA_Lee_DI_Hallo_04_01");	//Кто-то должен охранять корабль. Я останусь здесь и позабочусь, чтобы он был на месте, когда ты вернешься.
};


instance DIA_Lee_DI_PERM6(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_PERM6_Condition;
	information = DIA_Lee_DI_PERM6_Info;
	permanent = TRUE;
	description = "Как мой корабль?";
};


func int DIA_Lee_DI_PERM6_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_DI_Hallo) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_PERM6_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Как мой корабль?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Не волнуйся. Я держу все под контролем.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_02");	//Все отлично. Эти жалкие орки могут возвращаться, когда хотят. Я опять устрою им взбучку.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lee_DI_Teach(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 10;
	condition = DIA_Lee_DI_Teach_Condition;
	information = DIA_Lee_DI_Teach_Info;
	permanent = TRUE;
	description = "Я хочу потренироваться.";
};


func int DIA_Lee_DI_Teach_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Я хочу потренироваться.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//Что именно ты хочешь улучшить?
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Твоя защита ужасна, но мы что-нибудь сделаем с этим.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Твои кисти слишком напряжены. Ты должен держать оружие свободнее.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Всегда помни: боковой удар должен идти от бедра, а не от запястья.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Сильнейший удар бесполезен, если он приходится в никуда. Так что старайся точно рассчитывать удары.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_DI_Teach);
};


instance DIA_Lee_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_UndeadDragonDead_Condition;
	information = DIA_Lee_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Мы можем отчаливать.";
};


func int DIA_Lee_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Lee_DI_UndeadDragonDead_OneTime;

func void DIA_Lee_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_00");	//Мы можем отчаливать. Враг мертв.
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_01");	//Очень хорошо. Тогда скажи капитану, чтобы поднимал якорь.
	if((DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_02");	//Ты ведь доставишь меня на материк, да?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_03");	//Да. Хоринис проживет и без тебя.
		AI_Output(self,other,"DIA_Lee_Add_04_26");	//Значит, я наконец, смогу нанести так долго откладываемый визит вежливости королю.
		AI_Output(self,other,"DIA_Lee_Add_04_27");	//Я столько ждал этого...
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_05");	//Как ты думаешь? Разве терпение не должно быть вознаграждено?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_06");	//Терпение и убийственные доводы.
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_07");	//(смеется) Да. Без хорошего отряда ничего не получится. Для меня было большой честью биться с тобой бок о бок.
		DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_08");	//Может быть, когда-нибудь наши пути пересекутся вновь...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Lee_DI_PICKPOCKET(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 900;
	condition = DIA_Lee_DI_PICKPOCKET_Condition;
	information = DIA_Lee_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Lee_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(110,570);
};

func void DIA_Lee_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET,Dialog_Back,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

