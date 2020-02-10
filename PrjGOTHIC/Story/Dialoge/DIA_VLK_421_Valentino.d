
instance DIA_Valentino_EXIT(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 999;
	condition = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Valentino_HALLO(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 1;
	condition = DIA_Valentino_HALLO_Condition;
	information = DIA_Valentino_HALLO_Info;
	permanent = FALSE;
	description = "Так, и что у нас здесь?";
};


func int DIA_Valentino_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Так, и что у нас здесь?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//Меня зовут Валентино. Я пытаюсь не осквернить этот день, данный мне Инносом, своей работой.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Придержи язык.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Ох, прошу прощения, я не хотел оскорбить нашего Владыку. Еще раз прошу простить меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Ты незнаком с хорошими манерами? Это отвратительно!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Повсюду этот грязный сброд. У тебя что, нет работы, которой ты должен заниматься?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//Но, я полагаю, никто не хватится такого бездельника как ты, да?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//Ну, если бы у тебя было столько же золота, сколько у меня, ты бы уж тоже не работал. Но тебе никогда не стать таким богатым.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//Ты такой забавный.
	};
};


instance DIA_Valentino_WhoAgain(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 2;
	condition = DIA_Valentino_WhoAgain_Condition;
	information = DIA_Valentino_WhoAgain_Info;
	permanent = FALSE;
	description = "Я спросил тебя, кто ты такой!";
};


func int DIA_Valentino_WhoAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//Я спросил тебя, кто ты такой!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//Я Валентино Великолепный. Бонвиван и любимчик женщин.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Бедный заботами, богатый мудростью и золотом, женщины так и бросаются на меня.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//Если у тебя есть проблемы, держи их при себе. Мне они не нужны.
};


instance DIA_Valentino_Manieren(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 3;
	condition = DIA_Valentino_Manieren_Condition;
	information = DIA_Valentino_Manieren_Info;
	permanent = FALSE;
	description = "Похоже, мне придется поучить тебя хорошим манерам!";
};


func int DIA_Valentino_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//(вздыхает) Похоже, мне придется поучить тебя хорошим манерам!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Меня это не волнует! Молоти меня, сколько хочешь. А когда я встану завтра утром, я опять буду красавчиком.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//Но тебе придется жить дальше с этим преступлением до конца своих дней.
};


var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;

instance DIA_Valentino_WASNUETZLICHES(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 4;
	condition = DIA_Valentino_WASNUETZLICHES_Condition;
	information = DIA_Valentino_WASNUETZLICHES_Info;
	permanent = TRUE;
	description = "Ты еще что-нибудь можешь сказать мне?";
};


func int DIA_Valentino_WASNUETZLICHES_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(спокойно) Ты еще что-нибудь можешь сказать мне?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if((Valentino_Lo_Perm == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Стань популярным, никогда ничего никому не обещай, бери то, что можешь, и смотри, чтобы не ввязаться в драку с ополчением.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Или с ревнивым мужем, конечно. Это хуже всего, уж поверь мне.
		Valentino_Lo_Perm = TRUE;
	}
	else if((Valentino_Hi_Perm == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//Для человека в твоем положении нет ничего невозможного. Ты просто должен знать, когда нужно действовать.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//Так что не теряй времени и действуй.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//Я сказал тебе все, что тебе нужно знать. Остальное за тобой.
	};
};


instance DIA_Valentino_PICKPOCKET(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 900;
	condition = DIA_Valentino_PICKPOCKET_Condition;
	information = DIA_Valentino_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Key;
};


func int DIA_Valentino_PICKPOCKET_Condition()
{
//	return C_StealItems(30,Hlp_GetInstanceID(ItKe_Valentino),1);
	if(Npc_HasItems(self,ItKe_Valentino))
	{
		return C_StealItem(30,Hlp_GetInstanceID(ItKe_Valentino));
	};
	return FALSE;
};

func void DIA_Valentino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,Dialog_Back,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Valentino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
//	B_StealItems(30,Hlp_GetInstanceID(ItKe_Valentino),1);
	B_StealItem(30,Hlp_GetInstanceID(ItKe_Valentino));
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
};

func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
};

