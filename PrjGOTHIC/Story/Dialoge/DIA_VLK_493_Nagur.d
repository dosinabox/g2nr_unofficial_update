
instance DIA_Nagur_EXIT(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 999;
	condition = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_PICKPOCKET(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 900;
	condition = DIA_Nagur_PICKPOCKET_Condition;
	information = DIA_Nagur_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Nagur_PICKPOCKET_Condition()
{
	return C_Beklauen(75,150);
};

func void DIA_Nagur_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
	Info_AddChoice(DIA_Nagur_PICKPOCKET,Dialog_Back,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nagur_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};

func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};


instance DIA_Nagur_Hallo(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 2;
	condition = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Hallo_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Эй, у меня нет времени, чтобы болтать с тобой. Если тебе нужна информация, поговори с Кардифом.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Послушай, оставь меня в покое, хорошо?
		AI_StopProcessInfos(self);
	};
};


var int NagurHack;

func void B_Nagur_Abfertigen()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_MIL_M) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_PAL_M) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_PAl_H) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_NOV_L) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_KDF_L) == FALSE) && (Hlp_IsItem(heroArmor,ItAr_KDF_H) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//Ты думаешь, я не узнаю тебя, раз ты надел другую одежду?!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(заговорщицки) Не суй нос туда, куда не следует!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Проваливай!
	MIS_Nagur_Bote = LOG_SUCCESS;
	NagurHack = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Job(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 3;
	condition = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent = FALSE;
	description = "Кардиф говорит, что у тебя может быть работа для меня.";
};


func int DIA_Nagur_Job_Condition()
{
	if(DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Nagur_Job_Info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Кардиф говорит, что у тебя может быть работа для меня.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//Здесь, в гавани НЕТ работы для людей из монастыря! (смеется)
		B_Nagur_Abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//Здесь, в гавани НЕТ работы для королевских солдат.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(оценивающе) Так, так... Ты ищешь особенную работу. Ладно. Но будем играть по моим правилам, понятно?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//Что это значит?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//Это значит, что ты будешь делать, что я скажу, и будешь получать треть от навара.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//Если тебя это не устраивает, то у меня нет работы для тебя.
		Info_ClearChoices(DIA_Nagur_Job);
		Info_AddChoice(DIA_Nagur_Job,"Мы партнеры. Поэтому пятьдесят на пятьдесят. ",DIA_Nagur_Job_Halbe);
		Info_AddChoice(DIA_Nagur_Job,"Хорошо, ты здесь главный.",DIA_Nagur_Job_Klar);
	};
};

func void DIA_Nagur_Job_Klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//Хорошо, ты здесь главный.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Отлично. Тогда дай мне знать, когда будешь готов заработать кучу золота.
	Nagur_Deal = 80;
	Info_ClearChoices(DIA_Nagur_Job);
};

func void DIA_Nagur_Job_Halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//Мы партнеры. Поэтому пятьдесят на пятьдесят.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//Хорошо, это разумно. Конечно же, мы будем делить заработанное честно.
	Nagur_Deal = 120;
	Info_ClearChoices(DIA_Nagur_Job);
};


instance DIA_Nagur_Auftrag(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 4;
	condition = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent = FALSE;
	description = "Договорились. Так какой у тебя план?";
};


func int DIA_Nagur_Auftrag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Nagur_Job) && (MIS_Nagur_Bote != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//Договорились. Так какой у тебя план?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//Ты знаешь торговца Бальтрама, нет? Если нет, пришло время поговорить с ним.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//У этого Бальтрама есть посыльный, доставлявший ему товары с фермы Акила.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//Вернее у него БЫЛ посыльный, пока я не перерезал ему глотку. И теперь Бальтраму придется искать нового мальчика на побегушках. И им будешь ты.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Ты должен поступить на работу к Бальтраму и взять посылку у Акила.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//Затем ты принесешь ее мне, а я продам ее заинтересованному покупателю. Он даст неплохую цену за нее.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//И не пытайся продать эти товары сам. Ты все понял?
	Info_ClearChoices(DIA_Nagur_Auftrag);
	Info_AddChoice(DIA_Nagur_Auftrag,"Хорошо, договорились (КОНЕЦ)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice(DIA_Nagur_Auftrag,"Где мне найти Бальтрама?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice(DIA_Nagur_Auftrag,"Когда мне поговорить с Бальтрамом?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice(DIA_Nagur_Auftrag,"Где ферма Акила?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice(DIA_Nagur_Auftrag,"Какой ожидается навар?",DIA_Nagur_Auftrag_Gewinn);
};

func void DIA_Nagur_Auftrag_Akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Где ферма Акила?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Выйдешь из города через восточные ворота, что находятся на рыночной площади.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//Если ты пойдешь по дороге направо, вскоре увидишь лестницу, вырезанную в скале.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Поднимись по ней и окажешься на ферме Акила.
};

func void DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//Какой ожидается навар?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//Не могу сказать точно. Но, я думаю, не менее 400 монет.
};

