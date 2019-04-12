
instance DIA_Addon_Malcom_EXIT(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 999;
	condition = DIA_Addon_Malcom_EXIT_Condition;
	information = DIA_Addon_Malcom_EXIT_Info;
	permanent = TRUE;
	description = "Я должен идти.";
};


func int DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//Я должен идти.
	if(MalcomBotschaft == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Не попадись в когти хищникам. Здесь довольно опасно.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Эй! Когда доберешься до нашего лагеря, передай от меня кое-что Генри.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//Скажи ему, что деревья здесь чертовски твердые.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//Ему придется еще подождать.
		MalcomBotschaft = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Malcom_PICKPOCKET(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 900;
	condition = DIA_Addon_Malcom_PICKPOCKET_Condition;
	information = DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Addon_Malcom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,Dialog_Back,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};

func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};


instance DIA_Addon_Malcom_Hello(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 1;
	condition = DIA_Addon_Malcom_Hello_Condition;
	information = DIA_Addon_Malcom_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Malcom_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//Ты не отсюда, верно?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//Похоже, ты проделал дальний путь.
};


instance DIA_Addon_Malcom_WasMachen(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 2;
	condition = DIA_Addon_Malcom_WasMachen_Condition;
	information = DIA_Addon_Malcom_WasMachen_Info;
	description = "Ты занят?";
};


func int DIA_Addon_Malcom_WasMachen_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Ты занят?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//И не спрашивай... Генри хочет, чтобы я срубил все эти деревья.
	if(Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Генри?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//Он командует нашей группой.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//Постоянно стоит у ворот лагеря и разглагольствует.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//Говорит, что надо самоотверженно трудиться на благо общества и все такое.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//Но сам-то он и пальцем не шевелит.
};


instance DIA_Addon_Malcom_Entertrupp(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 5;
	condition = DIA_Addon_Malcom_Entertrupp_Condition;
	information = DIA_Addon_Malcom_Entertrupp_Info;
	description = "Генри - ваш командир?";
};


func int DIA_Addon_Malcom_Entertrupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Entertrupp_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Генри - ваш командир?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Да, командир нашего боевого отряда.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//А нашего капитана зовут Грег.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//Но сейчас его здесь нет.
	};
};


instance DIA_Addon_Malcom_Lager(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 3;
	condition = DIA_Addon_Malcom_Lager_Condition;
	information = DIA_Addon_Malcom_Lager_Info;
	description = "А где находится ваш лагерь?";
};


func int DIA_Addon_Malcom_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//А где находится ваш лагерь?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Продолжай идти по этой дороге на запад.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//Довольно скоро ты увидишь Генри.
};

