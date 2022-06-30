
instance DIA_Balthasar_EXIT(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 999;
	condition = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Balthasar_HALLO(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 3;
	condition = DIA_Balthasar_HALLO_Condition;
	information = DIA_Balthasar_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Balthasar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Как дела?
	if((VisibleGuild(other) == GIL_NONE) || (VisibleGuild(other) == GIL_NOV) || (VisibleGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Ах, новое лицо на ферме. Неужели этот старый скряга, наконец, подарил мне ученика?
		AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Я не ученик.
		AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Ох. Понятно. Но я ведь уже не так молод, как раньше, понимаешь? И я уже много лет жду себе замену.
	};
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Ты ведь здесь не потому, что тебя послали разгневанные соседи, правда?
};


instance DIA_Balthasar_WASMACHSTDU(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 4;
	condition = DIA_Balthasar_WASMACHSTDU_Condition;
	information = DIA_Balthasar_WASMACHSTDU_Info;
	description = "А чем ты тут занимаешься?";
};


func int DIA_Balthasar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//А чем ты тут занимаешься?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Ох, я стерегу овец. Я всю свою жизнь этим занимаюсь.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Эти животные очень послушны и очень умны. Если ты хорошо с ними обращаешься, они пойдут за тобой куда угодно.
};


instance DIA_Addon_Balthasar_Rangerbandits(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Addon_Balthasar_Rangerbandits_Condition;
	information = DIA_Addon_Balthasar_Rangerbandits_Info;
	description = "Ты не видел проходящих здесь бандитов?";
};


func int DIA_Addon_Balthasar_Rangerbandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO) && ((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (SC_KnowsLuciaCaughtByBandits == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Ты не видел проходящих здесь бандитов?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Видел. Они прошли краем поля у фермы Секоба и отправились в лес на север.
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//С собой у них было огромное количество оружия. Выглядели они так, как будто собираются выиграть войну с орками.
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//И если глаза меня не обманывали, они также увели в лес молодую женщину.
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Надеюсь, они не причинили ей зла.
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Слава богам, они не зашли на нашу ферму.
	B_GivePlayerXP(XP_Ambient);
};


func void B_BalthasarLostHisSheeps()
{
	AI_WaitTillEnd(self,other);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Balthasar_PERMKAP1_05_02_add");	//Я не могу найти моих овец!
	AI_StopProcessInfos(self);
	MIS_Balthasar_BengarsWeide = LOG_OBSOLETE;
	B_CheckLog();
};

instance DIA_Balthasar_AERGERMITNACHBARN(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information = DIA_Balthasar_AERGERMITNACHBARN_Info;
	description = "А что за проблемы с соседями?";
};


func int DIA_Balthasar_AERGERMITNACHBARN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU) && ((other.guild == GIL_NONE) || (other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//А что за проблемы с соседями?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Трава в этой части большого поля чахлая и пожухлая. Поэтому я часто пасу овец на больших пастбищах других ферм.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Онар не возражает, но Бенгар, фермер, владеющий высокогорными пастбищами, каждый раз орет как резаный, когда видит моих овец там.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//Он говорит, что Секоб должен платить, если хочет пасти овец на его пастбищах.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Но Секоб скорее удавится, чем потратит хоть цент на это, поэтому я больше не хожу на плато.
};


instance DIA_Balthasar_WOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 10;
	condition = DIA_Balthasar_WOBENGAR_Condition;
	information = DIA_Balthasar_WOBENGAR_Info;
	description = "Как я могу попасть на эти высокогорные пастбища и ферму Бенгара?";
};


func int DIA_Balthasar_WOBENGAR_Condition()
{
	if(BalthasarMovedToBengar == TRUE)
	{
		return FALSE;
	};
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN))
	{
		DIA_Balthasar_WOBENGAR.description = "Как я могу попасть на эти высокогорные пастбища и ферму Бенгара?";
		return TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Rosi_BENGAR))
	{
		DIA_Balthasar_WOBENGAR.description = "Как мне попасть на ферму Бенгара?";
		return TRUE;
	};
};

