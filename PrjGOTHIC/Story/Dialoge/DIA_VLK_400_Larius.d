
instance DIA_Larius_EXIT(C_Info)
{
	npc = VLK_400_Larius;
	nr = 999;
	condition = DIA_Larius_EXIT_Condition;
	information = DIA_Larius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Larius_Hello(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = DIA_Larius_Hello_Condition;
	information = DIA_Larius_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Larius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Что ты делаешь здесь? Если тебе что-то нужно, запишись на прием.
};


instance DIA_Larius_WhoAreYou(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_WhoAreYou_Condition;
	information = DIA_Larius_WhoAreYou_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Я Лариус, губернатор.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Даже если я не кажусь тебе таковым в данный момент, я самый влиятельный человек в этом городе.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//То есть ты всем здесь заправляешь?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Я... ну... в настоящий момент мои руки связаны.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Здесь командует этот лорд Хаген, по крайней мере, пока он в городе.
};


instance DIA_Larius_Disturb(C_Info)
{
	npc = VLK_400_Larius;
	nr = 3;
	condition = DIA_Larius_Disturb_Condition;
	information = DIA_Larius_Disturb_Info;
	permanent = TRUE;
	description = "Я не хотел помешать.";
};


func int DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Я не хотел помешать.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Но, тем не менее, помешал! Убирайся!
};


instance DIA_Larius_DieLage(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_DieLage_Condition;
	information = DIA_Larius_DieLage_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Тебе до этого какое дело? Пока паладины здесь, лорд Хаген занимается всеми делами, касающимися жизни города.
};


instance DIA_Larius_Richterueberfall(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_Richterueberfall_Condition;
	information = DIA_Larius_Richterueberfall_Info;
	description = "Судья нанял бандитов, чтобы они убили тебя.";
};


func int DIA_Larius_Richterueberfall_Condition()
{
	if(SCKnowsRichterKomproBrief == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Судья нанял бандитов, чтобы они убили тебя. Я могу доказать это.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Не пори чепухи, или ты хочешь, чтобы я заковал тебя в кандалы?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Даже сели ты воин Инноса...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Даже если ты посвященный маг...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Мое слово все еще имеет вес в этом городе. Не смей даже пытаться запятнать светлое имя нашего судьи!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Larius_PICKPOCKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 900;
	condition = DIA_Larius_PICKPOCKET_Condition;
	information = DIA_Larius_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Larius_PICKPOCKET_Condition()
{
	return C_Beklauen(35,120);
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET,Dialog_Back,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

