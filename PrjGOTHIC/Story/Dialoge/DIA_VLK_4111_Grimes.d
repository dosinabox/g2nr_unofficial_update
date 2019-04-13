
instance DIA_Grimes_EXIT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 999;
	condition = DIA_Grimes_EXIT_Condition;
	information = DIA_Grimes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int Grimes_First;

func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimes_Hallo(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Hallo_Condition;
	information = DIA_Grimes_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Grimes_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//Ты? Кто бы мог подумать, что мы опять свидимся!
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Похоже, мы оба умеем выживать, но, как видишь, я застрял в этой шахте.
	if(Grimes_First == FALSE)
	{
		Wld_InsertNpc(Snapper,"OW_PATH_148_A");
		Wld_InsertNpc(Snapper,"OW_PATH_146");
		Wld_InsertNpc(Snapper,"OW_PATH_147");
		Wld_InsertNpc(Snapper,"OW_PATH_148");
		Wld_InsertNpc(Snapper,"OW_PATH_264");
		Grimes_First = TRUE;
	};
};


instance DIA_Grimes_Erz(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Erz_Condition;
	information = DIA_Grimes_Erz_Info;
	permanent = FALSE;
	description = "Сколько руды вам удалось добыть?";
};


func int DIA_Grimes_Erz_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Erz_Info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Сколько руды вам удалось добыть?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Несколько ящиков. Но их здесь уже нет.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Паладин Маркос решил отправить руду в замок, так как нас все время атаковали орки.
};


instance DIA_Grimes_Weg(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 3;
	condition = DIA_Grimes_Weg_Condition;
	information = DIA_Grimes_Weg_Info;
	permanent = FALSE;
	description = "Ты знаешь, в каком направлении пошел Маркос?";
};


func int DIA_Grimes_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Erz) && (Npc_KnowsInfo(other,DIA_Marcos_Garond) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Ты знаешь, в каком направлении пошел Маркос?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Он не пошел прямой дорогой.  Вместо этого он хотел пересечь реку там, где она замерзла.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Он хотел пойти в обход и подойти к замку с запада.
};


instance DIA_Grimes_Grimes(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Grimes_Condition;
	information = DIA_Grimes_Grimes_Info;
	permanent = FALSE;
	description = "Ты хочешь покинуть Долину?";
};


func int DIA_Grimes_Grimes_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_Grimes_Info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Ты хочешь покинуть Долину?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Нет, я лучше продолжу добывать руду.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Я не позволю каким-то оркам остановить меня - я и не такое видал.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Как тогда, когда мы работали в старой шахте и неожиданно прорвалась вода...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//Но это старая история.
};


instance DIA_Grimes_PERM(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_PERM_Condition;
	information = DIA_Grimes_PERM_Info;
	permanent = TRUE;
	description = "Как твоя работа?";
};


func int DIA_Grimes_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Как твоя работа?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Эта скала ужасно твердая - она как будто не хочет отдавать нам руду.
};


instance DIA_Grimes_PICKPOCKET(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 900;
	condition = DIA_Grimes_PICKPOCKET_Condition;
	information = DIA_Grimes_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Grimes_PICKPOCKET_Condition()
{
	return C_Beklauen(43,21);
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,Dialog_Back,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