func void DIA_Balthasar_WOBENGAR_Info()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN))
	{
		AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Как я могу попасть на эти высокогорные пастбища и ферму Бенгара?
	}
	else if(Npc_KnowsInfo(other,DIA_Rosi_BENGAR))
	{
		DIA_Common_WhereBengarsFarm();
	};
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Иди по этой дороге до перекрестка.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Если там ты повернешь направо, ты увидишь большую скалу. За ней, справа, и находятся высокогорные пастбища и Проход.
};


instance DIA_Balthasar_TALKTOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 6;
	condition = DIA_Balthasar_TALKTOBENGAR_Condition;
	information = DIA_Balthasar_TALKTOBENGAR_Info;
	description = "Возможно, мне стоит поговорить с Бенгаром.";
};


func int DIA_Balthasar_TALKTOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((other.guild == GIL_NONE) || (other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_TALKTOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Возможно, мне стоит поговорить с Бенгаром.
	if(!C_BalthasarSheepsDead())
	{
		AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Ты сделаешь это для меня? Но что бы ты ни говорил ему, имей в виду, я не хочу никаких проблем, хорошо?
		AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Посмотрим.
		Log_CreateTopic(TOPIC_BalthasarsSchafe,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_Running);
		B_LogEntry(TOPIC_BalthasarsSchafe,"Фермер Бенгар запретил пастуху Бальтазару пасти овец на его высокогорных пастбищах.");
		MIS_Balthasar_BengarsWeide = LOG_Running;
	}
	else
	{
		B_BalthasarLostHisSheeps();
	};
};


instance DIA_Balthasar_BENGARUEBERREDET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 8;
	condition = DIA_Balthasar_BENGARUEBERREDET_Condition;
	information = DIA_Balthasar_BENGARUEBERREDET_Info;
	description = "Ты можешь опять водить своих овец на пастбища Бенгара.";
};


func int DIA_Balthasar_BENGARUEBERREDET_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_TALKTOBENGAR) && (MIS_Balthasar_BengarsWeide == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//Ты можешь опять водить своих овец на пастбища Бенгара. Я поговорил с ним.
	if(!C_BalthasarSheepsDead())
	{
		AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Спасибо. Я отправляюсь туда прямо сейчас.
		AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Вот, возьми эти овечьи шкуры в знак моей благодарности.
		B_GiveInvItems(self,other,ItAt_SheepFur,10);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarsWeide");
		B_StartOtherRoutine(BalthasarSheep1,"NewFarm");
		B_StartOtherRoutine(BalthasarSheep2,"NewFarm");
		B_StartOtherRoutine(BalthasarSheep3,"NewFarm");
		BalthasarMovedToBengar = TRUE;
		B_GivePlayerXP(XP_Balthasar_BengarsWeide);
	}
	else
	{
		B_BalthasarLostHisSheeps();
	};
};


instance DIA_Balthasar_PERMKAP1(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 70;
	condition = DIA_Balthasar_PERMKAP1_Condition;
	information = DIA_Balthasar_PERMKAP1_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Balthasar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//Все в порядке?
	if(!C_BalthasarSheepsDead())
	{
		AI_Output(self,other,"DIA_Balthasar_PERMKAP1_05_01");	//Мне не на что жаловаться. Спасибо, что спросил.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Balthasar_PERMKAP1_05_02");	//Настали тяжелые времена. Я не могу найти моих овец!
		if(!Npc_IsDead(Sekob))
		{
			AI_Output(self,other,"DIA_Balthasar_PERMKAP1_05_03");	//Я думаю, лучше пойти к Секобу и признаться.
		};
		AI_StopProcessInfos(self);
		if(BalthasarMovedToBengar == TRUE)
		{
			if(Kapitel < 3)
			{
				Npc_ExchangeRoutine(self,"Start");
			}
			else if(C_SekobDementorsDead())
			{
				Npc_ExchangeRoutine(self,"Start");
			}
			else
			{
				Npc_ExchangeRoutine(self,"FleeDMT");
			};
			BalthasarMovedToBengar = FALSE;
		};
	};
};

