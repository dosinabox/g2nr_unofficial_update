
instance DIA_Sarah_EXIT(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 999;
	condition = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_PICKPOCKET(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 900;
	condition = DIA_Sarah_PICKPOCKET_Condition;
	information = DIA_Sarah_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Sarah_PICKPOCKET_Condition()
{
	return C_Beklauen(57,60);
};

func void DIA_Sarah_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,Dialog_Back,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};


instance DIA_Sarah_Greet(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 1;
	condition = DIA_Sarah_Greet_Condition;
	information = DIA_Sarah_Greet_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_Greet_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Greet_Info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Ах! Опять ты!
};


instance DIA_Sarah_HALLO(C_Info)
{
	npc = VLK_470_Sarah;
	condition = DIA_Sarah_HALLO_Condition;
	information = DIA_Sarah_HALLO_Info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int DIA_Sarah_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sarah_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Как торговля?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Когда пришли паладины, я сначала думала, что это хорошо для бизнеса.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Но теперь Гарад делает для них оружие, а ни я, ни Хакон еще не получили от них ни одной монеты.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//И, что еще хуже, фермеры больше не поставляют нам продовольствие, и цены на все взлетели до небес.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//Одно маленькое утешение - паладины оплачивают мою комнату в отеле.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Сара торгует оружием на рыночной площади.");
};


instance DIA_Sarah_Bauern(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 2;
	condition = DIA_Sarah_Bauern_Condition;
	information = DIA_Sarah_Bauern_Info;
	permanent = FALSE;
	description = "А что за проблема с фермерами?";
};


func int DIA_Sarah_Bauern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Bauern_Info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//А что за проблема с фермерами?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Они отказываются поставлять нам продовольствие.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Теперь, когда корабли больше не заходят в наш порт, город полностью зависит от продуктов, производимых нашими фермерами.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//А Онар, самый крупный фермер, нанял наемников, чтобы защищать свою ферму от городской стражи. До этого они забирали у него все подчистую.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Но наемники не просто охраняют ферму Онара.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Они добрались даже до маленьких ферм у города, и запугивают их владельцев.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Я видела их, когда ходила на ферму Акила. Не хотела бы я сейчас оказаться на его месте.
};


instance DIA_Sarah_AkilsHof(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 3;
	condition = DIA_Sarah_AkilsHof_Condition;
	information = DIA_Sarah_AkilsHof_Info;
	permanent = FALSE;
	description = "Где мне найти ферму Акила?";
};


func int DIA_Sarah_AkilsHof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_Bauern))
	{
		return TRUE;
	};
};

func void DIA_Sarah_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Где мне найти ферму Акила?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Если выйдешь из восточных ворот и пойдешь по дороге направо, скоро ты увидишь каменную лестницу.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//Она ведет прямо к ферме Акила.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Но я бы сейчас туда не совалась - эти наемники наверняка все еще там.
};


instance DIA_Sarah_Trade(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_Trade_Condition;
	information = DIA_Sarah_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Sarah_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO) && (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Покажи мне свои товары.
	Sarah_WaffenGesehen = TRUE;
};


instance DIA_Sarah_IMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_IMKNAST_Condition;
	information = DIA_Sarah_IMKNAST_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_IMKNAST_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Sarah_IMKNAST_Info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ты! Ты осмелился появиться здесь! Я, конечно не могу доказать этого, но я готова поклясться, что это твоих рук дело!
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Это ты виноват, что я здесь. Ты и этот проклятый Кантар - да накажет вас Иннос!
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_Success(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = DIA_Sarah_Success_Condition;
	information = DIA_Sarah_Success_Info;
	permanent = FALSE;
	description = "Кантар пытался подставить тебя ...";
};


func int DIA_Sarah_Success_Condition()
{
	if(Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sarah_Success_Info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Кантар пытался подставить тебя и заполучить твой прилавок. Но я сдал его городской страже.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Ты этим нажил себе очень опасного врага. Я давно знаю этого ублюдка. И он всегда хотел заполучить мой прилавок.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Возьми это оружие в знак моей благодарности.
	B_GivePlayerXP(XP_CantharImKnast);
	B_GiveInvItems(self,other,ItMw_Piratensaebel,1);
};

