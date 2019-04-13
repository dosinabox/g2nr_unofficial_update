
instance DIA_Addon_BL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_13_EXIT_Condition;
	information = DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_EXIT_Info()
{
	BDT_13_Nerver = 0;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_13_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_13_Chef_Condition;
	information = DIA_Addon_BL_BDT_13_Chef_Info;
	permanent = TRUE;
	description = "Кто здесь главный?";
};


func int DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Chef_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Кто здесь главный?
	if(RavenIsDead == TRUE)
	{
		if(Npc_IsDead(Thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//(торжественно) Наш славный командир Торус. Он сделает нас всех богатыми!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//Наш славный лидер... мм... даже не знаю...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//(торжественно) Наш славный командир Ворон. Он сделает нас всех богатыми!
	};
};


instance DIA_Addon_BL_BDT_13_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_13_Lager_Condition;
	information = DIA_Addon_BL_BDT_13_Lager_Info;
	permanent = TRUE;
	description = "Что ты знаешь про лагерь?";
};


func int DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//Что ты знаешь про лагерь?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Поговори со Снафом, если тебе нужна информация. Этот жирный повар многое знает.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//Если тебе надо будет что-нибудь купить, поговори с Фиском. У него есть всякие штуки...
};


instance DIA_Addon_BL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_13_News_Condition;
	information = DIA_Addon_BL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Какие новости?";
};


func int DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//Какие новости?
	if(RavenIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Ворон мертв. Теперь нам НИКОГДА не выбраться с этого острова.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//Пираты подняли паруса и уплыли.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Теперь на берегу сидит лишь пара идиотов, и у них нет нормального корабля.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Сам Белиар не знает, как мы отсюда выберемся.
	};
};


instance DIA_Addon_BL_BDT_13_Gold(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_13_Gold_Condition;
	information = DIA_Addon_BL_BDT_13_Gold_Info;
	permanent = TRUE;
	description = "Как мне достать много золота и побыстрее?";
};


func int DIA_Addon_BL_BDT_13_Gold_Condition()
{
	if((MIS_Send_Buddler != LOG_Running) || (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_13_Gold_Info()
{
	BDT_13_Nerver = BDT_13_Nerver + 1;
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//Как мне достать много золота и побыстрее?
	if(BDT_13_Nerver <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Хороший вопрос. Разве мы все не за этим здесь?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Тебе нужно взять у Торуса красный камень, тогда ты сможешь войти в шахту.
	}
	else if(BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//Эй, что ты вертишься вокруг меня? Пошел вон!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_Nerver = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//Кончились игры и веселье!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_13(var C_Npc slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc = Hlp_GetInstanceID(slf);
};

