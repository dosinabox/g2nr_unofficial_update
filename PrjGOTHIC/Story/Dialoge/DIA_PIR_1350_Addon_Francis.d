
instance DIA_Addon_Francis_EXIT(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 999;
	condition = DIA_Addon_Francis_EXIT_Condition;
	information = DIA_Addon_Francis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Francis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Francis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Francis_First(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 1;
	condition = DIA_Addon_Francis_First_Condition;
	information = DIA_Addon_Francis_First_Info;
	permanent = FALSE;
	description = "Это твоя хижина?";
};


func int DIA_Addon_Francis_First_Condition()
{
	if((Knows_GregsHut == FALSE) && (Francis_ausgeschissen == FALSE) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_First_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//Это твоя хижина?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//Нет, она принадлежит Грегу.
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Francis_LetMeIn(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 2;
	condition = DIA_Addon_Francis_LetMeIn_Condition;
	information = DIA_Addon_Francis_LetMeIn_Info;
	permanent = FALSE;
	description = "Я должен попасть в хижину Грега.";
};


func int DIA_Addon_Francis_LetMeIn_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Francis_First) || (Knows_GregsHut == TRUE)) && (Francis_ausgeschissen == FALSE) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_LetMeIn_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//Я должен попасть в хижину Грега.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//И думать забудь!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Грега сейчас нет. А я запер дверь, чтобы его не ограбили ненароком.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//Так что лучше не лезь, а то пожалеешь!
};


instance DIA_Addon_Francis_AboutGreg(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 3;
	condition = DIA_Addon_Francis_AboutGreg_Condition;
	information = DIA_Addon_Francis_AboutGreg_Info;
	permanent = FALSE;
	description = "Грег - твой начальник?";
};


func int DIA_Addon_Francis_AboutGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && (Francis_ausgeschissen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AboutGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Грег - твой начальник?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//Только не пытайся мне сказать, что ты его знаешь!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Любой моряк... да что там, даже последняя сухопутная крыса знает ужасного капитана Грега!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(высокомерно) А он оставил за главного МЕНЯ!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//Я должен заставлять этих лентяев исполнять его приказы!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//Некоторые думают, что теперь, пока капитана нет, они могут делать все, что им заблагорассудится.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Они ОЧЕНЬ удивятся, когда Грег вернется.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//Я ему все расскажу о том, что здесь происходило, понятно?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//Я также расскажу ему о тех, кто пытался проникнуть в его жилище.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//Поэтому проваливай, или у тебя будут большие неприятности.
};


var int Francis_bezahlt;

instance DIA_Addon_Francis_Key(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 4;
	condition = DIA_Addon_Francis_Key_Condition;
	information = DIA_Addon_Francis_Key_Info;
	permanent = TRUE;
	description = "Отдай мне ключ от хижины Грега!";
};


func int DIA_Addon_Francis_Key_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Key_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Отдай мне ключ от хижины Грега!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//Должно быть, ты шутишь!
	Info_ClearChoices(DIA_Addon_Francis_Key);
	Info_AddChoice(DIA_Addon_Francis_Key,"Я подумаю над этим.",DIA_Addon_Francis_Key_BACK);
	Info_AddChoice(DIA_Addon_Francis_Key,"Я дам тебе 2000 золотых!",DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice(DIA_Addon_Francis_Key,"Я дам тебе 1000 золотых!",DIA_Addon_Francis_Key_1000Gold);
};

func void DIA_Addon_Francis_Key_BACK()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Я подумаю над этим.
	Info_ClearChoices(DIA_Addon_Francis_Key);
};

func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//Я дам тебе 1000 золотых!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//Боюсь, что для предательства капитана этого недостаточно.
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//Следи за словами, или у тебя будут неприятности!
};