func void DIA_Nagur_Auftrag_Baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Где мне найти Бальтрама?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//Его прилавок находится на рыночной площади.
};

func void DIA_Nagur_Auftrag_Wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//Когда мне поговорить с Бальтрамом?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//Ты можешь сделать это прямо сейчас. Он уже должен понять, что его посыльный никогда уже не появится. (грязный смех)
};

func void DIA_Nagur_Auftrag_Okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//Хорошо, договорились.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Отлично. Тогда за дело - но если ты попытаешься обмануть меня, тебя будет ждать та же судьба, что и этого посыльного! Не забывай об этом!
	MIS_Nagur_Bote = LOG_Running;
	Log_CreateTopic(TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Nagur,LOG_Running);
	B_LogEntry(TOPIC_Nagur,"Я должен заставить Бальтрама взять меня в качестве мальчика на побегушках. Затем я должен забрать посылку у фермера Акила и принести ее Нагуру.");
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Success(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 5;
	condition = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent = FALSE;
	description = "Я принес пакет.";
};


func int DIA_Nagur_Success_Condition()
{
	if((MIS_Nagur_Bote == LOG_Running) && (Npc_HasItems(other,ItMi_BaltramPaket) >= 1) && (Nagur_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Success_Info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//Я принес пакет.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Отлично. Теперь мне нужно продать его. Заходи завтра.
	B_LogEntry(TOPIC_Nagur,"Нагур получил посылку. Он заплатит мне золотом завтра.");
	AI_StopProcessInfos(self);
	if(B_GiveInvItems(other,self,ItMi_BaltramPaket,1))
	{
		Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();
};


instance DIA_Nagur_Deal(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 6;
	condition = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent = TRUE;
	description = "Ты уже продал товары?";
};


var int DIA_Nagur_Deal_permanent;

func int DIA_Nagur_Deal_Condition()
{
	if((DIA_Nagur_Deal_permanent == FALSE) && (MIS_Nagur_Bote == LOG_Running) && (Nagur_Ausgeliefert == FALSE) && Npc_KnowsInfo(other,DIA_Nagur_Success))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Deal_Info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//Ты уже продал товары?
	if(B_GetDayPlus() > NagurDay)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Да, но за меньшую сумму, чем рассчитывал. Я получил только 300 монет.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//Часть этой суммы пошла моим хозяевам...
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//И Кардиф получил свой обычный процент - плюс золото за то, что он нашел тебя.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//Остается 240 золотых монет. Мы поделим их как договорились. Вот твоя доля.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//Ты хорошо поработал. Я сообщил об этом моим хозяевам.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//Что из этого выйдет - не знаю.
		B_GiveInvItems(self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP(XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = Diebesgilde_Okay + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//Пока еще нет. На это нужно время. Я не хочу продешевить.
	};
};


instance DIA_Nagur_Auftraggeber(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent = FALSE;
	description = "Кто твои хозяева?";
};


func int DIA_Nagur_Auftraggeber_Condition()
{
	if(MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftraggeber_Info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Кто твои хозяева?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//Ты что, действительно думаешь, что я просто так возьму и скажу тебе?
};


instance DIA_Nagur_Fazit(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Fazit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Nagur_Auftraggeber) && Npc_IsInState(self,ZS_Talk) && (Knows_SecretSign == FALSE) && (NagurHack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Fazit_Info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//Дело прошло удачно, но я не говорю о своих хозяевах. Так что можешь расслабиться.
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Knast(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Knast_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (Nagur_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Knast_Info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//Ты предал меня! Это была большая ошибка - а теперь проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Sign(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};


func int DIA_Nagur_Sign_Condition()
{
	if((MIS_Nagur_Bote == LOG_SUCCESS) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//Так тебе удалось это. Теперь ты знаешь, кто мои хозяева.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Не забывай о том, что Кассия говорит тебе - нам не интересно, кто ты такой. Ты один из нас, и только это имеет значение.
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Perm(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Perm_Condition()
{
	if((MIS_Nagur_Bote == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Nagur_Sign) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Perm_Info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Поищи кого-нибудь еще, здесь бродит много народа. А у меня больше ничего нет для тебя.
	AI_StopProcessInfos(self);
};