func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//Я дам тебе 2000 золотых!
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Слушай, ты просишь меня устроить бунт на корабле.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(самому себе) Хотя, с другой стороны...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Ну ладно, давай деньги. В конце концов, мы никому не скажем.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Вот ключ!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//Быстрее, пока Грег не вернулся. И не смей никому рассказывать об этом, понял?!
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		B_GiveInvItems(self,other,ItKe_Greg_Addon_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(смеется) Ха! Готов поспорить, у тебя столько нет!
	};
	Info_ClearChoices(DIA_Addon_Francis_Key);
};


instance DIA_Addon_Francis_AufsMaul(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_AufsMaul_Condition;
	information = DIA_Addon_Francis_AufsMaul_Info;
	permanent = TRUE;
	description = "Что ж, тогда посмотрим, как ты собираешься меня остановить.";
};


func int DIA_Addon_Francis_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//Что ж, тогда посмотрим, как ты собираешься меня остановить.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(пронзительно) Что? Здесь я капитан!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//Ах ты, крыса сухопутная, я научу тебя проявлять уважение!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Francis_Buch(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_Buch_Condition;
	information = DIA_Addon_Francis_Buch_Info;
	permanent = TRUE;
	description = "Я нашел твое укрытие. Твои деньги и бухгалтерскую книгу.";
};


func int DIA_Addon_Francis_Buch_Condition()
{
//	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis))
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis) && (Francis_HasProof == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Buch_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//Я нашел твое укрытие. Твои деньги и бухгалтерскую книгу. Это же твоя книга, не так ли?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Эээ... Никогда раньше не видел этой книги.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//И... эээ... даже ЕСЛИ БЫ это была моя книга...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//Ты же не думаешь, что парни поверят ТЕБЕ, не так ли?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//Ты обманул их и лишил законной добычи.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Эээ... подожди немного...
	if(Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(заискивающе) Тебе же нужен был ключ от хижины Грега, не так ли?
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//Я ДАМ ТЕБЕ этот ключ!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//Там внутри много ценного...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(нервно) Но ты должен отдать мне книгу и держать свой рот на замке, идет?
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItem(self,ITWR_Addon_FrancisAbrechnung_Mis);
		B_GiveInvItems(self,other,ItKe_Greg_Addon_MIS,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Не делай глупостей!
		if((Francis_bezahlt == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Вот твои 2000 золотых.
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//А от себя я добавлю еще 500 золотых.
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Вот, держи 500 золотых!
			B_GiveInvItems(self,other,ItMi_Gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(торопливо) А теперь давай мне сюда эту штуку...
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItem(self,ITWR_Addon_FrancisAbrechnung_Mis);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Francis_PICKPOCKET(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_PICKPOCKET_Condition;
	information = DIA_Francis_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Key;
};


func int DIA_Francis_PICKPOCKET_Condition()
{
//	return C_StealItems(40,Hlp_GetInstanceID(ItKe_Greg_Addon_MIS),1);
	if(Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return C_StealItem(40,Hlp_GetInstanceID(ItKe_Greg_Addon_MIS));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Francis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
	Info_AddChoice(DIA_Francis_PICKPOCKET,Dialog_Back,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Francis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Francis_PICKPOCKET_DoIt);
};

func void DIA_Francis_PICKPOCKET_DoIt()
{
//	B_StealItems(40,Hlp_GetInstanceID(ItKe_Greg_Addon_MIS),1);
	B_StealItem(40,Hlp_GetInstanceID(ItKe_Greg_Addon_MIS));
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};

func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};


instance DIA_Francis_Ausgeschissen(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_Ausgeschissen_Condition;
	information = DIA_Francis_Ausgeschissen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Francis_Ausgeschissen_Condition()
{
	if((Francis_ausgeschissen == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Francis_Ausgeschissen_Info()
{
	if(!Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(гневно) Благодаря тебе Грег заставил меня пилить дрова до тех пор, пока на острове не останется ни одного дерева.
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//Оставь меня в покое!
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis) && (Francis_HasProof == TRUE))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");	//Не так быстро, мой друг.
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

